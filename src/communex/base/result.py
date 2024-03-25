"""
Result ADT

- `Ok` represents a success.
- `Err` represents a failure.
"""

from dataclasses import dataclass
from typing import Callable, Generic, TypeVar, Protocol, Any

T = TypeVar("T", covariant=True)
E = TypeVar("E", covariant=True)
U = TypeVar("U")


class ResultProto(Generic[T, E], Protocol):
    def is_ok(self) -> bool:
        """
        Returns True if the result is Ok, False otherwise.
        """
        ...

    def ok(self) -> T | None:
        """
        Returns the contained Ok value, or None if the result is an Err.
        """
        ...

    def map(self, f: Callable[[T], U]) -> "Result[U, E]":
        """
        Maps a Result[T, E] to Result[U, E] by applying a function to a
        contained Ok value, leaving an Err value untouched.

        This function can be used to compose the results of two functions.
        """
        ...

    def map_or(self, default: U, f: Callable[[T], U]) -> U:
        """
        Returns the provided default (if Err), or applies a function to the
        contained value (if Ok).
        """
        ...

    def map_err(self, f: Callable[[E], U]) -> "Result[T, U]":
        """
        Maps a Result[T, E] to Result[T, U] by applying a function to a
        contained Err value, leaving an Ok value untouched.

        This function can be used to pass through a successful result while
        transforming an error.
        """
        ...

    def inspect(self, f: Callable[[T], Any]) -> "Result[T, E]":
        """
        Calls the provided function with the contained value (if Ok).
        """
        ...

    def inspect_err(self, f: Callable[[E], Any]) -> "Result[T, E]":
        """
        Calls the provided function with the contained error (if Err).
        """
        ...


@dataclass(frozen=True)
class Ok(Generic[T, E], ResultProto[T, E]):
    value: T

    def __repr__(self) -> str:
        return f"Ok({repr(self.value)})"

    def is_ok(self) -> bool:
        return True

    def ok(self) -> T:
        return self.value

    def map(self, f: Callable[[T], U]) -> "Result[U, E]":
        result = f(self.value)
        return Ok(result)

    def map_or(self, default: U, f: Callable[[T], U]) -> U:
        return f(self.value)

    def map_err(self, f: Callable[[Any], U]) -> "Result[T, E]":
        return self

    def inspect(self, f: Callable[[T], Any]) -> "Result[T, E]":
        f(self.value)
        return self

    def inspect_err(self, f: Callable[[Any], Any]) -> "Result[T, E]":
        return self


@dataclass(frozen=True)
class Err(Generic[T, E], ResultProto[T, E]):
    error: E

    def __repr__(self) -> str:
        return f"Err({repr(self.error)})"

    def is_ok(self) -> bool:
        return False

    def ok(self):
        return None

    def map(self, f: Callable[[T], U]) -> "Result[U, E]":
        return Err(self.error)

    def map_or(self, default: U, f: Callable[[T], U]) -> U:
        return default

    def map_err(self, f: Callable[[E], U]) -> "Result[T, U]":
        return Err(f(self.error))

    def inspect(self, f: Callable[[T], Any]) -> "Result[T, E]":
        return self

    def inspect_err(self, f: Callable[[E], Any]) -> "Result[T, E]":
        f(self.error)
        return self


Result = Ok[T, E] | Err[T, E]


if __name__ == "__main__":
    value_1: Result[int, str] = Ok(42)
    value_2: Result[int, str] = Err("Something went wrong")

    values: list[Result[int, str]] = [value_1, value_2]

    print("# Testing match")
    for value in values:
        match value:
            case Ok(value):
                print(f"Ok: {value}")
            case Err(error):
                print(f"Err: {error}")
    print()

    for value in values:
        print(f"# Testing: {value}")
        v = (value.map(lambda x: x + 1)
            .map_err(lambda x: x + "!")
            .inspect(lambda x: print(f"is an Ok: {x}"))
            .inspect_err(lambda x: print(f"is an Err: {x}"))
        )
        print("is_ok:", v.is_ok())
        print("ok:", v.ok())
        print()

# Unit Tests

This project uses [`Yunit`](https://github.com/Uberi/Yunit/tree/v2) for unit tests. See that repo for usage details.

## Testing Standards
- Unit tests must follow the [[UnitOfWork_StateUnderTest_ExpectedBehavior]](https://osherove.com/blog/2005/4/3/naming-standards-for-unit-tests.html) naming convention. UnitOfWork should refer to the method under test. Ex:
  - `Constructor_PtrIsZero_CreatesNewBuffer`
- Avoid [mocking](https://en.wikipedia.org/wiki/Mock_object) at all costs. There's 20,000 options for test cases here. Pick one.
  > [Grug on testing](https://grugbrain.dev/#grug-on-testing)
  > 
  > also, grug dislike mocking in test, prefer only when absolute necessary to (rare/never) and coarse grain mocking (cut points/systems) only at that
- Group unit tests logically but not excessively. Use good judgement.
- One test suite per tested class
- Inspecting private properties is allowed for unit tests ***and unit tests only***.
  
## Here or the Generator?
There's some nuance to the decision about whether to test in this repo or the generator. Changes to hand-written .ahk scripts that only exist in this repo (e.g. `AhkWin32Struct`, `CSyleArray`) should go here. Smoke tests of the generated classes can also go here. But comprehensive tests, tests of the generator itself, and tests that check the output of the generator (e.g. that it is in fact valid AHK code) should go in the generator.

Use good judgement.
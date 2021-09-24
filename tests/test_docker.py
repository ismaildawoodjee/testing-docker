import pytest

no_tests = "No tests yet"
coming_soon = "Tests coming soon"
test_cases = [(no_tests, "No tests yet"), (coming_soon, "Tests coming soon")]


@pytest.mark.parametrize("test_input, expected", test_cases)
def test_no_tests(test_input, expected):
    assert test_input == expected

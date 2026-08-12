require File.expand_path('../../../test_helper', __FILE__)

class JSONAPIErrorTest < Minitest::Test
  def test_status_code_no_status
    error = JSONAPI::Error.new(code: JSONAPI::BAD_REQUEST)

    assert_equal('0', error.status)
  end

  def test_status_code_accepts_symbol
    error = JSONAPI::Error.new(code: JSONAPI::VALIDATION_ERROR, status: :unprocessable_content)

    assert_equal('422', error.status)
  end

  def test_status_code_accepts_integer
    error = JSONAPI::Error.new(code: JSONAPI::VALIDATION_ERROR, status: 422)

    assert_equal('422', error.status)
  end

  def test_status_code_accepts_string
    error = JSONAPI::Error.new(code: JSONAPI::VALIDATION_ERROR, status: '422')

    assert_equal('422', error.status)
  end

  def test_status_code_rejects_unknown_symbol
    error = assert_raises(ArgumentError) do
      JSONAPI::Error.new(code: JSONAPI::BAD_REQUEST, status: :not_a_real_status)
    end

    assert_equal('Unrecognized status code :not_a_real_status', error.message)
  end

  def test_status_code_handles_nil
    error = JSONAPI::Error.new(code: JSONAPI::BAD_REQUEST, status: nil)

    assert_equal('0', error.status)
  end
end

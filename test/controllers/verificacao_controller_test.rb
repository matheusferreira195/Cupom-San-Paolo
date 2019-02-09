require 'test_helper'

class VerificacaoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get verificacao_index_url
    assert_response :success
  end

end

require 'helper'

module Arel
  module Nodes
    class TestInfixOperation < MiniTest::Unit::TestCase
      def test_construct
        operation = InfixOperation.new :+, 1, 2
        assert_equal :+, operation.operator
        assert_equal 1, operation.left
        assert_equal 2, operation.right
      end

      def test_operation_alias
        operation = InfixOperation.new :+, 1, 2
        aliaz = operation.as('zomg')
        assert_kind_of As, aliaz
        assert_equal operation, aliaz.left
        assert_equal 'zomg', aliaz.right
      end

      def test_opertaion_ordering
        operation = InfixOperation.new :+, 1, 2
        ordering = operation.desc
        assert_kind_of Ordering, ordering
        assert_equal operation, ordering.expr
        assert_equal :desc, ordering.direction
      end
    end
  end
end

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that describe query tokens used in the GetAnalysis method.
 * @see https://learn.microsoft.com/windows/win32/api/wmiutils/ne-wmiutils-wmiq_rpn_token_flags
 * @namespace Windows.Win32.System.Wmi
 */
class WMIQ_RPN_TOKEN_FLAGS extends Win32Enum {

    /**
     * This token is an expression, for example, J = 7.
     * Native name: WMIQ_RPN_TOKEN_EXPRESSION
     * @type {Integer (Int32)}
     */
    static EXPRESSION => 1

    /**
     * This token is a logical AND.
     * Native name: WMIQ_RPN_TOKEN_AND
     * @type {Integer (Int32)}
     */
    static AND => 2

    /**
     * This token is a logical OR.
     * Native name: WMIQ_RPN_TOKEN_OR
     * @type {Integer (Int32)}
     */
    static OR => 3

    /**
     * This token is a logical NOT.
     * Native name: WMIQ_RPN_TOKEN_NOT
     * @type {Integer (Int32)}
     */
    static NOT => 4

    /**
     * The operator is undefined or unknown.
     * Native name: WMIQ_RPN_OP_UNDEFINED
     * @type {Integer (Int32)}
     */
    static OP_UNDEFINED => 0

    /**
     * The operator is  equal-to  (=).
     * Native name: WMIQ_RPN_OP_EQ
     * @type {Integer (Int32)}
     */
    static OP_EQ => 1

    /**
     * The operator is  not-equal-to  (&lt;&gt;).
     * Native name: WMIQ_RPN_OP_NE
     * @type {Integer (Int32)}
     */
    static OP_NE => 2

    /**
     * The operator is  greater-than-or-equal-to  (&gt;=).
     * Native name: WMIQ_RPN_OP_GE
     * @type {Integer (Int32)}
     */
    static OP_GE => 3

    /**
     * The operator is  less-than-or-equal-to  (&lt;=).
     * Native name: WMIQ_RPN_OP_LE
     * @type {Integer (Int32)}
     */
    static OP_LE => 4

    /**
     * The operator is  less-than (&lt;) .
     * Native name: WMIQ_RPN_OP_LT
     * @type {Integer (Int32)}
     */
    static OP_LT => 5

    /**
     * The operator is  greater-than  (&gt;).
     * Native name: WMIQ_RPN_OP_GT
     * @type {Integer (Int32)}
     */
    static OP_GT => 6

    /**
     * The operator is  LIKE.
     * Native name: WMIQ_RPN_OP_LIKE
     * @type {Integer (Int32)}
     */
    static OP_LIKE => 7

    /**
     * The operator is  ISA.
     * Native name: WMIQ_RPN_OP_ISA
     * @type {Integer (Int32)}
     */
    static OP_ISA => 8

    /**
     * The operator is  ISNOTA.
     * Native name: WMIQ_RPN_OP_ISNOTA
     * @type {Integer (Int32)}
     */
    static OP_ISNOTA => 9

    /**
     * The operator is  ISNULL.
     * Native name: WMIQ_RPN_OP_ISNULL
     * @type {Integer (Int32)}
     */
    static OP_ISNULL => 10

    /**
     * The operator is  ISNOTNULL.
     * Native name: WMIQ_RPN_OP_ISNOTNULL
     * @type {Integer (Int32)}
     */
    static OP_ISNOTNULL => 11

    /**
     * Left argument is a property name.
     * Native name: WMIQ_RPN_LEFT_PROPERTY_NAME
     * @type {Integer (Int32)}
     */
    static LEFT_PROPERTY_NAME => 1

    /**
     * Right argument is a property name.
     * Native name: WMIQ_RPN_RIGHT_PROPERTY_NAME
     * @type {Integer (Int32)}
     */
    static RIGHT_PROPERTY_NAME => 2

    /**
     * Has a second constant. Used with "BETWEEN" clauses.
     * Native name: WMIQ_RPN_CONST2
     * @type {Integer (Int32)}
     */
    static CONST2 => 4

    /**
     * Has a constant.
     * Native name: WMIQ_RPN_CONST
     * @type {Integer (Int32)}
     */
    static CONST => 8

    /**
     * The field <b>m_uOperator</b> is not 0 (zero).
     * Native name: WMIQ_RPN_RELOP
     * @type {Integer (Int32)}
     */
    static RELOP => 16

    /**
     * Left argument is a function.
     * Native name: WMIQ_RPN_LEFT_FUNCTION
     * @type {Integer (Int32)}
     */
    static LEFT_FUNCTION => 32

    /**
     * Right argument is a function.
     * Native name: WMIQ_RPN_RIGHT_FUNCTION
     * @type {Integer (Int32)}
     */
    static RIGHT_FUNCTION => 64

    /**
     * Reserved for future use.
     * Native name: WMIQ_RPN_GET_TOKEN_TYPE
     * @type {Integer (Int32)}
     */
    static GET_TOKEN_TYPE => 1

    /**
     * Reserved for future use.
     * Native name: WMIQ_RPN_GET_EXPR_SHAPE
     * @type {Integer (Int32)}
     */
    static GET_EXPR_SHAPE => 2

    /**
     * Reserved for future use.
     * Native name: WMIQ_RPN_GET_LEFT_FUNCTION
     * @type {Integer (Int32)}
     */
    static GET_LEFT_FUNCTION => 3

    /**
     * Reserved for future use.
     * Native name: WMIQ_RPN_GET_RIGHT_FUNCTION
     * @type {Integer (Int32)}
     */
    static GET_RIGHT_FUNCTION => 4

    /**
     * Reserved for future use.
     * Native name: WMIQ_RPN_GET_RELOP
     * @type {Integer (Int32)}
     */
    static GET_RELOP => 5

    /**
     * Reserved for future use.
     * Native name: WMIQ_RPN_NEXT_TOKEN
     * @type {Integer (Int32)}
     */
    static NEXT_TOKEN => 1

    /**
     * FROM clause contains a single class.
     * Native name: WMIQ_RPN_FROM_UNARY
     * @type {Integer (Int32)}
     */
    static FROM_UNARY => 1

    /**
     * FROM clause contains an object path.
     * Native name: WMIQ_RPN_FROM_PATH
     * @type {Integer (Int32)}
     */
    static FROM_PATH => 2

    /**
     * FROM clause contains a list of classes.
     * Native name: WMIQ_RPN_FROM_CLASS_LIST
     * @type {Integer (Int32)}
     */
    static FROM_CLASS_LIST => 4

    /**
     * Reserved for future use.
     * Native name: WMIQ_RPN_FROM_MULTIPLE
     * @type {Integer (Int32)}
     */
    static FROM_MULTIPLE => 8
}

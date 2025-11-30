#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that describe query tokens used in the GetAnalysis method.
 * @see https://docs.microsoft.com/windows/win32/api//wmiutils/ne-wmiutils-wmiq_rpn_token_flags
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WMIQ_RPN_TOKEN_FLAGS extends Win32Enum{

    /**
     * This token is an expression, for example, J = 7.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_TOKEN_EXPRESSION => 1

    /**
     * This token is a logical AND.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_TOKEN_AND => 2

    /**
     * This token is a logical OR.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_TOKEN_OR => 3

    /**
     * This token is a logical NOT.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_TOKEN_NOT => 4

    /**
     * The operator is undefined or unknown.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_OP_UNDEFINED => 0

    /**
     * The operator is  equal-to  (=).
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_OP_EQ => 1

    /**
     * The operator is  not-equal-to  (&lt;&gt;).
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_OP_NE => 2

    /**
     * The operator is  greater-than-or-equal-to  (&gt;=).
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_OP_GE => 3

    /**
     * The operator is  less-than-or-equal-to  (&lt;=).
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_OP_LE => 4

    /**
     * The operator is  less-than (&lt;) .
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_OP_LT => 5

    /**
     * The operator is  greater-than  (&gt;).
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_OP_GT => 6

    /**
     * The operator is  LIKE.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_OP_LIKE => 7

    /**
     * The operator is  ISA.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_OP_ISA => 8

    /**
     * The operator is  ISNOTA.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_OP_ISNOTA => 9

    /**
     * The operator is  ISNULL.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_OP_ISNULL => 10

    /**
     * The operator is  ISNOTNULL.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_OP_ISNOTNULL => 11

    /**
     * Left argument is a property name.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_LEFT_PROPERTY_NAME => 1

    /**
     * Right argument is a property name.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_RIGHT_PROPERTY_NAME => 2

    /**
     * Has a second constant. Used with "BETWEEN" clauses.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_CONST2 => 4

    /**
     * Has a constant.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_CONST => 8

    /**
     * The field <b>m_uOperator</b> is not 0 (zero).
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_RELOP => 16

    /**
     * Left argument is a function.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_LEFT_FUNCTION => 32

    /**
     * Right argument is a function.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_RIGHT_FUNCTION => 64

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_GET_TOKEN_TYPE => 1

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_GET_EXPR_SHAPE => 2

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_GET_LEFT_FUNCTION => 3

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_GET_RIGHT_FUNCTION => 4

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_GET_RELOP => 5

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_NEXT_TOKEN => 1

    /**
     * FROM clause contains a single class.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_FROM_UNARY => 1

    /**
     * FROM clause contains an object path.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_FROM_PATH => 2

    /**
     * FROM clause contains a list of classes.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_FROM_CLASS_LIST => 4

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static WMIQ_RPN_FROM_MULTIPLE => 8
}

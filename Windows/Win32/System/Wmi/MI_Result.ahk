#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_result
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Result{

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_FAILED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_ACCESS_DENIED => 2

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_INVALID_NAMESPACE => 3

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_INVALID_PARAMETER => 4

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_INVALID_CLASS => 5

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_NOT_FOUND => 6

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_NOT_SUPPORTED => 7

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_CLASS_HAS_CHILDREN => 8

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_CLASS_HAS_INSTANCES => 9

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_INVALID_SUPERCLASS => 10

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_ALREADY_EXISTS => 11

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_NO_SUCH_PROPERTY => 12

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_TYPE_MISMATCH => 13

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_QUERY_LANGUAGE_NOT_SUPPORTED => 14

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_INVALID_QUERY => 15

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_METHOD_NOT_AVAILABLE => 16

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_METHOD_NOT_FOUND => 17

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_NAMESPACE_NOT_EMPTY => 20

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_INVALID_ENUMERATION_CONTEXT => 21

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_INVALID_OPERATION_TIMEOUT => 22

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_PULL_HAS_BEEN_ABANDONED => 23

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_PULL_CANNOT_BE_ABANDONED => 24

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_FILTERED_ENUMERATION_NOT_SUPPORTED => 25

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_CONTINUATION_ON_ERROR_NOT_SUPPORTED => 26

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_SERVER_LIMITS_EXCEEDED => 27

    /**
     * @type {Integer (Int32)}
     */
    static MI_RESULT_SERVER_IS_SHUTTING_DOWN => 28
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines function return codes.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_result
 * @namespace Windows.Win32.System.Wmi
 */
class MI_Result extends Win32Enum {

    /**
     * The operation was successful.
     * Native name: MI_RESULT_OK
     * @type {Integer (Int32)}
     */
    static OK => 0

    /**
     * A general error occurred, not covered by a more specific error code.
     * Native name: MI_RESULT_FAILED
     * @type {Integer (Int32)}
     */
    static FAILED => 1

    /**
     * Access to a CIM resource is not available to the client. Reasons for this might be not having enough permissions to access the requested resources while carrying out the operation, 
     * or calling APIs with inconsistent identities. An example of the latter would be creating an <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_session">MI_Session</a> with one identity while trying to carry out an operation on the same session with a different identity.
     * Native name: MI_RESULT_ACCESS_DENIED
     * @type {Integer (Int32)}
     */
    static ACCESS_DENIED => 2

    /**
     * The target namespace does not exist.
     * Native name: MI_RESULT_INVALID_NAMESPACE
     * @type {Integer (Int32)}
     */
    static INVALID_NAMESPACE => 3

    /**
     * One or more parameter values passed to the method are not valid.
     * Native name: MI_RESULT_INVALID_PARAMETER
     * @type {Integer (Int32)}
     */
    static INVALID_PARAMETER => 4

    /**
     * The specified class does not exist.
     * Native name: MI_RESULT_INVALID_CLASS
     * @type {Integer (Int32)}
     */
    static INVALID_CLASS => 5

    /**
     * The requested object cannot be found.
     * Native name: MI_RESULT_NOT_FOUND
     * @type {Integer (Int32)}
     */
    static NOT_FOUND => 6

    /**
     * The requested operation is not supported.
     * Native name: MI_RESULT_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static NOT_SUPPORTED => 7

    /**
     * The operation cannot be invoked because the class has subclasses.
     * Native name: MI_RESULT_CLASS_HAS_CHILDREN
     * @type {Integer (Int32)}
     */
    static CLASS_HAS_CHILDREN => 8

    /**
     * The operation cannot be invoked because the class has instances.
     * Native name: MI_RESULT_CLASS_HAS_INSTANCES
     * @type {Integer (Int32)}
     */
    static CLASS_HAS_INSTANCES => 9

    /**
     * The operation cannot be invoked because the superclass does not exist.
     * Native name: MI_RESULT_INVALID_SUPERCLASS
     * @type {Integer (Int32)}
     */
    static INVALID_SUPERCLASS => 10

    /**
     * The operation cannot be invoked because an object already exists.
     * Native name: MI_RESULT_ALREADY_EXISTS
     * @type {Integer (Int32)}
     */
    static ALREADY_EXISTS => 11

    /**
     * The specified property does not exist.
     * Native name: MI_RESULT_NO_SUCH_PROPERTY
     * @type {Integer (Int32)}
     */
    static NO_SUCH_PROPERTY => 12

    /**
     * The value supplied is not compatible with the type.
     * Native name: MI_RESULT_TYPE_MISMATCH
     * @type {Integer (Int32)}
     */
    static TYPE_MISMATCH => 13

    /**
     * The query language is not recognized or supported.
     * Native name: MI_RESULT_QUERY_LANGUAGE_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static QUERY_LANGUAGE_NOT_SUPPORTED => 14

    /**
     * The query is not valid for the specified query language.
     * Native name: MI_RESULT_INVALID_QUERY
     * @type {Integer (Int32)}
     */
    static INVALID_QUERY => 15

    /**
     * The extrinsic method cannot be invoked.
     * Native name: MI_RESULT_METHOD_NOT_AVAILABLE
     * @type {Integer (Int32)}
     */
    static METHOD_NOT_AVAILABLE => 16

    /**
     * The specified extrinsic method does not exist.
     * Native name: MI_RESULT_METHOD_NOT_FOUND
     * @type {Integer (Int32)}
     */
    static METHOD_NOT_FOUND => 17

    /**
     * The specified namespace is not empty.
     * Native name: MI_RESULT_NAMESPACE_NOT_EMPTY
     * @type {Integer (Int32)}
     */
    static NAMESPACE_NOT_EMPTY => 20

    /**
     * The enumeration identified by the specified context is not valid.
     * Native name: MI_RESULT_INVALID_ENUMERATION_CONTEXT
     * @type {Integer (Int32)}
     */
    static INVALID_ENUMERATION_CONTEXT => 21

    /**
     * The specified operation time-out is not supported by the CIM Server.
     * Native name: MI_RESULT_INVALID_OPERATION_TIMEOUT
     * @type {Integer (Int32)}
     */
    static INVALID_OPERATION_TIMEOUT => 22

    /**
     * The pull operation has been abandoned.
     * Native name: MI_RESULT_PULL_HAS_BEEN_ABANDONED
     * @type {Integer (Int32)}
     */
    static PULL_HAS_BEEN_ABANDONED => 23

    /**
     * The attempt to abandon a concurrent pull operation failed.
     * Native name: MI_RESULT_PULL_CANNOT_BE_ABANDONED
     * @type {Integer (Int32)}
     */
    static PULL_CANNOT_BE_ABANDONED => 24

    /**
     * Using a filter in the enumeration is not supported by the CIM server.
     * Native name: MI_RESULT_FILTERED_ENUMERATION_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static FILTERED_ENUMERATION_NOT_SUPPORTED => 25

    /**
     * The CIM server does not support continuation on error.
     * Native name: MI_RESULT_CONTINUATION_ON_ERROR_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static CONTINUATION_ON_ERROR_NOT_SUPPORTED => 26

    /**
     * The operation failed because server limits were exceeded.
     * Native name: MI_RESULT_SERVER_LIMITS_EXCEEDED
     * @type {Integer (Int32)}
     */
    static SERVER_LIMITS_EXCEEDED => 27

    /**
     * The CIM server is shutting down and cannot process the operation.
     * Native name: MI_RESULT_SERVER_IS_SHUTTING_DOWN
     * @type {Integer (Int32)}
     */
    static SERVER_IS_SHUTTING_DOWN => 28
}

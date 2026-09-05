#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This enumeration defines error categories for the CIM extensions.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_errorcategory
 * @namespace Windows.Win32.System.Wmi
 */
class MI_ErrorCategory extends Win32Enum {

    /**
     * Use only when not enough is known about the error to assign it to another error category. Avoid using this category if you have any information about the error, even if that information is incomplete.
     * Native name: MI_ERRORCATEGORY_NOT_SPECIFIED
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_NOT_SPECIFIED => 0

    /**
     * An error that occurs when opening.
     * Native name: MI_ERRORCATEGORY_OPEN_ERROR
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_OPEN_ERROR => 1

    /**
     * An error that occurs when closing.
     * Native name: MI_ERRORCATEGORY_CLOS_EERROR
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_CLOS_EERROR => 2

    /**
     * An error that occurs when a device reports an error.
     * Native name: MI_ERRORCATEGORY_DEVICE_ERROR
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_DEVICE_ERROR => 3

    /**
     * An error that occurs when a deadlock is detected.
     * Native name: MI_ERRORCATEGORY_DEADLOCK_DETECTED
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_DEADLOCK_DETECTED => 4

    /**
     * An error that occurs when an argument that is not valid is specified.
     * Native name: MI_ERRORCATEGORY_INVALID_ARGUMENT
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_INVALID_ARGUMENT => 5

    /**
     * An error that occurs when data that is not valid is specified.
     * Native name: MI_ERRORCATEGORY_INVALID_DATA
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_INVALID_DATA => 6

    /**
     * An error that occurs when an operation that is not valid is requested.
     * Native name: MI_ERRORCATEGORY_INVALID_OPERATION
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_INVALID_OPERATION => 7

    /**
     * An error that occurs when a result that is not valid is returned.
     * Native name: MI_ERRORCATEGORY_INVALID_RESULT
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_INVALID_RESULT => 8

    /**
     * An error that occurs when a .NET Framework type that is not valid is specified.
     * Native name: MI_ERRORCATEGORY_INVALID_TYPE
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_INVALID_TYPE => 9

    /**
     * An error that occurs when metadata contains an error.
     * Native name: MI_ERRORCATEGORY_METADATA_ERROR
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_METADATA_ERROR => 10

    /**
     * An error that occurs when a referenced application programming interface (API) is not implemented.
     * Native name: MI_ERRORCATEGORY_NOT_IMPLEMENTED
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_NOT_IMPLEMENTED => 11

    /**
     * An error that occurs when an item is not installed.
     * Native name: MI_ERRORCATEGORY_NOT_INSTALLED
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_NOT_INSTALLED => 12

    /**
     * An error that occurs when an object cannot be found.
     * Native name: MI_ERRORCATEGORY_OBJECT_NOT_FOUND
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_OBJECT_NOT_FOUND => 13

    /**
     * An error that occurs when an operation has stopped. For example, the user interrupts the operation.
     * Native name: MI_ERRORCATEGORY_OPERATION_STOPPED
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_OPERATION_STOPPED => 14

    /**
     * An error that occurs when an operation has exceeded its timeout limit.
     * Native name: MI_ERRORCATEGORY_OPERATION_TIMEOUT
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_OPERATION_TIMEOUT => 15

    /**
     * An error that occurs when a command is syntactically incorrect.
     * Native name: MI_ERRORCATEGORY_SYNTAX_ERROR
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_SYNTAX_ERROR => 16

    /**
     * An error that occurs when a parser encounters an error.
     * Native name: MI_ERRORCATEGORY_PARSER_ERROR
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_PARSER_ERROR => 17

    /**
     * An error that occurs when an operation is not permitted.
     * Native name: MI_ERRORCATEGORY_ACCESS_DENIED
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_ACCESS_DENIED => 18

    /**
     * An error that occurs when a resource already exists.
     * Native name: MI_ERRORCATEGORY_RESOURCE_BUSY
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_RESOURCE_BUSY => 19

    /**
     * An error that occurs when a resource is busy.
     * Native name: MI_ERRORCATEGORY_RESOURCE_EXISTS
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_RESOURCE_EXISTS => 20

    /**
     * An error that occurs when a resource is unavailable.
     * Native name: MI_ERRORCATEGORY_RESOURCE_UNAVAILABLE
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_RESOURCE_UNAVAILABLE => 21

    /**
     * An error that occurs when reading.
     * Native name: MI_ERRORCATEGORY_READ_ERROR
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_READ_ERROR => 22

    /**
     * Native name: MI_ERRORCATEGORY_WRITE_ERROR
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_WRITE_ERROR => 23

    /**
     * Native name: MI_ERRORCATEGORY_FROM_STDERR
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_FROM_STDERR => 24

    /**
     * An error that occurs when a security violation occurs.
     * Native name: MI_ERRORCATEGORY_SECURITY_ERROR
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_SECURITY_ERROR => 25

    /**
     * Native name: MI_ERRORCATEGORY_PROTOCOL_ERROR
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_PROTOCOL_ERROR => 26

    /**
     * Native name: MI_ERRORCATEGORY_CONNECTION_ERROR
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_CONNECTION_ERROR => 27

    /**
     * Native name: MI_ERRORCATEGORY_AUTHENTICATION_ERROR
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_AUTHENTICATION_ERROR => 28

    /**
     * Native name: MI_ERRORCATEGORY_LIMITS_EXCEEDED
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_LIMITS_EXCEEDED => 29

    /**
     * Native name: MI_ERRORCATEGORY_QUOTA_EXCEEDED
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_QUOTA_EXCEEDED => 30

    /**
     * Native name: MI_ERRORCATEGORY_NOT_ENABLED
     * @type {Integer (Int32)}
     */
    static ERRORCATEGORY_NOT_ENABLED => 31
}

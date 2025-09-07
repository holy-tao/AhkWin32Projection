#Requires AutoHotkey v2.0.0 64-bit

/**
 * This enumeration defines error categories for the CIM extensions.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_errorcategory
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_ErrorCategory{

    /**
     * Use only when not enough is known about the error to assign it to another error category. Avoid using this category if you have any information about the error, even if that information is incomplete.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_NOT_SPECIFIED => 0

    /**
     * An error that occurs when opening.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_OPEN_ERROR => 1

    /**
     * An error that occurs when closing.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_CLOS_EERROR => 2

    /**
     * An error that occurs when a device reports an error.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_DEVICE_ERROR => 3

    /**
     * An error that occurs when a deadlock is detected.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_DEADLOCK_DETECTED => 4

    /**
     * An error that occurs when an argument that is not valid is specified.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_INVALID_ARGUMENT => 5

    /**
     * An error that occurs when data that is not valid is specified.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_INVALID_DATA => 6

    /**
     * An error that occurs when an operation that is not valid is requested.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_INVALID_OPERATION => 7

    /**
     * An error that occurs when a result that is not valid is returned.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_INVALID_RESULT => 8

    /**
     * An error that occurs when a .NET Framework type that is not valid is specified.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_INVALID_TYPE => 9

    /**
     * An error that occurs when metadata contains an error.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_METADATA_ERROR => 10

    /**
     * An error that occurs when a referenced application programming interface (API) is not implemented.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_NOT_IMPLEMENTED => 11

    /**
     * An error that occurs when an item is not installed.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_NOT_INSTALLED => 12

    /**
     * An error that occurs when an object cannot be found.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_OBJECT_NOT_FOUND => 13

    /**
     * An error that occurs when an operation has stopped. For example, the user interrupts the operation.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_OPERATION_STOPPED => 14

    /**
     * An error that occurs when an operation has exceeded its timeout limit.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_OPERATION_TIMEOUT => 15

    /**
     * An error that occurs when a command is syntactically incorrect.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_SYNTAX_ERROR => 16

    /**
     * An error that occurs when a parser encounters an error.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_PARSER_ERROR => 17

    /**
     * An error that occurs when an operation is not permitted.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_ACCESS_DENIED => 18

    /**
     * An error that occurs when a resource already exists.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_RESOURCE_BUSY => 19

    /**
     * An error that occurs when a resource is busy.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_RESOURCE_EXISTS => 20

    /**
     * An error that occurs when a resource is unavailable.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_RESOURCE_UNAVAILABLE => 21

    /**
     * An error that occurs when reading.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_READ_ERROR => 22

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_WRITE_ERROR => 23

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_FROM_STDERR => 24

    /**
     * An error that occurs when a security violation occurs.
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_SECURITY_ERROR => 25

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_PROTOCOL_ERROR => 26

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_CONNECTION_ERROR => 27

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_AUTHENTICATION_ERROR => 28

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_LIMITS_EXCEEDED => 29

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_QUOTA_EXCEEDED => 30

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MI_ERRORCATEGORY_NOT_ENABLED => 31
}

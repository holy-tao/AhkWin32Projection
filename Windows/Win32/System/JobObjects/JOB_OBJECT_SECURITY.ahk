#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOB_OBJECT_SECURITY extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_SECURITY_NO_ADMIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_SECURITY_RESTRICTED_TOKEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_SECURITY_ONLY_TOKEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_SECURITY_FILTER_TOKENS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_SECURITY_VALID_FLAGS => 15
}

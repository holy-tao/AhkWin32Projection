#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 */
class JOB_OBJECT_SECURITY extends Win32BitflagEnum {

    /**
     * Native name: JOB_OBJECT_SECURITY_NO_ADMIN
     * @type {Integer (UInt32)}
     */
    static NO_ADMIN => 1

    /**
     * Native name: JOB_OBJECT_SECURITY_RESTRICTED_TOKEN
     * @type {Integer (UInt32)}
     */
    static RESTRICTED_TOKEN => 2

    /**
     * Native name: JOB_OBJECT_SECURITY_ONLY_TOKEN
     * @type {Integer (UInt32)}
     */
    static ONLY_TOKEN => 4

    /**
     * Native name: JOB_OBJECT_SECURITY_FILTER_TOKENS
     * @type {Integer (UInt32)}
     */
    static FILTER_TOKENS => 8

    /**
     * Native name: JOB_OBJECT_SECURITY_VALID_FLAGS
     * @type {Integer (UInt32)}
     */
    static VALID_FLAGS => 15
}

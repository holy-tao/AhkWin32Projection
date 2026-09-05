#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 */
class CRED_PERSIST extends Win32Enum {

    /**
     * Native name: CRED_PERSIST_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Native name: CRED_PERSIST_SESSION
     * @type {Integer (UInt32)}
     */
    static SESSION => 1

    /**
     * Native name: CRED_PERSIST_LOCAL_MACHINE
     * @type {Integer (UInt32)}
     */
    static LOCAL_MACHINE => 2

    /**
     * Native name: CRED_PERSIST_ENTERPRISE
     * @type {Integer (UInt32)}
     */
    static ENTERPRISE => 3
}

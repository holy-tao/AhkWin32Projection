#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class CRED_PERSIST{

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_PERSIST_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_PERSIST_SESSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_PERSIST_LOCAL_MACHINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRED_PERSIST_ENTERPRISE => 3
}

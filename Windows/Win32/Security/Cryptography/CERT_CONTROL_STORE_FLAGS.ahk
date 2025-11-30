#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_CONTROL_STORE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_CTRL_COMMIT_FORCE_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_CTRL_COMMIT_CLEAR_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_CTRL_INHIBIT_DUPLICATE_HANDLE_FLAG => 1
}

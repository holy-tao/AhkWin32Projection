#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_CONTROL_STORE_FLAGS extends Win32Enum {

    /**
     * Native name: CERT_STORE_CTRL_COMMIT_FORCE_FLAG
     * @type {Integer (UInt32)}
     */
    static CTRL_COMMIT_FORCE_FLAG => 1

    /**
     * Native name: CERT_STORE_CTRL_COMMIT_CLEAR_FLAG
     * @type {Integer (UInt32)}
     */
    static CTRL_COMMIT_CLEAR_FLAG => 2

    /**
     * Native name: CERT_STORE_CTRL_INHIBIT_DUPLICATE_HANDLE_FLAG
     * @type {Integer (UInt32)}
     */
    static CTRL_INHIBIT_DUPLICATE_HANDLE_FLAG => 1
}

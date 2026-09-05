#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class XEKL_KEYSIZE extends Win32Enum {

    /**
     * Native name: XEKL_KEYSIZE_MIN
     * @type {Integer (Int32)}
     */
    static MIN => 1

    /**
     * Native name: XEKL_KEYSIZE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 2

    /**
     * Native name: XEKL_KEYSIZE_INC
     * @type {Integer (Int32)}
     */
    static INC => 3
}

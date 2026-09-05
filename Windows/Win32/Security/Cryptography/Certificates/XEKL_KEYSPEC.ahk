#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class XEKL_KEYSPEC extends Win32Enum {

    /**
     * Native name: XEKL_KEYSPEC_KEYX
     * @type {Integer (Int32)}
     */
    static KEYX => 1

    /**
     * Native name: XEKL_KEYSPEC_SIG
     * @type {Integer (Int32)}
     */
    static SIG => 2
}

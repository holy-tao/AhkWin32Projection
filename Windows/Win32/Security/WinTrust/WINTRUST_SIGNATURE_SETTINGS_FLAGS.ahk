#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
class WINTRUST_SIGNATURE_SETTINGS_FLAGS extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static WSS_VERIFY_SPECIFIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WSS_GET_SECONDARY_SIG_COUNT => 2
}

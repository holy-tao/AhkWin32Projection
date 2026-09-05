#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 */
class CRED_ENUMERATE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CRED_ENUMERATE_ALL_CREDENTIALS
     * @type {Integer (UInt32)}
     */
    static ALL_CREDENTIALS => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCW_REGISTRATION_FLAGS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static PcwRegistrationNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static PcwRegistrationSiloNeutral => 1
}

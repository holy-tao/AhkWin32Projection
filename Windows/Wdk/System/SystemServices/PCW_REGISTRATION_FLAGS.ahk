#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCW_REGISTRATION_FLAGS extends Win32Enum {

    /**
     * Native name: PcwRegistrationNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: PcwRegistrationSiloNeutral
     * @type {Integer (Int32)}
     */
    static SiloNeutral => 1
}

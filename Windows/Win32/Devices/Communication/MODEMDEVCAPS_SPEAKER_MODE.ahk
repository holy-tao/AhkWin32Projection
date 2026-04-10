#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Communication
 */
class MODEMDEVCAPS_SPEAKER_MODE extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static MDMSPKRFLAG_CALLSETUP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MDMSPKRFLAG_DIAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDMSPKRFLAG_OFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDMSPKRFLAG_ON => 4
}

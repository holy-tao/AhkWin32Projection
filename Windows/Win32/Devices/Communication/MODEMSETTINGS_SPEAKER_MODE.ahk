#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class MODEMSETTINGS_SPEAKER_MODE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MDMSPKR_CALLSETUP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MDMSPKR_DIAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDMSPKR_OFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDMSPKR_ON => 4
}

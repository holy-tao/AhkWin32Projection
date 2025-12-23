#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class MODEMDEVCAPS_SPEAKER_VOLUME extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static MDMVOLFLAG_HIGH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MDMVOLFLAG_LOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDMVOLFLAG_MEDIUM => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class MODEM_SPEAKER_VOLUME extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MDMVOL_HIGH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDMVOL_LOW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDMVOL_MEDIUM => 1
}

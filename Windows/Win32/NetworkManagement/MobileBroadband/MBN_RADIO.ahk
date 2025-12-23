#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_RADIO enumerated type indicates whether the device radio is on or off.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_radio
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_RADIO extends Win32Enum{

    /**
     * The device radio is off.
     * @type {Integer (Int32)}
     */
    static MBN_RADIO_OFF => 0

    /**
     * The device radio is on.
     * @type {Integer (Int32)}
     */
    static MBN_RADIO_ON => 1
}

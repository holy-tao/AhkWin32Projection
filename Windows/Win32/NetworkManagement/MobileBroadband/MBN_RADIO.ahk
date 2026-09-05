#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_RADIO enumerated type indicates whether the device radio is on or off.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_radio
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_RADIO extends Win32Enum {

    /**
     * The device radio is off.
     * Native name: MBN_RADIO_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * The device radio is on.
     * Native name: MBN_RADIO_ON
     * @type {Integer (Int32)}
     */
    static ON => 1
}

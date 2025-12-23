#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMPDeviceStatus enumeration type defines the possible values for the current status of a device. To use this enumeration, you must create a remoted instance of the Windows Media Player 10 or later control.
 * @remarks
 * Windows Media Player 10 Mobile: This enumeration is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/ne-wmp-wmpdevicestatus
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPDeviceStatus extends Win32Enum{

    /**
     * Not a valid status.
     * @type {Integer (Int32)}
     */
    static wmpdsUnknown => 0

    /**
     * A partnership between Windows Media Player and the device exists.
     * @type {Integer (Int32)}
     */
    static wmpdsPartnershipExists => 1

    /**
     * The user declined to create a partnership with the device. A device will also have this status when the partnership was deleted programmatically by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpsyncdevice-deletepartnership">IWMPSyncDevice::deletePartnership</a>.
     * @type {Integer (Int32)}
     */
    static wmpdsPartnershipDeclined => 2

    /**
     * A partnership exists with another computer or user. Windows Media Player 10 or later allows one partnership with one computer per device.
     * @type {Integer (Int32)}
     */
    static wmpdsPartnershipAnother => 3

    /**
     * The current device supports manual transfers only.
     * @type {Integer (Int32)}
     */
    static wmpdsManualDevice => 4

    /**
     * The device is a new device; Windows Media Player has information stored for the device.
     * @type {Integer (Int32)}
     */
    static wmpdsNewDevice => 5

    /**
     * Last enumerated value. Not a valid device state.
     * @type {Integer (Int32)}
     */
    static wmpdsLast => 6
}

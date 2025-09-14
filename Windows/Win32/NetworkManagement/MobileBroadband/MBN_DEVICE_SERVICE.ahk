#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MBN_DEVICE_SERVICE structure provides information about a Mobile Broadband device service.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ns-mbnapi-mbn_device_service
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_DEVICE_SERVICE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A string that represents the unique ID of a Mobile Broadband device service. This matches the Device Service UUID reported by the Mobile Broadband device.
     * @type {Pointer<BSTR>}
     */
    deviceServiceID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * if <b>TRUE</b>, this device service supports write on bulk data sessions. Otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    dataWriteSupported {
        get => NumGet(this, 8, "short")
        set => NumPut("short", value, this, 8)
    }

    /**
     * if <b>TRUE</b>, this device service supports read on bulk data sessions. Otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    dataReadSupported {
        get => NumGet(this, 10, "short")
        set => NumPut("short", value, this, 10)
    }
}

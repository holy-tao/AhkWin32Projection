#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk

/**
 * The MBN_DEVICE_SERVICE structure provides information about a Mobile Broadband device service.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ns-mbnapi-mbn_device_service
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_DEVICE_SERVICE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A string that represents the unique ID of a Mobile Broadband device service. This matches the Device Service UUID reported by the Mobile Broadband device.
     * @type {BSTR}
     */
    deviceServiceID{
        get {
            if(!this.HasProp("__deviceServiceID"))
                this.__deviceServiceID := BSTR(this.ptr + 0)
            return this.__deviceServiceID
        }
    }

    /**
     * if <b>TRUE</b>, this device service supports write on bulk data sessions. Otherwise, <b>FALSE</b>.
     * @type {VARIANT_BOOL}
     */
    dataWriteSupported{
        get {
            if(!this.HasProp("__dataWriteSupported"))
                this.__dataWriteSupported := VARIANT_BOOL(this.ptr + 8)
            return this.__dataWriteSupported
        }
    }

    /**
     * if <b>TRUE</b>, this device service supports read on bulk data sessions. Otherwise, <b>FALSE</b>.
     * @type {VARIANT_BOOL}
     */
    dataReadSupported{
        get {
            if(!this.HasProp("__dataReadSupported"))
                this.__dataReadSupported := VARIANT_BOOL(this.ptr + 10)
            return this.__dataReadSupported
        }
    }
}

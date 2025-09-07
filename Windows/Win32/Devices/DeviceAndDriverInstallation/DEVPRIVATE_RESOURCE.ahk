#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEVPRIVATE_DES.ahk
#Include .\DEVPRIVATE_RANGE.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class DEVPRIVATE_RESOURCE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 1

    /**
     * @type {DEVPRIVATE_DES}
     */
    PRV_Header{
        get {
            if(!this.HasProp("__PRV_Header"))
                this.__PRV_Header := DEVPRIVATE_DES(this.ptr + 0)
            return this.__PRV_Header
        }
    }

    /**
     * @type {Array<DEVPRIVATE_RANGE>}
     */
    PRV_Data{
        get {
            if(!this.HasProp("__PRV_DataProxyArray"))
                this.__PRV_DataProxyArray := Win32FixedArray(this.ptr + 24, 8, DEVPRIVATE_RANGE, "")
            return this.__PRV_DataProxyArray
        }
    }
}

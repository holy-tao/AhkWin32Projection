#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MEM_LARGE_DES.ahk
#Include .\MEM_LARGE_RANGE.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class MEM_LARGE_RESOURCE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {MEM_LARGE_DES}
     */
    MEM_LARGE_Header{
        get {
            if(!this.HasProp("__MEM_LARGE_Header"))
                this.__MEM_LARGE_Header := MEM_LARGE_DES(this.ptr + 0)
            return this.__MEM_LARGE_Header
        }
    }

    /**
     * @type {Array<MEM_LARGE_RANGE>}
     */
    MEM_LARGE_Data{
        get {
            if(!this.HasProp("__MEM_LARGE_DataProxyArray"))
                this.__MEM_LARGE_DataProxyArray := Win32FixedArray(this.ptr + 32, 1, MEM_LARGE_RANGE, "")
            return this.__MEM_LARGE_DataProxyArray
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MEM_DES.ahk
#Include .\MEM_RANGE.ahk

/**
 * The MEM_RESOURCE structure is used for specifying either a resource list or a resource requirements list that describes memory usage for a device instance. For more information about resource lists and resource requirements lists, see Hardware Resources.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-mem_resource
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class MEM_RESOURCE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A [MEM_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-mem_des) structure.
     * @type {MEM_DES}
     */
    MEM_Header{
        get {
            if(!this.HasProp("__MEM_Header"))
                this.__MEM_Header := MEM_DES(0, this)
            return this.__MEM_Header
        }
    }

    /**
     * 
     * @type {Array<MEM_RANGE>}
     */
    MEM_Data{
        get {
            if(!this.HasProp("__MEM_DataProxyArray"))
                this.__MEM_DataProxyArray := Win32FixedArray(this.ptr + 32, 1, MEM_RANGE, "")
            return this.__MEM_DataProxyArray
        }
    }
}

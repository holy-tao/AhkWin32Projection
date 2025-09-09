#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IO_DES.ahk
#Include .\IO_RANGE.ahk

/**
 * The IO_RESOURCE structure is used for specifying either a resource list or a resource requirements list that describes I/O port usage for a device instance.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-io_resource
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class IO_RESOURCE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * An [IO_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-io_des) structure.
     * @type {IO_DES}
     */
    IO_Header{
        get {
            if(!this.HasProp("__IO_Header"))
                this.__IO_Header := IO_DES(this.ptr + 0)
            return this.__IO_Header
        }
    }

    /**
     * 
     * @type {Array<IO_RANGE>}
     */
    IO_Data{
        get {
            if(!this.HasProp("__IO_DataProxyArray"))
                this.__IO_DataProxyArray := Win32FixedArray(this.ptr + 32, 1, IO_RANGE, "")
            return this.__IO_DataProxyArray
        }
    }
}

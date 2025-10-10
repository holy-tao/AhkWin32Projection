#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BUSNUMBER_DES.ahk
#Include .\BUSNUMBER_RANGE.ahk

/**
 * The BUSNUMBER_RESOURCE structure specifies either a resource list or a resource requirements list that describes bus number usage for a device instance. For more information about resource lists and resource requirements lists, see Hardware Resources.
 * @see https://docs.microsoft.com/windows/win32/api//cfgmgr32/ns-cfgmgr32-busnumber_resource
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class BUSNUMBER_RESOURCE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A [BUSNUMBER_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-busnumber_des) structure.
     * @type {BUSNUMBER_DES}
     */
    BusNumber_Header{
        get {
            if(!this.HasProp("__BusNumber_Header"))
                this.__BusNumber_Header := BUSNUMBER_DES(this.ptr + 0)
            return this.__BusNumber_Header
        }
    }

    /**
     * 
     * @type {Array<BUSNUMBER_RANGE>}
     */
    BusNumber_Data{
        get {
            if(!this.HasProp("__BusNumber_DataProxyArray"))
                this.__BusNumber_DataProxyArray := Win32FixedArray(this.ptr + 24, 1, BUSNUMBER_RANGE, "")
            return this.__BusNumber_DataProxyArray
        }
    }
}

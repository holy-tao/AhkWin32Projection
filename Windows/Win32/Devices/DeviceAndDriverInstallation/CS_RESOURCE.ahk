#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CS_DES.ahk

/**
 * The CS_RESOURCE structure is used for specifying a resource list that describes device class-specific resource usage for a device instance. For more information about resource lists, see Hardware Resources.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-cs_resource
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CS_RESOURCE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A [CS_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cs_des) structure.
     * @type {CS_DES}
     */
    CS_Header{
        get {
            if(!this.HasProp("__CS_Header"))
                this.__CS_Header := CS_DES(0, this)
            return this.__CS_Header
        }
    }
}

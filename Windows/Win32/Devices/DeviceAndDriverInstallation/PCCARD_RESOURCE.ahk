#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PCCARD_DES.ahk

/**
 * The PCCARD_RESOURCE structure is used for specifying either a resource list or a resource requirements list that describes resource usage by a PC Card instance.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-pccard_resource
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class PCCARD_RESOURCE extends Win32Struct
{
    static sizeof => 38

    static packingSize => 1

    /**
     * A [PCCARD_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-pccard_des) structure.
     * @type {PCCARD_DES}
     */
    PcCard_Header{
        get {
            if(!this.HasProp("__PcCard_Header"))
                this.__PcCard_Header := PCCARD_DES(this.ptr + 0)
            return this.__PcCard_Header
        }
    }
}

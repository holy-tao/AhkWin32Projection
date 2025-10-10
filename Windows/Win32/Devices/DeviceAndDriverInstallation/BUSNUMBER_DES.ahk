#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The BUSNUMBER_DES structure is used for specifying either a resource list or a resource requirements list that describes bus number usage for a device instance.
 * @remarks
 * 
  * The BUSNUMBER_DES structure is included as a member of the [BUSNUMBER_RESOURCE](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-busnumber_resource) structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cfgmgr32/ns-cfgmgr32-busnumber_des
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class BUSNUMBER_DES extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    BUSD_Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Must be set to the constant value <b>BusNumberType_Range</b>.
     * @type {Integer}
     */
    BUSD_Type {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * <i>Not used.</i>
     * @type {Integer}
     */
    BUSD_Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    BUSD_Alloc_Base {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * 
     * @type {Integer}
     */
    BUSD_Alloc_End {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}

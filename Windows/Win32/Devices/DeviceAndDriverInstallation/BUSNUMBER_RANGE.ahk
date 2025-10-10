#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The BUSNUMBER_RANGE structure specifies a resource requirements list that describes bus number usage for a device instance. For more information about resource requirements lists, see Hardware Resources.
 * @remarks
 * 
  * The BUSNUMBER_RANGE structure is included as a member of the [BUSNUMBER_RESOURCE](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-busnumber_resource) structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cfgmgr32/ns-cfgmgr32-busnumber_range
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class BUSNUMBER_RANGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The lowest-numbered of a range of contiguous bus numbers that can be allocated to the device.
     * @type {Integer}
     */
    BUSR_Min {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The highest-numbered of a range of contiguous bus numbers that can be allocated to the device.
     * @type {Integer}
     */
    BUSR_Max {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of contiguous bus numbers required by the device.
     * @type {Integer}
     */
    BUSR_nBusNumbers {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * <i>Not used.</i>
     * @type {Integer}
     */
    BUSR_Flags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

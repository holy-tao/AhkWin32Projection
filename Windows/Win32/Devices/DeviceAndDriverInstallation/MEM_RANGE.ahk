#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MEM_RANGE structure specifies a resource requirements list that describes memory usage for a device instance. For more information about resource requirements lists, see Hardware Resources.
 * @see https://docs.microsoft.com/windows/win32/api//cfgmgr32/ns-cfgmgr32-mem_range
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class MEM_RANGE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Mask used to specify the memory address boundary on which the first allocated memory address must be aligned.
     * @type {Integer}
     */
    MR_Align {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of bytes of memory required by the device.
     * @type {Integer}
     */
    MR_nBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The lowest-numbered of a range of contiguous memory addresses that can be allocated to the device.
     * @type {Integer}
     */
    MR_Min {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The highest-numbered of a range of contiguous memory addresses that can be allocated to the device.
     * @type {Integer}
     */
    MR_Max {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * One bit flag from [MEM_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-mem_des) structure.
     * @type {Integer}
     */
    MR_Flags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * <i>For internal use only.</i>
     * @type {Integer}
     */
    MR_Reserved {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}

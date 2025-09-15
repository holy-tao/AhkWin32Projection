#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IO_RANGE structure specifies a resource requirements list that describes I/O port usage for a device instance. For more information about resource requirements lists, see Hardware Resources.
 * @remarks
 * The flags specified for <b>IOR_Alias</b> have the same interpretation as the address decoding flags specified for <b>IOD_DesFlags</b>. (However, the two sets of flags are not equivalent in assigned values and cannot be used interchangeably.) A resource requirements list can be specified using either set of flags, but using decode flags in <b>IOD_DesFlags</b> is recommended. If address decoding flags are specified using <i>both</i><b>IOD_DesFlags</b> and <b>IOR_Alias</b>, contents of the latter overrides the former.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-io_range
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class IO_RANGE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Mask used to specify the port address boundary on which the first allocated I/O port address must be aligned.
     * @type {Integer}
     */
    IOR_Align {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of I/O port addresses required by the device.
     * @type {Integer}
     */
    IOR_nPorts {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The lowest-numbered of a range of contiguous I/O port addresses that can be allocated to the device.
     * @type {Integer}
     */
    IOR_Min {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The highest-numbered of a range of contiguous I/O port addresses that can be allocated to the device.
     * @type {Integer}
     */
    IOR_Max {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * One bit flag from [IO_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-io_des) structure. For more information, see the following <b>Remarks</b> section.
     * @type {Integer}
     */
    IOR_RangeFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * One of the bit flags described in the following table.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Definition</th>
     * </tr>
     * <tr>
     * <td>
     * IO_ALIAS_10_BIT_DECODE
     * 
     * </td>
     * <td>
     * The device decodes 10 bits of the port address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * IO_ALIAS_12_BIT_DECODE
     * 
     * </td>
     * <td>
     * The device decodes 12 bits of the port address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * IO_ALIAS_16_BIT_DECODE
     * 
     * </td>
     * <td>
     * The device decodes 16 bits of the port address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * IO_ALIAS_POSITIVE_DECODE
     * 
     * </td>
     * <td>
     * The device uses "positive decode" instead of "subtractive decode."
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For more information, see the following <b>Remarks</b> section.
     * @type {Integer}
     */
    IOR_Alias {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}

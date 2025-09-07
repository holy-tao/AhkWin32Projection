#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IO_DES structure is used for specifying either a resource list or a resource requirements list that describes I/O port usage for a device instance. For more information about resource lists and resource requirements lists, see Hardware Resources.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-io_des
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class IO_DES extends Win32Struct
{
    static sizeof => 28

    static packingSize => 1

    /**
     * 
     * @type {Integer}
     */
    IOD_Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Must be set to the constant value <b>IOType_Range</b>.
     * @type {Integer}
     */
    IOD_Type {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    IOD_Alloc_Base {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    IOD_Alloc_End {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * One bit flag from <i>each</i> of the flag sets described in the following table.
     * 
     * <table>
     * <tr>
     * <th></th>
     * <th>Flag</th>
     * <th>Definition</th>
     * </tr>
     * <tr>
     * <td colspan="2">
     * <i>Port Type Flags</i>
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fIOD_IO</b>
     * 
     * </td>
     * <td>
     * The device is accessed in I/O address space.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fIOD_Memory</b>
     * 
     * </td>
     * <td>
     * The device is accessed in memory address space.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fIOD_PortType</b>
     * 
     * </td>
     * <td>
     * Bitmask for the bits within <b>IOD_DesFlags</b> that specify the port type value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td colspan="2">
     * <i>Decode Flags</i>
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fIOD_10_BIT_DECODE</b>
     * 
     * </td>
     * <td>
     * The device decodes 10 bits of the port address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fIOD_12_BIT_DECODE</b>
     * 
     * </td>
     * <td>
     * The device decodes 12 bits of the port address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fIOD_16_BIT_DECODE</b>
     * 
     * </td>
     * <td>
     * The device decodes 16 bits of the port address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fIOD_POSITIVE_DECODE</b>
     * 
     * </td>
     * <td>
     * The device uses "positive decode" instead of "subtractive decode."
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fIOD_DECODE</b>
     * 
     * </td>
     * <td>
     * Bitmask for the bits within <b>IOD_DesFlags</b> that specify the decode value.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    IOD_DesFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}

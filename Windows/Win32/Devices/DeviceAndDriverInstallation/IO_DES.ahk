#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IOD_DESFLAGS.ahk" { IOD_DESFLAGS }

/**
 * The IO_DES structure is used for specifying either a resource list or a resource requirements list that describes I/O port usage for a device instance. For more information about resource lists and resource requirements lists, see Hardware Resources.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-io_des
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct IO_DES {
    #StructPack 8

    IOD_Count : UInt32

    /**
     * Must be set to the constant value <b>IOType_Range</b>.
     */
    IOD_Type : UInt32

    IOD_Alloc_Base : Int64

    IOD_Alloc_End : Int64

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
     */
    IOD_DesFlags : IOD_DESFLAGS

}

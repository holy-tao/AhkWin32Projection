#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DMA_DES structure is used for specifying either a resource list or a resource requirements list that describes direct memory access (DMA) channel usage for a device instance.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-dma_des
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class DMA_DES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    DD_Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Must be set to the constant value <b>DType_Range</b>.
     * @type {Integer}
     */
    DD_Type {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
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
     * <i>Channel Width Flags</i>
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fDD_BYTE</b>
     * 
     * </td>
     * <td>
     * 8-bit DMA channel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fDD_WORD</b>
     * 
     * </td>
     * <td>
     * 16-bit DMA channel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fDD_DWORD</b>
     * 
     * </td>
     * <td>
     * 32-bit DMA channel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fDD_BYTE_AND_WORD</b>
     * 
     * </td>
     * <td>
     * 8-bit and 16-bit DMA channel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>mDD_Width</b>
     * 
     * </td>
     * <td>
     * Bitmask for the bits within <b>DD_Flags</b> that specify the channel width value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td colspan="2">
     * <i>Bus Mastering Flags</i>
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fDD_NoBusMaster</b>
     * 
     * </td>
     * <td>
     * No bus mastering.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fDD_BusMaster</b>
     * 
     * </td>
     * <td>
     * Bus mastering.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>mDD_BusMaster</b>
     * 
     * </td>
     * <td>
     * Bitmask for the bits within <b>DD_Flags</b> that specify the bus mastering value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td colspan="2">
     * <i>DMA Type Flags</i>
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fDD_TypeStandard</b>
     * 
     * </td>
     * <td>
     * Standard DMA.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fDD_TypeA</b>
     * 
     * </td>
     * <td>
     * Type A DMA.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fDD_TypeB</b>
     * 
     * </td>
     * <td>
     * Type B DMA.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fDD_TypeF</b>
     * 
     * </td>
     * <td>
     * Type F DMA.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>mDD_Type</b>
     * 
     * </td>
     * <td>
     * Bitmask for the bits within <b>DD_Flags</b> that specify the DMA type value.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    DD_Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    DD_Alloc_Chan {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

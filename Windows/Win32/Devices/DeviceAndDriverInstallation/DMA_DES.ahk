#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_FLAGS.ahk" { DD_FLAGS }

/**
 * The DMA_DES structure is used for specifying either a resource list or a resource requirements list that describes direct memory access (DMA) channel usage for a device instance.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-dma_des
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct DMA_DES {
    #StructPack 4

    DD_Count : UInt32

    /**
     * Must be set to the constant value <b>DType_Range</b>.
     */
    DD_Type : UInt32

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
     */
    DD_Flags : DD_FLAGS

    DD_Alloc_Chan : UInt32

}

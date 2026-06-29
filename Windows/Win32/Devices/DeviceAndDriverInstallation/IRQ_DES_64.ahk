#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IRQD_FLAGS.ahk" { IRQD_FLAGS }

/**
 * The IRQ_DES structure is used for specifying either a resource list or a resource requirements list that describes IRQ line usage for a device instance. For more information about resource lists and resource requirements lists, see Hardware Resources. (64 bit)
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-irq_des_64
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct IRQ_DES_64 {
    #StructPack 8

    IRQD_Count : UInt32

    /**
     * Must be set to the constant value <b>IRQType_Range</b>.
     */
    IRQD_Type : UInt32

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
     * <i>Sharing Flags</i>
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fIRQD_Exclusive</b>
     * 
     * </td>
     * <td>
     * The IRQ line cannot be shared.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fIRQD_Share</b>
     * 
     * </td>
     * <td>
     * The IRQ line can be shared.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>mIRQD_Share</b>
     * 
     * </td>
     * <td>
     * Bitmask for the bits within <b>IRQD_Flags</b> that specify the sharing value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td colspan="2">
     * <i>Triggering Flags</i>
     * 
     * </td>
     * <td></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fIRQD_Level</b>
     * 
     * </td>
     * <td>
     * The IRQ line is level-triggered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>fIRQD_Edge</b>
     * 
     * </td>
     * <td>
     * The IRQ line is edge-triggered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <b>mIRQD_Edge_Level</b>
     * 
     * </td>
     * <td>
     * Bitmask for the bits within <b>IRQD_Flags</b> that specify the triggering value.
     * 
     * </td>
     * </tr>
     * </table>
     */
    IRQD_Flags : IRQD_FLAGS

    IRQD_Alloc_Num : UInt32

    IRQD_Affinity : Int64

}

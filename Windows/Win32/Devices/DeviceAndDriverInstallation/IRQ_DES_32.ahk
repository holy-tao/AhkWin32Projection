#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IRQ_DES structure is used for specifying either a resource list or a resource requirements list that describes IRQ line usage for a device instance. For more information about resource lists and resource requirements lists, see Hardware Resources. (32 bit)
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-irq_des_32
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class IRQ_DES_32 extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    IRQD_Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Must be set to the constant value <b>IRQType_Range</b>.
     * @type {Integer}
     */
    IRQD_Type {
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
     * @type {Integer}
     */
    IRQD_Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    IRQD_Alloc_Num {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * 
     * @type {Integer}
     */
    IRQD_Affinity {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}

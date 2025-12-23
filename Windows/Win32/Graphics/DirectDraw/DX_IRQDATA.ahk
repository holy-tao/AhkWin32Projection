#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DX_IRQDATA structure contains the IRQ information supplied by the driver.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-dx_irqdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DX_IRQDATA extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the type of IRQ that has occurred. One or more of the following:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_BUSMASTER
     * 
     * </td>
     * <td>
     * The IRQ was generated because a transfer request was completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_DISPLAY_VSYNC
     * 
     * </td>
     * <td>
     * The device can generate IRQs based on the display V-sync.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT0_LINE
     * 
     * </td>
     * <td>
     * The device can generate IRQs based on a programmable line for hardware video port number 0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT0_VSYNC
     * 
     * </td>
     * <td>
     * The device can generate V-sync IRQs for hardware video port number 0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT1_LINE
     * 
     * </td>
     * <td>
     * The device can generate IRQs based on a programmable line for hardware video port number 1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT1_VSYNC
     * 
     * </td>
     * <td>
     * The device can generate V-sync IRQs for hardware video port number 1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT2_LINE
     * 
     * </td>
     * <td>
     * The device can generate IRQs based on a programmable line for hardware video port number 2.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT2_VSYNC
     * 
     * </td>
     * <td>
     * The device can generate V-sync IRQs for hardware video port number 2.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT3_LINE
     * 
     * </td>
     * <td>
     * The device can generate IRQs based on a programmable line for hardware video port number 3.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT3_VSYNC
     * 
     * </td>
     * <td>
     * The device can generate V-sync IRQs for hardware video port number 3.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT4_LINE
     * 
     * </td>
     * <td>
     * The device can generate IRQs based on a programmable line for hardware video port number 4.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT4_VSYNC
     * 
     * </td>
     * <td>
     * The device can generate V-sync IRQs for hardware video port number 4.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT5_LINE
     * 
     * </td>
     * <td>
     * The device can generate IRQs based on a programmable line for hardware video port number 5.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT5_VSYNC
     * 
     * </td>
     * <td>
     * The device can generate V-sync IRQs for hardware video port number 5.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT6_LINE
     * 
     * </td>
     * <td>
     * The device can generate IRQs based on a programmable line for hardware video port number 6.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT6_VSYNC
     * 
     * </td>
     * <td>
     * The device can generate V-sync IRQs for hardware video port number 6.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT7_LINE
     * 
     * </td>
     * <td>
     * The device can generate IRQs based on a programmable line for hardware video port number 7.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT7_VSYNC
     * 
     * </td>
     * <td>
     * The device can generate V-sync IRQs for hardware video port number 7.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT8_LINE
     * 
     * </td>
     * <td>
     * The device can generate IRQs based on a programmable line for hardware video port number 8.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT8_VSYNC
     * 
     * </td>
     * <td>
     * The device can generate V-sync IRQs for hardware video port number 8.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT9_LINE
     * 
     * </td>
     * <td>
     * The device can generate IRQs based on a programmable line for hardware video port number 9.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT9_VSYNC
     * 
     * </td>
     * <td>
     * The device can generate V-sync IRQs for hardware video port number 9.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwIrqFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}

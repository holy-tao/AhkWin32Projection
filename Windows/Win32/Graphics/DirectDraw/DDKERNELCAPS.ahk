#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDKERNELCAPS structure notifies the client what support, if any, exists in the miniport driver for the kernel-mode video transport.
 * @see https://learn.microsoft.com/windows/win32/api/ddkernel/ns-ddkernel-ddkernelcaps
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDKERNELCAPS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Specifies the size, in bytes, of this structure. This member must be initialized before the structure is used.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a set of flags indicating the device's capabilities. This member can be any combination of the following capabilities: 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDKERNELCAPS_AUTOFLIP
     * 
     * </td>
     * <td>
     * The driver supports the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_flipvideoport">DxFlipVideoPort</a> and the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_flipoverlay">DxFlipOverlay</a> callbacks, and that these callbacks can be used for autoflipping.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDKERNELCAPS_CAPTURE_INVERTED
     * 
     * </td>
     * <td>
     * The device supports inverting the <a href="https://docs.microsoft.com/windows-hardware/drivers/">DIBs</a> while capturing the data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDKERNELCAPS_CAPTURE_NONLOCALVIDMEM
     * 
     * </td>
     * <td>
     * The device supports a <a href="https://docs.microsoft.com/windows-hardware/drivers/">video port extensions (VPE)</a> capture interface capable of transferring data to nonlocal display memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDKERNELCAPS_CAPTURE_SYSMEM
     * 
     * </td>
     * <td>
     * The device supports a VPE capture interface capable of transferring data to system memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDKERNELCAPS_FIELDPOLARITY
     * 
     * </td>
     * <td>
     * The device can report the polarity (even/odd) of the current VPE object field.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDKERNELCAPS_FLIPOVERLAY
     * 
     * </td>
     * <td>
     * The driver supports the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_flipoverlay">DxFlipOverlay</a> callback.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDKERNELCAPS_FLIPVIDEOPORT
     * 
     * </td>
     * <td>
     * The driver supports the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_flipvideoport">DxFlipVideoPort</a> callback.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDKERNELCAPS_LOCK
     * 
     * </td>
     * <td>
     * The device supports accessing the frame buffer without causing contention with blitters, and so on, and that the driver supports the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_lock">DxLock</a> callback.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDKERNELCAPS_SETSTATE
     * 
     * </td>
     * <td>
     * The driver supports the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_setstate">DxSetState</a> callback, allowing a client to switch between bob and weave display modes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDKERNELCAPS_SKIPFIELDS
     * 
     * </td>
     * <td>
     * The device supports field skipping, either using hardware or by supporting the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_skipnextfield">DxSkipNextField</a> callback.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwCaps {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Can be a combination of the following flags: 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_DISPLAY_VSYNC
     * 
     * </td>
     * <td>
     * The device can generate IRQs based on the display VSYNC.
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
     * The device can generate VSYNC IRQs for hardware video port number 0. 
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
     * The device can generate V-sync IRQs for hardware video port number 1
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
     * he device can generate IRQs based on a programmable line for hardware video port number 9.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDIRQ_VPORT9_VSYNC
     * 
     * </td>
     * <td>
     * he device can generate V-sync IRQs for hardware video port number 9.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwIRQCaps {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

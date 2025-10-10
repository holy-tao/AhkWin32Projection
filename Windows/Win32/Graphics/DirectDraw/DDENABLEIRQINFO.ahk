#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDENABLEIRQINFO structure contains the information required to enable interrupts.
 * @remarks
 * 
  * The <b>dwIRQSources</b> member of this structure does not use the DDIRQ_BUSMASTER flag. However, the DDIRQ_BUSMASTER flag can be set in the <b>dwIrqFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-dx_irqdata">DX_IRQDATA</a> structure. The driver passes this DX_IRQDATA to the <b>IRQCallback</b> function when an IRQ occurs.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxmini/ns-dxmini-ddenableirqinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDENABLEIRQINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwIRQSources {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates which line should generate the IRQ. If the hardware does not have the ability to generate an IRQ based on a programmable line, the value in this member is meaningless.
     * @type {Integer}
     */
    dwLine {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Points to an <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_irqcallback">IRQCallback</a> that the video miniport driver calls when the miniport driver is managing IRQs, and an IRQ occurs.
     * @type {Pointer<PDX_IRQCALLBACK>}
     */
    IRQCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to the data to be sent to <b>IRQCallback</b> when <b>IRQCallback</b> is called.
     * @type {Pointer<UInt32>}
     */
    lpIRQData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

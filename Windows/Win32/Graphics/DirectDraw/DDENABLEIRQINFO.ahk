#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DX_IRQDATA.ahk" { DX_IRQDATA }

/**
 * The DDENABLEIRQINFO structure contains the information required to enable interrupts.
 * @remarks
 * The <b>dwIRQSources</b> member of this structure does not use the DDIRQ_BUSMASTER flag. However, the DDIRQ_BUSMASTER flag can be set in the <b>dwIrqFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-dx_irqdata">DX_IRQDATA</a> structure. The driver passes this DX_IRQDATA to the <b>IRQCallback</b> function when an IRQ occurs.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddenableirqinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDENABLEIRQINFO {
    #StructPack 8

    dwIRQSources : UInt32

    /**
     * Indicates which line should generate the IRQ. If the hardware does not have the ability to generate an IRQ based on a programmable line, the value in this member is meaningless.
     */
    dwLine : UInt32

    /**
     * Points to an <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_irqcallback">IRQCallback</a> that the video miniport driver calls when the miniport driver is managing IRQs, and an IRQ occurs.
     */
    IRQCallback : IntPtr

    /**
     * Points to the data to be sent to <b>IRQCallback</b> when <b>IRQCallback</b> is called.
     */
    lpIRQData : DX_IRQDATA.Ptr

}

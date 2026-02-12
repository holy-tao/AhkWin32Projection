#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DxEnableIRQ callback function indicates to the video miniport driver which IRQs should be enabled or disabled.
 * @remarks
 * The <b>dwIRQSources</b> member of the DDENABLEIRQINFO structure at <i>EnableIrqInfo</i> contains the DDIRQ_<i>Xxx</i> flags that are set for every IRQ that should be enabled. If an IRQ is not specified in this call, it should be disabled. If the requested combination cannot be supported, this function fails. 
 * 
 * Because the video miniport driver must always manage its own IRQ, it must call the specified <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/nc-dxmini-pdx_irqcallback">IRQCallback</a> when an IRQ occurs. When calling <b>IRQCallback</b>, the <b>dwIRQFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-dx_irqdata">DX_IRQDATA</a> structure passed to <b>IRQCallback</b> contains the DDIRQ_<i>Xxx</i> flags that indicate what caused the IRQ.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxmini/nc-dxmini-pdx_enableirq
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDX_ENABLEIRQ extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Void>} param0 
     * @param {Pointer<DDENABLEIRQINFO>} param1 
     * @param {Pointer<Void>} param2 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, param0Marshal, param0, "ptr", param1, param2Marshal, param2, "uint")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterQueueView extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterQueueView
     * @type {Guid}
     */
    static IID => Guid("{476e2969-3b2b-4b3f-8277-cff6056042aa}")

    /**
     * The class identifier for PrinterQueueView
     * @type {Guid}
     */
    static CLSID => Guid("{eb54c231-798c-4c9e-b461-29fad04039b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetViewRange"]

    /**
     * 
     * @param {Integer} ulViewOffset 
     * @param {Integer} ulViewSize 
     * @returns {HRESULT} 
     */
    SetViewRange(ulViewOffset, ulViewSize) {
        result := ComCall(7, this, "uint", ulViewOffset, "uint", ulViewSize, "HRESULT")
        return result
    }
}

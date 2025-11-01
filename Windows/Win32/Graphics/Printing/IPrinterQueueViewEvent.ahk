#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterQueueViewEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterQueueViewEvent
     * @type {Guid}
     */
    static IID => Guid("{c5b6042b-fd21-404a-a0ef-e2fbb52b9080}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnChanged"]

    /**
     * 
     * @param {IPrintJobCollection} pCollection 
     * @param {Integer} ulViewOffset 
     * @param {Integer} ulViewSize 
     * @param {Integer} ulCountJobsInPrintQueue 
     * @returns {HRESULT} 
     */
    OnChanged(pCollection, ulViewOffset, ulViewSize, ulCountJobsInPrintQueue) {
        result := ComCall(7, this, "ptr", pCollection, "uint", ulViewOffset, "uint", ulViewSize, "uint", ulCountJobsInPrintQueue, "HRESULT")
        return result
    }
}

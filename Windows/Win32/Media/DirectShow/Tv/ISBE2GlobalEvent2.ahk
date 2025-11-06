#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISBE2GlobalEvent.ahk

/**
 * Offers access to global spanning events and their data from the Stream Buffer Source filters. A global spanning event contains state information that applies to all the streams in a pipeline. This interface extends the ISBE2GlobalEvent interface.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISBE2GlobalEvent2)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-isbe2globalevent2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISBE2GlobalEvent2 extends ISBE2GlobalEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISBE2GlobalEvent2
     * @type {Guid}
     */
    static IID => Guid("{6d8309bf-00fe-4506-8b03-f8c65b5c9b39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEventEx"]

    /**
     * 
     * @param {Pointer<Guid>} idEvt 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @param {Pointer<BOOL>} pSpanning 
     * @param {Pointer<Integer>} pcb 
     * @param {Pointer<Integer>} pb 
     * @param {Pointer<Integer>} pStreamTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2globalevent2-geteventex
     */
    GetEventEx(idEvt, param1, param2, param3, param4, pSpanning, pcb, pb, pStreamTime) {
        pSpanningMarshal := pSpanning is VarRef ? "int*" : "ptr"
        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"
        pbMarshal := pb is VarRef ? "char*" : "ptr"
        pStreamTimeMarshal := pStreamTime is VarRef ? "int64*" : "ptr"

        result := ComCall(4, this, "ptr", idEvt, "uint", param1, "uint", param2, "uint", param3, "uint", param4, pSpanningMarshal, pSpanning, pcbMarshal, pcb, pbMarshal, pb, pStreamTimeMarshal, pStreamTime, "HRESULT")
        return result
    }
}

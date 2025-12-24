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
     * Gets a global spanning event and its data from a Stream Buffer Source filter.
     * @param {Pointer<Guid>} idEvt GUID identifying the event.
     * @param {Integer} param1 First event-specific parameter.
     * @param {Integer} param2 Second event-specific parameter.
     * @param {Integer} param3 Third event-specific parameter.
     * @param {Integer} param4 Fourth event-specific parameter.
     * @param {Pointer<BOOL>} pSpanning Receives a flag indicating whether the event is a spanning event.
     * @param {Pointer<Integer>} pcb Pointer to a value specifying the buffer size. If the <i>pb</i> parameter is <b>NULL</b>, this parameter returns the required buffer size.
     * @param {Pointer<Integer>} pb Pointer to a buffer that receives the event data. If this parameter is <b>NULL</b>, the <i>pcb</i> parameter returns the required buffer size. The structure of the event data depends on the event type. For a list of event types, see the description of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-isbe2spanningevent-getevent">ISBE2SpanningEvent::GetEvent</a> method.
     * @param {Pointer<Integer>} pStreamTime Stream time of last data sample that was read from the 
     *     file before the event.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-isbe2globalevent2-geteventex
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

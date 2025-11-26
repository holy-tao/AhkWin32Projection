#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Offers access to global spanning events and their data from the Stream Buffer Source filters. A global spanning event contains state information that applies to all the streams in a pipeline.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISBE2GlobalEvent)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-isbe2globalevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISBE2GlobalEvent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISBE2GlobalEvent
     * @type {Guid}
     */
    static IID => Guid("{caede759-b6b1-11db-a578-0018f3fa24c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEvent"]

    /**
     * Gets a global spanning event and its data from a Stream Buffer Source filter.
     * @param {Pointer<Guid>} idEvt GUID identifying the event.
     * @param {Integer} param1 First event-specific parameter.
     * @param {Integer} param2 Second event-specific parameter.
     * @param {Integer} param3 Third  event-specific parameter.
     * @param {Integer} param4 Fourth  event-specific parameter.
     * @param {Pointer<BOOL>} pSpanning Receives a flag indicating whether the event is a spanning event.
     * @param {Pointer<Integer>} pcb Pointer to a value specifying the buffer size. If the <i>pb</i> parameter is <b>NULL</b>, this parameter returns the required buffer size.
     * @param {Pointer<Integer>} pb Pointer to a buffer that receives the event data. If this parameter is <b>NULL</b>, the <i>pcb</i> parameter returns the required buffer size. The structure of the event data depends on the event type. For a list of event types, see the description of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-isbe2spanningevent-getevent">ISBE2SpanningEvent::GetEvent</a> method.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>ERROR_INSUFFICIENT_BUFFER</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Buffer was too small to hold event data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>ERROR_CONTEXT_EXPIRED</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Too much time elapsed between the broadcast event and the call to retrieve it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-isbe2globalevent-getevent
     */
    GetEvent(idEvt, param1, param2, param3, param4, pSpanning, pcb, pb) {
        pSpanningMarshal := pSpanning is VarRef ? "int*" : "ptr"
        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"
        pbMarshal := pb is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", idEvt, "uint", param1, "uint", param2, "uint", param3, "uint", param4, pSpanningMarshal, pSpanning, pcbMarshal, pcb, pbMarshal, pb, "HRESULT")
        return result
    }
}

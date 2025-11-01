#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements in-band spanning events for the Stream Buffer Engine, version 2 (SBE2). An in-band spanning event is an in-band event that can be recorded as part of the state information in a stream.
 * @remarks
 * 
  * An in-band spanning event has a persisting semantic: it exists until it is replaced or erased, and it is part of the state for events that follow it in a stream. For example, the format of a stream is stored as an in-band spanning event because it can change over time. Video may consist of high definition (HD) content at the beginning of a recording but may switch to standard definition (SD) content, then back to HD content again during the course of the recording. If the user skips from SD to HD or vice versa, a dynamic format change occurs because the format has been stored as a spanning event.
  * 
  * In-band spanning events are also available for use by modules other than SBE2.  For example, content protection could store the protection policy as a spanning event. A recording might begin as unprotected content and then become protected midway through. An in-band spanning event indicating protected content would replace the in-band spanning event indicating protected content. As with the stream format example in the preceding paragraph, a skip from unprotected to protected content causes the in-band spanning event to be sourced.
  * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISBE2SpanningEvent)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-isbe2spanningevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISBE2SpanningEvent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISBE2SpanningEvent
     * @type {Guid}
     */
    static IID => Guid("{caede760-b6b1-11db-a578-0018f3fa24c6}")

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
     * 
     * @param {Pointer<Guid>} idEvt 
     * @param {Integer} streamId 
     * @param {Pointer<Integer>} pcb 
     * @param {Pointer<Integer>} pb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2spanningevent-getevent
     */
    GetEvent(idEvt, streamId, pcb, pb) {
        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"
        pbMarshal := pb is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", idEvt, "uint", streamId, pcbMarshal, pcb, pbMarshal, pb, "HRESULT")
        return result
    }
}

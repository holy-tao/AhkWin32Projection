#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITQOSEvent interface contains methods that retrieve the description of quality of service (QOS) events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itqosevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITQOSEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITQOSEvent
     * @type {Guid}
     */
    static IID => Guid("{cfa3357c-ad77-11d1-bb68-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Call", "get_Event", "get_MediaType"]

    /**
     * 
     * @param {Pointer<ITCallInfo>} ppCall 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itqosevent-get_call
     */
    get_Call(ppCall) {
        result := ComCall(7, this, "ptr*", ppCall, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pQosEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itqosevent-get_event
     */
    get_Event(pQosEvent) {
        pQosEventMarshal := pQosEvent is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pQosEventMarshal, pQosEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itqosevent-get_mediatype
     */
    get_MediaType(plMediaType) {
        plMediaTypeMarshal := plMediaType is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plMediaTypeMarshal, plMediaType, "HRESULT")
        return result
    }
}

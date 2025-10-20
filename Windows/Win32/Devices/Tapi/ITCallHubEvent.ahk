#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCallHubEvent interface contains methods that retrieve the description of CallHub events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcallhubevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCallHubEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITCallHubEvent
     * @type {Guid}
     */
    static IID => Guid("{a3c15451-5b92-11d1-8f4e-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Event", "get_CallHub", "get_Call"]

    /**
     * 
     * @param {Pointer<Integer>} pEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhubevent-get_event
     */
    get_Event(pEvent) {
        result := ComCall(7, this, "int*", pEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITCallHub>} ppCallHub 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhubevent-get_callhub
     */
    get_CallHub(ppCallHub) {
        result := ComCall(8, this, "ptr*", ppCallHub, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITCallInfo>} ppCall 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallhubevent-get_call
     */
    get_Call(ppCall) {
        result := ComCall(9, this, "ptr*", ppCall, "HRESULT")
        return result
    }
}

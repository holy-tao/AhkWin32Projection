#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITTAPIObjectEvent interface contains methods that retrieve the description of TAPI object events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ittapiobjectevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITTAPIObjectEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITTAPIObjectEvent
     * @type {Guid}
     */
    static IID => Guid("{f4854d48-937a-11d1-bb58-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TAPIObject", "get_Event", "get_Address", "get_CallbackInstance"]

    /**
     * 
     * @param {Pointer<ITTAPI>} ppTAPIObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapiobjectevent-get_tapiobject
     */
    get_TAPIObject(ppTAPIObject) {
        result := ComCall(7, this, "ptr*", ppTAPIObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapiobjectevent-get_event
     */
    get_Event(pEvent) {
        pEventMarshal := pEvent is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pEventMarshal, pEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITAddress>} ppAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapiobjectevent-get_address
     */
    get_Address(ppAddress) {
        result := ComCall(9, this, "ptr*", ppAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCallbackInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapiobjectevent-get_callbackinstance
     */
    get_CallbackInstance(plCallbackInstance) {
        plCallbackInstanceMarshal := plCallbackInstance is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plCallbackInstanceMarshal, plCallbackInstance, "HRESULT")
        return result
    }
}

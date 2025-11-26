#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITTAPI.ahk
#Include .\ITAddress.ahk
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
     * @type {ITTAPI} 
     */
    TAPIObject {
        get => this.get_TAPIObject()
    }

    /**
     * @type {Integer} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * @type {ITAddress} 
     */
    Address {
        get => this.get_Address()
    }

    /**
     * @type {Integer} 
     */
    CallbackInstance {
        get => this.get_CallbackInstance()
    }

    /**
     * 
     * @returns {ITTAPI} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapiobjectevent-get_tapiobject
     */
    get_TAPIObject() {
        result := ComCall(7, this, "ptr*", &ppTAPIObject := 0, "HRESULT")
        return ITTAPI(ppTAPIObject)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapiobjectevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }

    /**
     * 
     * @returns {ITAddress} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapiobjectevent-get_address
     */
    get_Address() {
        result := ComCall(9, this, "ptr*", &ppAddress := 0, "HRESULT")
        return ITAddress(ppAddress)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapiobjectevent-get_callbackinstance
     */
    get_CallbackInstance() {
        result := ComCall(10, this, "int*", &plCallbackInstance := 0, "HRESULT")
        return plCallbackInstance
    }
}

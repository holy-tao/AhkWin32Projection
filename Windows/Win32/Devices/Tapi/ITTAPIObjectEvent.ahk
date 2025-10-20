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
     * 
     * @param {Pointer<ITTAPI>} ppTAPIObject 
     * @returns {HRESULT} 
     */
    get_TAPIObject(ppTAPIObject) {
        result := ComCall(7, this, "ptr", ppTAPIObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pEvent 
     * @returns {HRESULT} 
     */
    get_Event(pEvent) {
        result := ComCall(8, this, "int*", pEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITAddress>} ppAddress 
     * @returns {HRESULT} 
     */
    get_Address(ppAddress) {
        result := ComCall(9, this, "ptr", ppAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCallbackInstance 
     * @returns {HRESULT} 
     */
    get_CallbackInstance(plCallbackInstance) {
        result := ComCall(10, this, "int*", plCallbackInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

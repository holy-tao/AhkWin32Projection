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
     * 
     * @param {Pointer<Int32>} pEvent 
     * @returns {HRESULT} 
     */
    get_Event(pEvent) {
        result := ComCall(7, this, "int*", pEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITCallHub>} ppCallHub 
     * @returns {HRESULT} 
     */
    get_CallHub(ppCallHub) {
        result := ComCall(8, this, "ptr", ppCallHub, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITCallInfo>} ppCall 
     * @returns {HRESULT} 
     */
    get_Call(ppCall) {
        result := ComCall(9, this, "ptr", ppCall, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

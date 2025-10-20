#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCallInfoChangeEvent interface contains methods that retrieve the description of call information change events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcallinfochangeevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCallInfoChangeEvent extends IDispatch{
    /**
     * The interface identifier for ITCallInfoChangeEvent
     * @type {Guid}
     */
    static IID => Guid("{5d4b65f9-e51c-11d1-a02f-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ITCallInfo>} ppCall 
     * @returns {HRESULT} 
     */
    get_Call(ppCall) {
        result := ComCall(7, this, "ptr", ppCall, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCIC 
     * @returns {HRESULT} 
     */
    get_Cause(pCIC) {
        result := ComCall(8, this, "int*", pCIC, "int")
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
        result := ComCall(9, this, "int*", plCallbackInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

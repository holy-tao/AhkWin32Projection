#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITRequestEvent interface contains methods that allow an application to receive and process Assisted Telephony request events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itrequestevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITRequestEvent extends IDispatch{
    /**
     * The interface identifier for ITRequestEvent
     * @type {Guid}
     */
    static IID => Guid("{ac48ffde-f8c4-11d1-a030-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plRegistrationInstance 
     * @returns {HRESULT} 
     */
    get_RegistrationInstance(plRegistrationInstance) {
        result := ComCall(7, this, "int*", plRegistrationInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRequestMode 
     * @returns {HRESULT} 
     */
    get_RequestMode(plRequestMode) {
        result := ComCall(8, this, "int*", plRequestMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppDestAddress 
     * @returns {HRESULT} 
     */
    get_DestAddress(ppDestAddress) {
        result := ComCall(9, this, "ptr", ppDestAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppAppName 
     * @returns {HRESULT} 
     */
    get_AppName(ppAppName) {
        result := ComCall(10, this, "ptr", ppAppName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppCalledParty 
     * @returns {HRESULT} 
     */
    get_CalledParty(ppCalledParty) {
        result := ComCall(11, this, "ptr", ppCalledParty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppComment 
     * @returns {HRESULT} 
     */
    get_Comment(ppComment) {
        result := ComCall(12, this, "ptr", ppComment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

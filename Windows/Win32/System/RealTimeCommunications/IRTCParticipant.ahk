#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCParticipant extends IUnknown{
    /**
     * The interface identifier for IRTCParticipant
     * @type {Guid}
     */
    static IID => Guid("{ae86add5-26b1-4414-af1d-b94cd938d739}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUserURI 
     * @returns {HRESULT} 
     */
    get_UserURI(pbstrUserURI) {
        result := ComCall(3, this, "ptr", pbstrUserURI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(4, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfRemovable 
     * @returns {HRESULT} 
     */
    get_Removable(pfRemovable) {
        result := ComCall(5, this, "ptr", pfRemovable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} penState 
     * @returns {HRESULT} 
     */
    get_State(penState) {
        result := ComCall(6, this, "int*", penState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCSession>} ppSession 
     * @returns {HRESULT} 
     */
    get_Session(ppSession) {
        result := ComCall(7, this, "ptr", ppSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

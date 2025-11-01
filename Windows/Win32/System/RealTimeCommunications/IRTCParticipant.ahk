#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCParticipant extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserURI", "get_Name", "get_Removable", "get_State", "get_Session"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUserURI 
     * @returns {HRESULT} 
     */
    get_UserURI(pbstrUserURI) {
        result := ComCall(3, this, "ptr", pbstrUserURI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(4, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfRemovable 
     * @returns {HRESULT} 
     */
    get_Removable(pfRemovable) {
        result := ComCall(5, this, "ptr", pfRemovable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} penState 
     * @returns {HRESULT} 
     */
    get_State(penState) {
        penStateMarshal := penState is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, penStateMarshal, penState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRTCSession>} ppSession 
     * @returns {HRESULT} 
     */
    get_Session(ppSession) {
        result := ComCall(7, this, "ptr*", ppSession, "HRESULT")
        return result
    }
}

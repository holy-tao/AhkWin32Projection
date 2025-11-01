#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCParticipantStateChangeEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCParticipantStateChangeEvent
     * @type {Guid}
     */
    static IID => Guid("{09bcb597-f0fa-48f9-b420-468cea7fde04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Participant", "get_State", "get_StatusCode"]

    /**
     * 
     * @param {Pointer<IRTCParticipant>} ppParticipant 
     * @returns {HRESULT} 
     */
    get_Participant(ppParticipant) {
        result := ComCall(7, this, "ptr*", ppParticipant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} penState 
     * @returns {HRESULT} 
     */
    get_State(penState) {
        penStateMarshal := penState is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, penStateMarshal, penState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plStatusCode 
     * @returns {HRESULT} 
     */
    get_StatusCode(plStatusCode) {
        plStatusCodeMarshal := plStatusCode is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plStatusCodeMarshal, plStatusCode, "HRESULT")
        return result
    }
}

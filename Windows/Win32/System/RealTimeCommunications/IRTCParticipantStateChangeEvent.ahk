#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCParticipant.ahk
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
     * @returns {IRTCParticipant} 
     */
    get_Participant() {
        result := ComCall(7, this, "ptr*", &ppParticipant := 0, "HRESULT")
        return IRTCParticipant(ppParticipant)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(8, this, "int*", &penState := 0, "HRESULT")
        return penState
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(9, this, "int*", &plStatusCode := 0, "HRESULT")
        return plStatusCode
    }
}

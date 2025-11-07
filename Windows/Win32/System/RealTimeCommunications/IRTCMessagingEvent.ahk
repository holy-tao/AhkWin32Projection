#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCSession.ahk
#Include .\IRTCParticipant.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCMessagingEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCMessagingEvent
     * @type {Guid}
     */
    static IID => Guid("{d3609541-1b29-4de5-a4ad-5aebaf319512}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "get_Participant", "get_EventType", "get_Message", "get_MessageHeader", "get_UserStatus"]

    /**
     * 
     * @returns {IRTCSession} 
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppSession := 0, "HRESULT")
        return IRTCSession(ppSession)
    }

    /**
     * 
     * @returns {IRTCParticipant} 
     */
    get_Participant() {
        result := ComCall(8, this, "ptr*", &ppParticipant := 0, "HRESULT")
        return IRTCParticipant(ppParticipant)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventType() {
        result := ComCall(9, this, "int*", &penEventType := 0, "HRESULT")
        return penEventType
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Message() {
        pbstrMessage := BSTR()
        result := ComCall(10, this, "ptr", pbstrMessage, "HRESULT")
        return pbstrMessage
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_MessageHeader() {
        pbstrMessageHeader := BSTR()
        result := ComCall(11, this, "ptr", pbstrMessageHeader, "HRESULT")
        return pbstrMessageHeader
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UserStatus() {
        result := ComCall(12, this, "int*", &penUserStatus := 0, "HRESULT")
        return penUserStatus
    }
}

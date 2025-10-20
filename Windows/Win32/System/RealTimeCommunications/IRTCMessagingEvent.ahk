#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCMessagingEvent extends IDispatch{
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

    /**
     * 
     * @param {Pointer<IRTCParticipant>} ppParticipant 
     * @returns {HRESULT} 
     */
    get_Participant(ppParticipant) {
        result := ComCall(8, this, "ptr", ppParticipant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} penEventType 
     * @returns {HRESULT} 
     */
    get_EventType(penEventType) {
        result := ComCall(9, this, "int*", penEventType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMessage 
     * @returns {HRESULT} 
     */
    get_Message(pbstrMessage) {
        result := ComCall(10, this, "ptr", pbstrMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMessageHeader 
     * @returns {HRESULT} 
     */
    get_MessageHeader(pbstrMessageHeader) {
        result := ComCall(11, this, "ptr", pbstrMessageHeader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} penUserStatus 
     * @returns {HRESULT} 
     */
    get_UserStatus(penUserStatus) {
        result := ComCall(12, this, "int*", penUserStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

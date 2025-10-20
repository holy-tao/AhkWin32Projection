#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCSession extends IUnknown{
    /**
     * The interface identifier for IRTCSession
     * @type {Guid}
     */
    static IID => Guid("{387c8086-99be-42fb-9973-7c0fc0ca9fa8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IRTCClient>} ppClient 
     * @returns {HRESULT} 
     */
    get_Client(ppClient) {
        result := ComCall(3, this, "ptr", ppClient, "int")
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
        result := ComCall(4, this, "int*", penState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} penType 
     * @returns {HRESULT} 
     */
    get_Type(penType) {
        result := ComCall(5, this, "int*", penType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCProfile>} ppProfile 
     * @returns {HRESULT} 
     */
    get_Profile(ppProfile) {
        result := ComCall(6, this, "ptr", ppProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCCollection>} ppCollection 
     * @returns {HRESULT} 
     */
    get_Participants(ppCollection) {
        result := ComCall(7, this, "ptr", ppCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Answer() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enReason 
     * @returns {HRESULT} 
     */
    Terminate(enReason) {
        result := ComCall(9, this, "int", enReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enType 
     * @param {BSTR} bstrLocalPhoneURI 
     * @param {Pointer<IRTCProfile>} pProfile 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    Redirect(enType, bstrLocalPhoneURI, pProfile, lFlags) {
        bstrLocalPhoneURI := bstrLocalPhoneURI is String ? BSTR.Alloc(bstrLocalPhoneURI).Value : bstrLocalPhoneURI

        result := ComCall(10, this, "int", enType, "ptr", bstrLocalPhoneURI, "ptr", pProfile, "int", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrAddress 
     * @param {BSTR} bstrName 
     * @param {Pointer<IRTCParticipant>} ppParticipant 
     * @returns {HRESULT} 
     */
    AddParticipant(bstrAddress, bstrName, ppParticipant) {
        bstrAddress := bstrAddress is String ? BSTR.Alloc(bstrAddress).Value : bstrAddress
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(11, this, "ptr", bstrAddress, "ptr", bstrName, "ptr", ppParticipant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCParticipant>} pParticipant 
     * @returns {HRESULT} 
     */
    RemoveParticipant(pParticipant) {
        result := ComCall(12, this, "ptr", pParticipant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRTCEnumParticipants>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumerateParticipants(ppEnum) {
        result := ComCall(13, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfCanAdd 
     * @returns {HRESULT} 
     */
    get_CanAddParticipants(pfCanAdd) {
        result := ComCall(14, this, "ptr", pfCanAdd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUserURI 
     * @returns {HRESULT} 
     */
    get_RedirectedUserURI(pbstrUserURI) {
        result := ComCall(15, this, "ptr", pbstrUserURI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUserName 
     * @returns {HRESULT} 
     */
    get_RedirectedUserName(pbstrUserName) {
        result := ComCall(16, this, "ptr", pbstrUserName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NextRedirectedUser() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sends the specified message to a window or windows. The SendMessage function calls the window procedure for the specified window and does not return until the window procedure has processed the message.
     * @param {BSTR} bstrMessageHeader 
     * @param {BSTR} bstrMessage 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} Type: <b>LRESULT</b>
     * 
     * The return value specifies the result of the message processing; it depends on the message sent.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-sendmessage
     */
    SendMessage(bstrMessageHeader, bstrMessage, lCookie) {
        bstrMessageHeader := bstrMessageHeader is String ? BSTR.Alloc(bstrMessageHeader).Value : bstrMessageHeader
        bstrMessage := bstrMessage is String ? BSTR.Alloc(bstrMessage).Value : bstrMessage

        result := ComCall(18, this, "ptr", bstrMessageHeader, "ptr", bstrMessage, "ptr", lCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enUserStatus 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    SendMessageStatus(enUserStatus, lCookie) {
        result := ComCall(19, this, "int", enUserStatus, "ptr", lCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    AddStream(lMediaType, lCookie) {
        result := ComCall(20, this, "int", lMediaType, "ptr", lCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    RemoveStream(lMediaType, lCookie) {
        result := ComCall(21, this, "int", lMediaType, "ptr", lCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @param {BSTR} EncryptionKey 
     * @returns {HRESULT} 
     */
    put_EncryptionKey(lMediaType, EncryptionKey) {
        EncryptionKey := EncryptionKey is String ? BSTR.Alloc(EncryptionKey).Value : EncryptionKey

        result := ComCall(22, this, "int", lMediaType, "ptr", EncryptionKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

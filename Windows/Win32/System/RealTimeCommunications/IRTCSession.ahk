#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCClient.ahk" { IRTCClient }
#Import ".\RTC_SESSION_TYPE.ahk" { RTC_SESSION_TYPE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\RTC_MESSAGING_USER_STATUS.ahk" { RTC_MESSAGING_USER_STATUS }
#Import ".\IRTCCollection.ahk" { IRTCCollection }
#Import ".\RTC_SESSION_STATE.ahk" { RTC_SESSION_STATE }
#Import ".\IRTCEnumParticipants.ahk" { IRTCEnumParticipants }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IRTCParticipant.ahk" { IRTCParticipant }
#Import ".\RTC_TERMINATE_REASON.ahk" { RTC_TERMINATE_REASON }
#Import ".\IRTCProfile.ahk" { IRTCProfile }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCSession extends IUnknown {
    /**
     * The interface identifier for IRTCSession
     * @type {Guid}
     */
    static IID := Guid("{387c8086-99be-42fb-9973-7c0fc0ca9fa8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCSession interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Client             : IntPtr
        get_State              : IntPtr
        get_Type               : IntPtr
        get_Profile            : IntPtr
        get_Participants       : IntPtr
        Answer                 : IntPtr
        Terminate              : IntPtr
        Redirect               : IntPtr
        AddParticipant         : IntPtr
        RemoveParticipant      : IntPtr
        EnumerateParticipants  : IntPtr
        get_CanAddParticipants : IntPtr
        get_RedirectedUserURI  : IntPtr
        get_RedirectedUserName : IntPtr
        NextRedirectedUser     : IntPtr
        SendMessage            : IntPtr
        SendMessageStatus      : IntPtr
        AddStream              : IntPtr
        RemoveStream           : IntPtr
        put_EncryptionKey      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCClient} 
     */
    Client {
        get => this.get_Client()
    }

    /**
     * @type {RTC_SESSION_STATE} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {RTC_SESSION_TYPE} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {IRTCProfile} 
     */
    Profile {
        get => this.get_Profile()
    }

    /**
     * @type {IRTCCollection} 
     */
    Participants {
        get => this.get_Participants()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    CanAddParticipants {
        get => this.get_CanAddParticipants()
    }

    /**
     * @type {BSTR} 
     */
    RedirectedUserURI {
        get => this.get_RedirectedUserURI()
    }

    /**
     * @type {BSTR} 
     */
    RedirectedUserName {
        get => this.get_RedirectedUserName()
    }

    /**
     * 
     * @returns {IRTCClient} 
     */
    get_Client() {
        result := ComCall(3, this, "ptr*", &ppClient := 0, "HRESULT")
        return IRTCClient(ppClient)
    }

    /**
     * 
     * @returns {RTC_SESSION_STATE} 
     */
    get_State() {
        result := ComCall(4, this, "int*", &penState := 0, "HRESULT")
        return penState
    }

    /**
     * 
     * @returns {RTC_SESSION_TYPE} 
     */
    get_Type() {
        result := ComCall(5, this, "int*", &_penType := 0, "HRESULT")
        return _penType
    }

    /**
     * 
     * @returns {IRTCProfile} 
     */
    get_Profile() {
        result := ComCall(6, this, "ptr*", &ppProfile := 0, "HRESULT")
        return IRTCProfile(ppProfile)
    }

    /**
     * 
     * @returns {IRTCCollection} 
     */
    get_Participants() {
        result := ComCall(7, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IRTCCollection(ppCollection)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Answer() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_TERMINATE_REASON} enReason 
     * @returns {HRESULT} 
     */
    Terminate(enReason) {
        result := ComCall(9, this, RTC_TERMINATE_REASON, enReason, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_SESSION_TYPE} enType 
     * @param {BSTR} bstrLocalPhoneURI 
     * @param {IRTCProfile} pProfile 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    Redirect(enType, bstrLocalPhoneURI, pProfile, lFlags) {
        bstrLocalPhoneURI := bstrLocalPhoneURI is String ? BSTR.Alloc(bstrLocalPhoneURI).Value : bstrLocalPhoneURI

        result := ComCall(10, this, RTC_SESSION_TYPE, enType, BSTR, bstrLocalPhoneURI, "ptr", pProfile, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAddress 
     * @param {BSTR} bstrName 
     * @returns {IRTCParticipant} 
     */
    AddParticipant(bstrAddress, bstrName) {
        bstrAddress := bstrAddress is String ? BSTR.Alloc(bstrAddress).Value : bstrAddress
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(11, this, BSTR, bstrAddress, BSTR, bstrName, "ptr*", &ppParticipant := 0, "HRESULT")
        return IRTCParticipant(ppParticipant)
    }

    /**
     * 
     * @param {IRTCParticipant} pParticipant 
     * @returns {HRESULT} 
     */
    RemoveParticipant(pParticipant) {
        result := ComCall(12, this, "ptr", pParticipant, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IRTCEnumParticipants} 
     */
    EnumerateParticipants() {
        result := ComCall(13, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IRTCEnumParticipants(ppEnum)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_CanAddParticipants() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &pfCanAdd := 0, "HRESULT")
        return pfCanAdd
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_RedirectedUserURI() {
        pbstrUserURI := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pbstrUserURI, "HRESULT")
        return pbstrUserURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_RedirectedUserName() {
        pbstrUserName := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, pbstrUserName, "HRESULT")
        return pbstrUserName
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NextRedirectedUser() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Sends the specified message to a window or windows. The SendMessage function calls the window procedure for the specified window and does not return until the window procedure has processed the message. (SendMessageW)
     * @remarks
     * When a message is blocked by UIPI the last error, retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, is set to 5 (access denied).
     * 
     * Applications that need to communicate using <b>HWND_BROADCAST</b> should use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function to obtain a unique message for inter-application communication.
     * 
     * The system only does marshalling for system messages (those in the range 0 to (<a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-user">WM_USER</a>-1)). To send other messages (those &gt;= <b>WM_USER</b>) to another process, you must do custom marshalling.
     * 
     * If the specified window was created by the calling thread, the window procedure is called immediately as a subroutine. If the specified window was created by a different thread, the system switches to that thread and calls the appropriate window procedure. Messages sent between threads are processed only when the receiving thread executes message retrieval code. The sending thread is blocked until the receiving thread processes the message. However, the sending thread will process incoming nonqueued messages while waiting for its message to be processed. To prevent this, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendmessagetimeouta">SendMessageTimeout</a> with SMTO_BLOCK set. For more information on nonqueued messages, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/about-messages-and-message-queues">Nonqueued Messages</a>.
     * 
     *  An accessibility application can use <b>SendMessage</b> to send <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-appcommand">WM_APPCOMMAND</a> messages  to the shell to launch applications. This  functionality is not guaranteed to work for other types of applications.
     * @param {BSTR} bstrMessageHeader 
     * @param {BSTR} bstrMessage 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} Type: <b>LRESULT</b>
     * 
     * The return value specifies the result of the message processing; it depends on the message sent.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-sendmessage
     */
    SendMessage(bstrMessageHeader, bstrMessage, lCookie) {
        bstrMessageHeader := bstrMessageHeader is String ? BSTR.Alloc(bstrMessageHeader).Value : bstrMessageHeader
        bstrMessage := bstrMessage is String ? BSTR.Alloc(bstrMessage).Value : bstrMessage

        result := ComCall(18, this, BSTR, bstrMessageHeader, BSTR, bstrMessage, "ptr", lCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_MESSAGING_USER_STATUS} enUserStatus 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    SendMessageStatus(enUserStatus, lCookie) {
        result := ComCall(19, this, RTC_MESSAGING_USER_STATUS, enUserStatus, "ptr", lCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    AddStream(lMediaType, lCookie) {
        result := ComCall(20, this, "int", lMediaType, "ptr", lCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    RemoveStream(lMediaType, lCookie) {
        result := ComCall(21, this, "int", lMediaType, "ptr", lCookie, "HRESULT")
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

        result := ComCall(22, this, "int", lMediaType, BSTR, EncryptionKey, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCSession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Client := CallbackCreate(GetMethod(implObj, "get_Client"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_Profile := CallbackCreate(GetMethod(implObj, "get_Profile"), flags, 2)
        this.vtbl.get_Participants := CallbackCreate(GetMethod(implObj, "get_Participants"), flags, 2)
        this.vtbl.Answer := CallbackCreate(GetMethod(implObj, "Answer"), flags, 1)
        this.vtbl.Terminate := CallbackCreate(GetMethod(implObj, "Terminate"), flags, 2)
        this.vtbl.Redirect := CallbackCreate(GetMethod(implObj, "Redirect"), flags, 5)
        this.vtbl.AddParticipant := CallbackCreate(GetMethod(implObj, "AddParticipant"), flags, 4)
        this.vtbl.RemoveParticipant := CallbackCreate(GetMethod(implObj, "RemoveParticipant"), flags, 2)
        this.vtbl.EnumerateParticipants := CallbackCreate(GetMethod(implObj, "EnumerateParticipants"), flags, 2)
        this.vtbl.get_CanAddParticipants := CallbackCreate(GetMethod(implObj, "get_CanAddParticipants"), flags, 2)
        this.vtbl.get_RedirectedUserURI := CallbackCreate(GetMethod(implObj, "get_RedirectedUserURI"), flags, 2)
        this.vtbl.get_RedirectedUserName := CallbackCreate(GetMethod(implObj, "get_RedirectedUserName"), flags, 2)
        this.vtbl.NextRedirectedUser := CallbackCreate(GetMethod(implObj, "NextRedirectedUser"), flags, 1)
        this.vtbl.SendMessage := CallbackCreate(GetMethod(implObj, "SendMessage"), flags, 4)
        this.vtbl.SendMessageStatus := CallbackCreate(GetMethod(implObj, "SendMessageStatus"), flags, 3)
        this.vtbl.AddStream := CallbackCreate(GetMethod(implObj, "AddStream"), flags, 3)
        this.vtbl.RemoveStream := CallbackCreate(GetMethod(implObj, "RemoveStream"), flags, 3)
        this.vtbl.put_EncryptionKey := CallbackCreate(GetMethod(implObj, "put_EncryptionKey"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Client)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_Profile)
        CallbackFree(this.vtbl.get_Participants)
        CallbackFree(this.vtbl.Answer)
        CallbackFree(this.vtbl.Terminate)
        CallbackFree(this.vtbl.Redirect)
        CallbackFree(this.vtbl.AddParticipant)
        CallbackFree(this.vtbl.RemoveParticipant)
        CallbackFree(this.vtbl.EnumerateParticipants)
        CallbackFree(this.vtbl.get_CanAddParticipants)
        CallbackFree(this.vtbl.get_RedirectedUserURI)
        CallbackFree(this.vtbl.get_RedirectedUserName)
        CallbackFree(this.vtbl.NextRedirectedUser)
        CallbackFree(this.vtbl.SendMessage)
        CallbackFree(this.vtbl.SendMessageStatus)
        CallbackFree(this.vtbl.AddStream)
        CallbackFree(this.vtbl.RemoveStream)
        CallbackFree(this.vtbl.put_EncryptionKey)
    }
}

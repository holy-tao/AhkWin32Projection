#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\TSSESSION_STATE.ahk" { TSSESSION_STATE }
#Import ".\CLIENT_DISPLAY.ahk" { CLIENT_DISPLAY }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes properties that store information about a user session.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbsession
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbSession extends IUnknown {
    /**
     * The interface identifier for ITsSbSession
     * @type {Guid}
     */
    static IID := Guid("{d453aac7-b1d8-4c5e-ba34-9afb4c8c5510}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbSession interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_SessionId      : IntPtr
        get_TargetName     : IntPtr
        put_TargetName     : IntPtr
        get_Username       : IntPtr
        get_Domain         : IntPtr
        get_State          : IntPtr
        put_State          : IntPtr
        get_CreateTime     : IntPtr
        put_CreateTime     : IntPtr
        get_DisconnectTime : IntPtr
        put_DisconnectTime : IntPtr
        get_InitialProgram : IntPtr
        put_InitialProgram : IntPtr
        get_ClientDisplay  : IntPtr
        put_ClientDisplay  : IntPtr
        get_ProtocolType   : IntPtr
        put_ProtocolType   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * @type {BSTR} 
     */
    TargetName {
        get => this.get_TargetName()
        set => this.put_TargetName(value)
    }

    /**
     * @type {BSTR} 
     */
    Username {
        get => this.get_Username()
    }

    /**
     * @type {BSTR} 
     */
    Domain {
        get => this.get_Domain()
    }

    /**
     * @type {TSSESSION_STATE} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * @type {FILETIME} 
     */
    CreateTime {
        get => this.get_CreateTime()
        set => this.put_CreateTime(value)
    }

    /**
     * @type {FILETIME} 
     */
    DisconnectTime {
        get => this.get_DisconnectTime()
        set => this.put_DisconnectTime(value)
    }

    /**
     * @type {BSTR} 
     */
    InitialProgram {
        get => this.get_InitialProgram()
        set => this.put_InitialProgram(value)
    }

    /**
     * @type {CLIENT_DISPLAY} 
     */
    ClientDisplay {
        get => this.get_ClientDisplay()
        set => this.put_ClientDisplay(value)
    }

    /**
     * @type {Integer} 
     */
    ProtocolType {
        get => this.get_ProtocolType()
        set => this.put_ProtocolType(value)
    }

    /**
     * Retrieves the session ID.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_sessionid
     */
    get_SessionId() {
        result := ComCall(3, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the name of the target on which this session was created.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_targetname
     */
    get_TargetName() {
        targetName := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, targetName, "HRESULT")
        return targetName
    }

    /**
     * 
     * @param {BSTR} targetName 
     * @returns {HRESULT} 
     */
    put_TargetName(targetName) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName

        result := ComCall(5, this, BSTR, targetName, "HRESULT")
        return result
    }

    /**
     * Retrieves the user name for this session.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_username
     */
    get_Username() {
        userName := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, userName, "HRESULT")
        return userName
    }

    /**
     * Retrieves the domain name of the user.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_domain
     */
    get_Domain() {
        domain := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, domain, "HRESULT")
        return domain
    }

    /**
     * Retrieves or specifies the session state. (Get)
     * @returns {TSSESSION_STATE} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_state
     */
    get_State() {
        result := ComCall(8, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * Retrieves or specifies the session state. (Put)
     * @param {TSSESSION_STATE} State 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-put_state
     */
    put_State(State) {
        result := ComCall(9, this, TSSESSION_STATE, State, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the time the session was created. (Get)
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_createtime
     */
    get_CreateTime() {
        pTime := FILETIME()
        result := ComCall(10, this, FILETIME.Ptr, pTime, "HRESULT")
        return pTime
    }

    /**
     * Retrieves or specifies the time the session was created. (Put)
     * @param {FILETIME} Time 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-put_createtime
     */
    put_CreateTime(Time) {
        result := ComCall(11, this, FILETIME, Time, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the time the session was disconnected. (Get)
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_disconnecttime
     */
    get_DisconnectTime() {
        pTime := FILETIME()
        result := ComCall(12, this, FILETIME.Ptr, pTime, "HRESULT")
        return pTime
    }

    /**
     * Retrieves or specifies the time the session was disconnected. (Put)
     * @param {FILETIME} Time 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-put_disconnecttime
     */
    put_DisconnectTime(Time) {
        result := ComCall(13, this, FILETIME, Time, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the initial program for this session. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_initialprogram
     */
    get_InitialProgram() {
        app := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, app, "HRESULT")
        return app
    }

    /**
     * Retrieves or specifies the initial program for this session. (Put)
     * @param {BSTR} _Application 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-put_initialprogram
     */
    put_InitialProgram(_Application) {
        _Application := _Application is String ? BSTR.Alloc(_Application).Value : _Application

        result := ComCall(15, this, BSTR, _Application, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies information about the display device of the client computer. (Get)
     * @returns {CLIENT_DISPLAY} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_clientdisplay
     */
    get_ClientDisplay() {
        pClientDisplay := CLIENT_DISPLAY()
        result := ComCall(16, this, CLIENT_DISPLAY.Ptr, pClientDisplay, "HRESULT")
        return pClientDisplay
    }

    /**
     * Retrieves or specifies information about the display device of the client computer. (Put)
     * @param {CLIENT_DISPLAY} pClientDisplay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-put_clientdisplay
     */
    put_ClientDisplay(pClientDisplay) {
        result := ComCall(17, this, CLIENT_DISPLAY, pClientDisplay, "HRESULT")
        return result
    }

    /**
     * Retrieves or specifies the protocol type for the session. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_protocoltype
     */
    get_ProtocolType() {
        result := ComCall(18, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves or specifies the protocol type for the session. (Put)
     * @param {Integer} _Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-put_protocoltype
     */
    put_ProtocolType(_Val) {
        result := ComCall(19, this, "uint", _Val, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbSession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SessionId := CallbackCreate(GetMethod(implObj, "get_SessionId"), flags, 2)
        this.vtbl.get_TargetName := CallbackCreate(GetMethod(implObj, "get_TargetName"), flags, 2)
        this.vtbl.put_TargetName := CallbackCreate(GetMethod(implObj, "put_TargetName"), flags, 2)
        this.vtbl.get_Username := CallbackCreate(GetMethod(implObj, "get_Username"), flags, 2)
        this.vtbl.get_Domain := CallbackCreate(GetMethod(implObj, "get_Domain"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.put_State := CallbackCreate(GetMethod(implObj, "put_State"), flags, 2)
        this.vtbl.get_CreateTime := CallbackCreate(GetMethod(implObj, "get_CreateTime"), flags, 2)
        this.vtbl.put_CreateTime := CallbackCreate(GetMethod(implObj, "put_CreateTime"), flags, 2)
        this.vtbl.get_DisconnectTime := CallbackCreate(GetMethod(implObj, "get_DisconnectTime"), flags, 2)
        this.vtbl.put_DisconnectTime := CallbackCreate(GetMethod(implObj, "put_DisconnectTime"), flags, 2)
        this.vtbl.get_InitialProgram := CallbackCreate(GetMethod(implObj, "get_InitialProgram"), flags, 2)
        this.vtbl.put_InitialProgram := CallbackCreate(GetMethod(implObj, "put_InitialProgram"), flags, 2)
        this.vtbl.get_ClientDisplay := CallbackCreate(GetMethod(implObj, "get_ClientDisplay"), flags, 2)
        this.vtbl.put_ClientDisplay := CallbackCreate(GetMethod(implObj, "put_ClientDisplay"), flags, 2)
        this.vtbl.get_ProtocolType := CallbackCreate(GetMethod(implObj, "get_ProtocolType"), flags, 2)
        this.vtbl.put_ProtocolType := CallbackCreate(GetMethod(implObj, "put_ProtocolType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SessionId)
        CallbackFree(this.vtbl.get_TargetName)
        CallbackFree(this.vtbl.put_TargetName)
        CallbackFree(this.vtbl.get_Username)
        CallbackFree(this.vtbl.get_Domain)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.put_State)
        CallbackFree(this.vtbl.get_CreateTime)
        CallbackFree(this.vtbl.put_CreateTime)
        CallbackFree(this.vtbl.get_DisconnectTime)
        CallbackFree(this.vtbl.put_DisconnectTime)
        CallbackFree(this.vtbl.get_InitialProgram)
        CallbackFree(this.vtbl.put_InitialProgram)
        CallbackFree(this.vtbl.get_ClientDisplay)
        CallbackFree(this.vtbl.put_ClientDisplay)
        CallbackFree(this.vtbl.get_ProtocolType)
        CallbackFree(this.vtbl.put_ProtocolType)
    }
}

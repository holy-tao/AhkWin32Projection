#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\CLIENT_DISPLAY.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes properties that store information about a user session.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbsession
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbSession extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbSession
     * @type {Guid}
     */
    static IID => Guid("{d453aac7-b1d8-4c5e-ba34-9afb4c8c5510}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SessionId", "get_TargetName", "put_TargetName", "get_Username", "get_Domain", "get_State", "put_State", "get_CreateTime", "put_CreateTime", "get_DisconnectTime", "put_DisconnectTime", "get_InitialProgram", "put_InitialProgram", "get_ClientDisplay", "put_ClientDisplay", "get_ProtocolType", "put_ProtocolType"]

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
     * @type {Integer} 
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_sessionid
     */
    get_SessionId() {
        result := ComCall(3, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_targetname
     */
    get_TargetName() {
        targetName := BSTR()
        result := ComCall(4, this, "ptr", targetName, "HRESULT")
        return targetName
    }

    /**
     * 
     * @param {BSTR} targetName 
     * @returns {HRESULT} 
     */
    put_TargetName(targetName) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName

        result := ComCall(5, this, "ptr", targetName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_username
     */
    get_Username() {
        userName := BSTR()
        result := ComCall(6, this, "ptr", userName, "HRESULT")
        return userName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_domain
     */
    get_Domain() {
        domain := BSTR()
        result := ComCall(7, this, "ptr", domain, "HRESULT")
        return domain
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_state
     */
    get_State() {
        result := ComCall(8, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-put_state
     */
    put_State(State) {
        result := ComCall(9, this, "int", State, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_createtime
     */
    get_CreateTime() {
        pTime := FILETIME()
        result := ComCall(10, this, "ptr", pTime, "HRESULT")
        return pTime
    }

    /**
     * 
     * @param {FILETIME} Time 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-put_createtime
     */
    put_CreateTime(Time) {
        result := ComCall(11, this, "ptr", Time, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_disconnecttime
     */
    get_DisconnectTime() {
        pTime := FILETIME()
        result := ComCall(12, this, "ptr", pTime, "HRESULT")
        return pTime
    }

    /**
     * 
     * @param {FILETIME} Time 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-put_disconnecttime
     */
    put_DisconnectTime(Time) {
        result := ComCall(13, this, "ptr", Time, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_initialprogram
     */
    get_InitialProgram() {
        app := BSTR()
        result := ComCall(14, this, "ptr", app, "HRESULT")
        return app
    }

    /**
     * 
     * @param {BSTR} Application 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-put_initialprogram
     */
    put_InitialProgram(Application) {
        Application := Application is String ? BSTR.Alloc(Application).Value : Application

        result := ComCall(15, this, "ptr", Application, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {CLIENT_DISPLAY} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_clientdisplay
     */
    get_ClientDisplay() {
        pClientDisplay := CLIENT_DISPLAY()
        result := ComCall(16, this, "ptr", pClientDisplay, "HRESULT")
        return pClientDisplay
    }

    /**
     * 
     * @param {CLIENT_DISPLAY} pClientDisplay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-put_clientdisplay
     */
    put_ClientDisplay(pClientDisplay) {
        result := ComCall(17, this, "ptr", pClientDisplay, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_protocoltype
     */
    get_ProtocolType() {
        result := ComCall(18, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} Val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-put_protocoltype
     */
    put_ProtocolType(Val) {
        result := ComCall(19, this, "uint", Val, "HRESULT")
        return result
    }
}

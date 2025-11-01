#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_sessionid
     */
    get_SessionId(pVal) {
        pValMarshal := pVal is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} targetName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_targetname
     */
    get_TargetName(targetName) {
        result := ComCall(4, this, "ptr", targetName, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} userName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_username
     */
    get_Username(userName) {
        result := ComCall(6, this, "ptr", userName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} domain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_domain
     */
    get_Domain(domain) {
        result := ComCall(7, this, "ptr", domain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_state
     */
    get_State(pState) {
        pStateMarshal := pState is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pStateMarshal, pState, "HRESULT")
        return result
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
     * @param {Pointer<FILETIME>} pTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_createtime
     */
    get_CreateTime(pTime) {
        result := ComCall(10, this, "ptr", pTime, "HRESULT")
        return result
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
     * @param {Pointer<FILETIME>} pTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_disconnecttime
     */
    get_DisconnectTime(pTime) {
        result := ComCall(12, this, "ptr", pTime, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} app 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_initialprogram
     */
    get_InitialProgram(app) {
        result := ComCall(14, this, "ptr", app, "HRESULT")
        return result
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
     * @param {Pointer<CLIENT_DISPLAY>} pClientDisplay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_clientdisplay
     */
    get_ClientDisplay(pClientDisplay) {
        result := ComCall(16, this, "ptr", pClientDisplay, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbsession-get_protocoltype
     */
    get_ProtocolType(pVal) {
        pValMarshal := pVal is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, pValMarshal, pVal, "HRESULT")
        return result
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

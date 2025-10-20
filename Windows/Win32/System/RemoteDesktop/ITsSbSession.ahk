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
     * 
     * @param {Pointer<UInt32>} pVal 
     * @returns {HRESULT} 
     */
    get_SessionId(pVal) {
        result := ComCall(3, this, "uint*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} targetName 
     * @returns {HRESULT} 
     */
    get_TargetName(targetName) {
        result := ComCall(4, this, "ptr", targetName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} targetName 
     * @returns {HRESULT} 
     */
    put_TargetName(targetName) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName

        result := ComCall(5, this, "ptr", targetName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} userName 
     * @returns {HRESULT} 
     */
    get_Username(userName) {
        result := ComCall(6, this, "ptr", userName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} domain 
     * @returns {HRESULT} 
     */
    get_Domain(domain) {
        result := ComCall(7, this, "ptr", domain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    get_State(pState) {
        result := ComCall(8, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    put_State(State) {
        result := ComCall(9, this, "int", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pTime 
     * @returns {HRESULT} 
     */
    get_CreateTime(pTime) {
        result := ComCall(10, this, "ptr", pTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {FILETIME} Time 
     * @returns {HRESULT} 
     */
    put_CreateTime(Time) {
        result := ComCall(11, this, "ptr", Time, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pTime 
     * @returns {HRESULT} 
     */
    get_DisconnectTime(pTime) {
        result := ComCall(12, this, "ptr", pTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {FILETIME} Time 
     * @returns {HRESULT} 
     */
    put_DisconnectTime(Time) {
        result := ComCall(13, this, "ptr", Time, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} app 
     * @returns {HRESULT} 
     */
    get_InitialProgram(app) {
        result := ComCall(14, this, "ptr", app, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Application 
     * @returns {HRESULT} 
     */
    put_InitialProgram(Application) {
        Application := Application is String ? BSTR.Alloc(Application).Value : Application

        result := ComCall(15, this, "ptr", Application, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CLIENT_DISPLAY>} pClientDisplay 
     * @returns {HRESULT} 
     */
    get_ClientDisplay(pClientDisplay) {
        result := ComCall(16, this, "ptr", pClientDisplay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {CLIENT_DISPLAY} pClientDisplay 
     * @returns {HRESULT} 
     */
    put_ClientDisplay(pClientDisplay) {
        result := ComCall(17, this, "ptr", pClientDisplay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pVal 
     * @returns {HRESULT} 
     */
    get_ProtocolType(pVal) {
        result := ComCall(18, this, "uint*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Val 
     * @returns {HRESULT} 
     */
    put_ProtocolType(Val) {
        result := ComCall(19, this, "uint", Val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

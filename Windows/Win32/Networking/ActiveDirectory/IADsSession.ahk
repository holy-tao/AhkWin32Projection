#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADs.ahk" { IADs }

/**
 * The IADsSession interface is a dual interface that inherits from IADs. It is designed to represent an active session for file service across a network.
 * @remarks
 * When a remote user opens resources on a target computer, an active session is established between the remote user and that computer. Many resources can be opened in a single active session. ADSI represents this process with a session object that implements this interface.
 * 
 * Call the methods of this interface to examine session-specific data, for example, who is using the session, which computer is used, and the time elapsed for the current session.
 * 
 * Sessions are managed by the file service. To obtain session objects, first bind to this service ("LanmanServer" or "FPNW").
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadssession
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsSession extends IADs {
    /**
     * The interface identifier for IADsSession
     * @type {Guid}
     */
    static IID := Guid("{398b7da0-4aab-11cf-ae2c-00aa006ebfb9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsSession interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_User         : IntPtr
        get_UserPath     : IntPtr
        get_Computer     : IntPtr
        get_ComputerPath : IntPtr
        get_ConnectTime  : IntPtr
        get_IdleTime     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    User {
        get => this.get_User()
    }

    /**
     * @type {BSTR} 
     */
    UserPath {
        get => this.get_UserPath()
    }

    /**
     * @type {BSTR} 
     */
    Computer {
        get => this.get_Computer()
    }

    /**
     * @type {BSTR} 
     */
    ComputerPath {
        get => this.get_ComputerPath()
    }

    /**
     * @type {Integer} 
     */
    ConnectTime {
        get => this.get_ConnectTime()
    }

    /**
     * @type {Integer} 
     */
    IdleTime {
        get => this.get_IdleTime()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_User() {
        retval := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserPath() {
        retval := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Computer() {
        retval := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ComputerPath() {
        retval := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConnectTime() {
        result := ComCall(24, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IdleTime() {
        result := ComCall(25, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IADsSession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_User := CallbackCreate(GetMethod(implObj, "get_User"), flags, 2)
        this.vtbl.get_UserPath := CallbackCreate(GetMethod(implObj, "get_UserPath"), flags, 2)
        this.vtbl.get_Computer := CallbackCreate(GetMethod(implObj, "get_Computer"), flags, 2)
        this.vtbl.get_ComputerPath := CallbackCreate(GetMethod(implObj, "get_ComputerPath"), flags, 2)
        this.vtbl.get_ConnectTime := CallbackCreate(GetMethod(implObj, "get_ConnectTime"), flags, 2)
        this.vtbl.get_IdleTime := CallbackCreate(GetMethod(implObj, "get_IdleTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_User)
        CallbackFree(this.vtbl.get_UserPath)
        CallbackFree(this.vtbl.get_Computer)
        CallbackFree(this.vtbl.get_ComputerPath)
        CallbackFree(this.vtbl.get_ConnectTime)
        CallbackFree(this.vtbl.get_IdleTime)
    }
}

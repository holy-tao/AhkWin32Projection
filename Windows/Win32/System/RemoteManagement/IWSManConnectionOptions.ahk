#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWSManConnectionOptions object is passed to the IWSMan::CreateSession method to provide the user name and password associated with the local account on the remote computer.
 * @remarks
 * If a   Windows Remote Management client application  is running under impersonation, then a failure occurs if you set  the <a href="https://docs.microsoft.com/windows/desktop/WinRM/connectionoptions-password">Password</a> property. A client application is a script or other program that sends a request to  WinRM on the local or a remote computer. The client application may be running under impersonation because it called a function like <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa375494(v=vs.85)">ImpersonateClient</a>. An Active Server Page (ASP) or service cannot request a user name and password if the ASP process runs under an account that impersonates a client.
 * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nn-wsmandisp-iwsmanconnectionoptions
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct IWSManConnectionOptions extends IDispatch {
    /**
     * The interface identifier for IWSManConnectionOptions
     * @type {Guid}
     */
    static IID := Guid("{f704e861-9e52-464f-b786-da5eb2320fdd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSManConnectionOptions interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_UserName : IntPtr
        put_UserName : IntPtr
        put_Password : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSManConnectionOptions.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    UserName {
        get => this.get_UserName()
        set => this.put_UserName(value)
    }

    /**
     * @type {BSTR} 
     */
    Password {
        set => this.put_Password(value)
    }

    /**
     * Sets and gets the user name of a local or a domain account on the remote computer. This property determines the user name for authentication. (Get)
     * @remarks
     * You can supply <a href="https://docs.microsoft.com/windows/desktop/WinRM/connectionoptions-username">UserName</a> and <a href="https://docs.microsoft.com/windows/desktop/WinRM/connectionoptions-password">Password</a> for a domain account when using <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">Negotiate</a> or <i>Kerberos</i> authentication, or for a local account with <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">Basic</a> authentication.  To connect to a local account, the <a href="https://docs.microsoft.com/windows/desktop/WinRM/wsman-createsession">WSMan.CreateSession</a> flags must contain the combination of the <b>WSManFlagUseBasic</b> flag and  the <b>WsmanFlagCredUserNamePassword</b> flag. To connect to a domain account, the <b>WSMan.CreateSession</b> flags must contain the combination of the <b>WSManFlagUseNegotiate</b> flag and  the <b>WsmanFlagCredUserNamePassword</b> flag, or the combination of the <b>WSManFlagUseKerberos</b> flag and  the <b>WsmanFlagCredUserNamePassword</b> flag. For a domain account, <b>UserName</b> must be specified in the form "computer\username", where the "computer" part of the string can be either the name or the IP address. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinRM/authentication-for-remote-connections">Authentication for Remote Connections</a>.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptions-get_username
     */
    get_UserName() {
        name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * Sets and gets the user name of a local or a domain account on the remote computer. This property determines the user name for authentication. (Put)
     * @remarks
     * You can supply <a href="https://docs.microsoft.com/windows/desktop/WinRM/connectionoptions-username">UserName</a> and <a href="https://docs.microsoft.com/windows/desktop/WinRM/connectionoptions-password">Password</a> for a domain account when using <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">Negotiate</a> or <i>Kerberos</i> authentication, or for a local account with <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">Basic</a> authentication.  To connect to a local account, the <a href="https://docs.microsoft.com/windows/desktop/WinRM/wsman-createsession">WSMan.CreateSession</a> flags must contain the combination of the <b>WSManFlagUseBasic</b> flag and  the <b>WsmanFlagCredUserNamePassword</b> flag. To connect to a domain account, the <b>WSMan.CreateSession</b> flags must contain the combination of the <b>WSManFlagUseNegotiate</b> flag and  the <b>WsmanFlagCredUserNamePassword</b> flag, or the combination of the <b>WSManFlagUseKerberos</b> flag and  the <b>WsmanFlagCredUserNamePassword</b> flag. For a domain account, <b>UserName</b> must be specified in the form "computer\username", where the "computer" part of the string can be either the name or the IP address. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinRM/authentication-for-remote-connections">Authentication for Remote Connections</a>.
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptions-put_username
     */
    put_UserName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * Sets the password of a local or a domain account on the remote computer.
     * @param {BSTR} password 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptions-put_password
     */
    put_Password(password) {
        password := password is String ? BSTR.Alloc(password).Value : password

        result := ComCall(9, this, BSTR, password, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWSManConnectionOptions.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_UserName := CallbackCreate(GetMethod(implObj, "get_UserName"), flags, 2)
        this.vtbl.put_UserName := CallbackCreate(GetMethod(implObj, "put_UserName"), flags, 2)
        this.vtbl.put_Password := CallbackCreate(GetMethod(implObj, "put_Password"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_UserName)
        CallbackFree(this.vtbl.put_UserName)
        CallbackFree(this.vtbl.put_Password)
    }
}

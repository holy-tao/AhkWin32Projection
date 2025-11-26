#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IWSManConnectionOptions object is passed to the IWSMan::CreateSession method to provide the user name and password associated with the local account on the remote computer.
 * @remarks
 * 
 * If a   Windows Remote Management client application  is running under impersonation, then a failure occurs if you set  the <a href="https://docs.microsoft.com/windows/desktop/WinRM/connectionoptions-password">Password</a> property. A client application is a script or other program that sends a request to  WinRM on the local or a remote computer. The client application may be running under impersonation because it called a function like <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa375494(v=vs.85)">ImpersonateClient</a>. An Active Server Page (ASP) or service cannot request a user name and password if the ASP process runs under an account that impersonates a client.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nn-wsmandisp-iwsmanconnectionoptions
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class IWSManConnectionOptions extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSManConnectionOptions
     * @type {Guid}
     */
    static IID => Guid("{f704e861-9e52-464f-b786-da5eb2320fdd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserName", "put_UserName", "put_Password"]

    /**
     * @type {BSTR} 
     */
    UserName {
        get => this.get_UserName()
        set => this.put_UserName(value)
    }

    /**
     * @type {HRESULT} 
     */
    Password {
        set => this.put_Password(value)
    }

    /**
     * Sets and gets the user name of a local or a domain account on the remote computer. This property determines the user name for authentication.
     * @remarks
     * 
     * You can supply <a href="https://docs.microsoft.com/windows/desktop/WinRM/connectionoptions-username">UserName</a> and <a href="https://docs.microsoft.com/windows/desktop/WinRM/connectionoptions-password">Password</a> for a domain account when using <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">Negotiate</a> or <i>Kerberos</i> authentication, or for a local account with <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">Basic</a> authentication.  To connect to a local account, the <a href="https://docs.microsoft.com/windows/desktop/WinRM/wsman-createsession">WSMan.CreateSession</a> flags must contain the combination of the <b>WSManFlagUseBasic</b>flag and  the <b>WsmanFlagCredUserNamePassword</b> flag. To connect to a domain account, the <b>WSMan.CreateSession</b> flags must contain the combination of the <b>WSManFlagUseNegotiate</b>flag and  the <b>WsmanFlagCredUserNamePassword</b> flag, or the combination of the <b>WSManFlagUseKerberos</b>flag and  the <b>WsmanFlagCredUserNamePassword</b> flag. For a domain account, <b>UserName</b> must be specified in the form "computer\username", where the "computer" part of the string can be either the name or the IP address. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinRM/authentication-for-remote-connections">Authentication for Remote Connections</a>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanconnectionoptions-get_username
     */
    get_UserName() {
        name := BSTR()
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Sets and gets the user name of a local or a domain account on the remote computer. This property determines the user name for authentication.
     * @remarks
     * 
     * You can supply <a href="https://docs.microsoft.com/windows/desktop/WinRM/connectionoptions-username">UserName</a> and <a href="https://docs.microsoft.com/windows/desktop/WinRM/connectionoptions-password">Password</a> for a domain account when using <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">Negotiate</a> or <i>Kerberos</i> authentication, or for a local account with <a href="https://docs.microsoft.com/windows/desktop/WinRM/windows-remote-management-glossary">Basic</a> authentication.  To connect to a local account, the <a href="https://docs.microsoft.com/windows/desktop/WinRM/wsman-createsession">WSMan.CreateSession</a> flags must contain the combination of the <b>WSManFlagUseBasic</b>flag and  the <b>WsmanFlagCredUserNamePassword</b> flag. To connect to a domain account, the <b>WSMan.CreateSession</b> flags must contain the combination of the <b>WSManFlagUseNegotiate</b>flag and  the <b>WsmanFlagCredUserNamePassword</b> flag, or the combination of the <b>WSManFlagUseKerberos</b>flag and  the <b>WsmanFlagCredUserNamePassword</b> flag. For a domain account, <b>UserName</b> must be specified in the form "computer\username", where the "computer" part of the string can be either the name or the IP address. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinRM/authentication-for-remote-connections">Authentication for Remote Connections</a>.
     * 
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanconnectionoptions-put_username
     */
    put_UserName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Sets the password of a local or a domain account on the remote computer.
     * @param {BSTR} password 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanconnectionoptions-put_password
     */
    put_Password(password) {
        password := password is String ? BSTR.Alloc(password).Value : password

        result := ComCall(9, this, "ptr", password, "HRESULT")
        return result
    }
}

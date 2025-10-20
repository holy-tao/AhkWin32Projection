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
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_UserName(name) {
        result := ComCall(7, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    put_UserName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} password 
     * @returns {HRESULT} 
     */
    put_Password(password) {
        password := password is String ? BSTR.Alloc(password).Value : password

        result := ComCall(9, this, "ptr", password, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

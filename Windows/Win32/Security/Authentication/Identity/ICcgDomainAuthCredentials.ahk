#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A client-implemented interface that allows developers to supply their own credentials dynamically at run time to authenticate non-domain joined containers with Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/ccgplugins/nn-ccgplugins-iccgdomainauthcredentials
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct ICcgDomainAuthCredentials extends IUnknown {
    /**
     * The interface identifier for ICcgDomainAuthCredentials
     * @type {Guid}
     */
    static IID := Guid("{6ecda518-2010-4437-8bc3-46e752b7b172}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICcgDomainAuthCredentials interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPasswordCredentials : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICcgDomainAuthCredentials.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns credentials to authenticate a non-domain joined container with Active Directory.
     * @remarks
     * The API may be called concurrently. Therefore, the developer needs to ensure that their implementation is thread safe. Additionally, the COM object will be activated out-of-proc and it must be registered appropriately.
     * 
     * The implementer must add a key under “HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CCG\COMClasses” for their COM CLSID. Write access to “CCG\COMClasses” is restricted to SYSTEM and Administrator accounts.
     * 
     * The following is an example credential specification file. For information on supplying this file to Docker, see [Run a container with a gMSA](/virtualization/windowscontainers/manage-containers/gmsa-run-container).
     * 
     * ```json
     * {
     *     "CmsPlugins": [
     *         "ActiveDirectory"
     *     ],
     *     "DomainJoinConfig": {
     *         "Sid": "S-1-5-21-3700119848-2853083131-2094573802",
     *         "MachineAccountName": "gmsa1",
     *         "Guid": "630a7dd3-2d3e-4471-ae91-1d9ea2556cd5",
     *         "DnsTreeName": "contoso.com",
     *         "DnsName": "contoso.com",
     *         "NetBiosName": "CONTOSO"
     *     },
     *     "ActiveDirectoryConfig": {
     *         "GroupManagedServiceAccounts": [
     *             {
     *                 "Name": "gmsa1",
     *                 "Scope": "contoso.com"
     *             },
     *             {
     *                 "Name": "gmsa1",
     *                 "Scope": "CONTOSO"
     *             }
     *         ],
     *         "HostAccountConfig": {
     *             "PortableCcgVersion": "1",
     *             "PluginGUID": "{CFCA0441-511D-4B2A-862E-20348A78760B}",
     *             "PluginInput": "contoso.com:gmsaccg:<password>"
     *         }
     *     }
     * }
     * ```
     * @param {PWSTR} pluginInput An input string passed in by the container runtime. The client implementation uses the provided input string to retrieve authentication credentials, typically from a secure storage provider, that are returned in the output parameters. The input string is provided to the Host Compute Services (HCS) in a credential specification file. For more information, see the **Remarks** section.
     * @param {Pointer<PWSTR>} domainName The domain name for the credentials
     * @param {Pointer<PWSTR>} username The user name for the credentials.
     * @param {Pointer<PWSTR>} password The password for the credentials.
     * @returns {HRESULT} The return value is an HRESULT. A value of S_OK indicates the call was successful.
     * @see https://learn.microsoft.com/windows/win32/api/ccgplugins/nf-ccgplugins-iccgdomainauthcredentials-getpasswordcredentials
     */
    GetPasswordCredentials(pluginInput, domainName, username, password) {
        pluginInput := pluginInput is String ? StrPtr(pluginInput) : pluginInput

        domainNameMarshal := domainName is VarRef ? "ptr*" : "ptr"
        usernameMarshal := username is VarRef ? "ptr*" : "ptr"
        passwordMarshal := password is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pluginInput, domainNameMarshal, domainName, usernameMarshal, username, passwordMarshal, password, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICcgDomainAuthCredentials.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPasswordCredentials := CallbackCreate(GetMethod(implObj, "GetPasswordCredentials"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPasswordCredentials)
    }
}

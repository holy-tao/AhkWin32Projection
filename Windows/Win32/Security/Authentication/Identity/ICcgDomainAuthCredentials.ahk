#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * A client-implemented interface that allows developers to supply their own credentials dynamically at run time to authenticate non-domain joined containers with Active Directory.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ccgplugins/nn-ccgplugins-iccgdomainauthcredentials
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class ICcgDomainAuthCredentials extends IUnknown{
    /**
     * The interface identifier for ICcgDomainAuthCredentials
     * @type {Guid}
     */
    static IID => Guid("{6ecda518-2010-4437-8bc3-46e752b7b172}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pluginInput 
     * @param {Pointer<PWSTR>} domainName 
     * @param {Pointer<PWSTR>} username 
     * @param {Pointer<PWSTR>} password 
     * @returns {HRESULT} 
     */
    GetPasswordCredentials(pluginInput, domainName, username, password) {
        pluginInput := pluginInput is String ? StrPtr(pluginInput) : pluginInput

        result := ComCall(3, this, "ptr", pluginInput, "ptr", domainName, "ptr", username, "ptr", password, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

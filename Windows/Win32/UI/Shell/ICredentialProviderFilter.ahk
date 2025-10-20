#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to dynamically filter credential providers based on information available at runtime.
 * @remarks
 * 
  * It is recommended that third party credential providers do not use this interface to filter or disable system credential providers on a desktop. If an enterprise deploys a third party credential provider and wants to disable system credential providers currently available, that is a decision that should be made by a domain administrator after careful consideration. System policies exist that enable administrators to filter out credential providers and those should be used instead of building filters directly into a third party credential provider.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nn-credentialprovider-icredentialproviderfilter
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICredentialProviderFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICredentialProviderFilter
     * @type {Guid}
     */
    static IID => Guid("{a5da53f9-d475-4080-a120-910c4a739880}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Filter", "UpdateRemoteCredential"]

    /**
     * 
     * @param {Integer} cpus 
     * @param {Integer} dwFlags 
     * @param {Pointer<Guid>} rgclsidProviders 
     * @param {Pointer<BOOL>} rgbAllow 
     * @param {Integer} cProviders 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialproviderfilter-filter
     */
    Filter(cpus, dwFlags, rgclsidProviders, rgbAllow, cProviders) {
        result := ComCall(3, this, "int", cpus, "uint", dwFlags, "ptr", rgclsidProviders, "ptr", rgbAllow, "uint", cProviders, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION>} pcpcsIn 
     * @param {Pointer<CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION>} pcpcsOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialproviderfilter-updateremotecredential
     */
    UpdateRemoteCredential(pcpcsIn, pcpcsOut) {
        result := ComCall(4, this, "ptr", pcpcsIn, "ptr", pcpcsOut, "HRESULT")
        return result
    }
}

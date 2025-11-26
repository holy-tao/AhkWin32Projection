#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION.ahk
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
     * Evaluates whether a list of credential providers should be allowed to provide credential tiles.
     * @param {Integer} cpus Type: <b><a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_usage_scenario">CREDENTIAL_PROVIDER_USAGE_SCENARIO</a></b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_usage_scenario">CREDENTIAL_PROVIDER_USAGE_SCENARIO</a> value that declares the scenarios in which a credential provider is supported.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Usage scenario flags. This parameter is valid only if <i>cpus</i> is CPUS_CREDUI. They are defined in Wincred.h.
     * @param {Pointer<Guid>} rgclsidProviders Type: <b>GUID*</b>
     * 
     * A pointer to an array of credential provider CLSIDs.
     * @param {Pointer<BOOL>} rgbAllow Type: <b>BOOL*</b>
     * 
     * On entry, a pointer to an array of <b>BOOL</b> values, one for each corresponding member of the <i>rgclsidProviders</i> array, all initialized to <b>TRUE</b>. 
     * 
     *                     
     * 
     * On exit, contains <b>TRUE</b> if the corresponding credential provider in <i>rgclsidProviders</i> is allowed to provide a credential tile; otherwise, <b>FALSE</b>.
     * @param {Integer} cProviders Type: <b>DWORD</b>
     * 
     * The number of members in <i>rgbAllow</i> or <i>rgclsidProviders</i> (they should be the same).
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialproviderfilter-filter
     */
    Filter(cpus, dwFlags, rgclsidProviders, rgbAllow, cProviders) {
        rgbAllowMarshal := rgbAllow is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "int", cpus, "uint", dwFlags, "ptr", rgclsidProviders, rgbAllowMarshal, rgbAllow, "uint", cProviders, "HRESULT")
        return result
    }

    /**
     * Updates a credential from a remote session.
     * @param {Pointer<CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION>} pcpcsIn Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_credential_serialization">CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION</a>*</b>
     * 
     * A constant pointer to a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_credential_serialization">CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION</a> structure.
     * @returns {CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_credential_serialization">CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_credential_serialization">CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nf-credentialprovider-icredentialproviderfilter-updateremotecredential
     */
    UpdateRemoteCredential(pcpcsIn) {
        pcpcsOut := CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION()
        result := ComCall(4, this, "ptr", pcpcsIn, "ptr", pcpcsOut, "HRESULT")
        return pcpcsOut
    }
}

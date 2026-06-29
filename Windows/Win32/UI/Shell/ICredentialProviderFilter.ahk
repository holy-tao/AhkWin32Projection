#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CREDENTIAL_PROVIDER_USAGE_SCENARIO.ahk" { CREDENTIAL_PROVIDER_USAGE_SCENARIO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION.ahk" { CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to dynamically filter credential providers based on information available at runtime.
 * @remarks
 * It is recommended that third party credential providers do not use this interface to filter or disable system credential providers on a desktop. If an enterprise deploys a third party credential provider and wants to disable system credential providers currently available, that is a decision that should be made by a domain administrator after careful consideration. System policies exist that enable administrators to filter out credential providers and those should be used instead of building filters directly into a third party credential provider.
 * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialproviderfilter
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ICredentialProviderFilter extends IUnknown {
    /**
     * The interface identifier for ICredentialProviderFilter
     * @type {Guid}
     */
    static IID := Guid("{a5da53f9-d475-4080-a120-910c4a739880}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICredentialProviderFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Filter                 : IntPtr
        UpdateRemoteCredential : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICredentialProviderFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Evaluates whether a list of credential providers should be allowed to provide credential tiles.
     * @remarks
     * On entry, this method receives two parallel arrays; <i>rgclsidProviders</i>, which contains the credential provider CLSIDs and <i>rgbAllow</i>, which contains <b>BOOL</b> values for the corresponding CLSIDs. <b>ICredentialProviderFilter::Filter</b> looks at each credential provider in <i>rgclsidProviders</i> and decides whether the credential provider should be allowed to enumerate credential tiles for the scenario specified by <i>dwFlags</i>. If this is acceptable, the corresponding entry in <i>rgbAllow</i> is set to <b>TRUE</b>. If this is unacceptable, it is set to <b>FALSE</b>.
     * 
     * Never filter out a CLSID for a credential provider that you do not know about.
     * 
     * Do not filter if <i>cpus</i> is CPUS_CREDUI and a <i>dwFlags</i> value of CREDUIWIN_GENERIC is passed in.
     * 
     * It is legitimate to return success from the method and not modify <i>rgbAllow</i>.
     * @param {CREDENTIAL_PROVIDER_USAGE_SCENARIO} cpus Type: <b><a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_usage_scenario">CREDENTIAL_PROVIDER_USAGE_SCENARIO</a></b>
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
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialproviderfilter-filter
     */
    Filter(cpus, dwFlags, rgclsidProviders, rgbAllow, cProviders) {
        rgbAllowMarshal := rgbAllow is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, CREDENTIAL_PROVIDER_USAGE_SCENARIO, cpus, "uint", dwFlags, Guid.Ptr, rgclsidProviders, rgbAllowMarshal, rgbAllow, "uint", cProviders, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialproviderfilter-updateremotecredential
     */
    UpdateRemoteCredential(pcpcsIn) {
        pcpcsOut := CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION()
        result := ComCall(4, this, CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION.Ptr, pcpcsIn, CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION.Ptr, pcpcsOut, "HRESULT")
        return pcpcsOut
    }

    Query(iid) {
        if (ICredentialProviderFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Filter := CallbackCreate(GetMethod(implObj, "Filter"), flags, 6)
        this.vtbl.UpdateRemoteCredential := CallbackCreate(GetMethod(implObj, "UpdateRemoteCredential"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Filter)
        CallbackFree(this.vtbl.UpdateRemoteCredential)
    }
}

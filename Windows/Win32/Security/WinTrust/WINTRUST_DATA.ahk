#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINTRUST_DATA_UICHOICE.ahk" { WINTRUST_DATA_UICHOICE }
#Import ".\WINTRUST_CERT_INFO.ahk" { WINTRUST_CERT_INFO }
#Import ".\WINTRUST_DATA_UICONTEXT.ahk" { WINTRUST_DATA_UICONTEXT }
#Import ".\WINTRUST_BLOB_INFO.ahk" { WINTRUST_BLOB_INFO }
#Import ".\WINTRUST_SGNR_INFO.ahk" { WINTRUST_SGNR_INFO }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WINTRUST_SIGNATURE_SETTINGS.ahk" { WINTRUST_SIGNATURE_SETTINGS }
#Import ".\WINTRUST_CATALOG_INFO.ahk" { WINTRUST_CATALOG_INFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WINTRUST_DATA_STATE_ACTION.ahk" { WINTRUST_DATA_STATE_ACTION }
#Import ".\WINTRUST_DATA_PROVIDER_FLAGS.ahk" { WINTRUST_DATA_PROVIDER_FLAGS }
#Import ".\WINTRUST_FILE_INFO.ahk" { WINTRUST_FILE_INFO }
#Import ".\WINTRUST_DATA_UNION_CHOICE.ahk" { WINTRUST_DATA_UNION_CHOICE }
#Import ".\WINTRUST_DATA_REVOCATION_CHECKS.ahk" { WINTRUST_DATA_REVOCATION_CHECKS }
#Import ".\WINTRUST_DETACHED_SIG_INFO.ahk" { WINTRUST_DETACHED_SIG_INFO }

/**
 * Used when calling WinVerifyTrust to pass necessary information into the trust providers.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-wintrust_data
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_DATA {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * A pointer to a data buffer used to pass policy-specific data to a policy provider. This member can be <b>NULL</b>.
     */
    pPolicyCallbackData : IntPtr

    /**
     * A pointer to a data buffer used to pass <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">subject interface package</a> (SIP)-specific data to a SIP provider. This member can be <b>NULL</b>.
     */
    pSIPClientData : IntPtr

    dwUIChoice : WINTRUST_DATA_UICHOICE

    fdwRevocationChecks : WINTRUST_DATA_REVOCATION_CHECKS

    dwUnionChoice : WINTRUST_DATA_UNION_CHOICE

    pFile : WINTRUST_FILE_INFO.Ptr

    dwStateAction : WINTRUST_DATA_STATE_ACTION

    /**
     * A handle to the state data. The contents of this member depends on the value of the <b>dwStateAction</b> member.
     */
    hWVTStateData : HANDLE

    /**
     * Reserved for future use. Set to <b>NULL</b>.
     */
    pwszURLReference : PWSTR

    dwProvFlags : WINTRUST_DATA_PROVIDER_FLAGS

    dwUIContext : WINTRUST_DATA_UICONTEXT

    /**
     * Pointer to a [WINTRUST_SIGNATURE_SETTINGS](/windows/desktop/api/wintrust/ns-wintrust-wintrust_signature_settings) structure.
     * 
     * <b>Windows 8 and Windows Server 2012:  </b>Support for this member begins.
     */
    pSignatureSettings : WINTRUST_SIGNATURE_SETTINGS.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pCatalog', { type: WINTRUST_CATALOG_INFO.Ptr, offset: 40 })
        DefineProp(this.Prototype, 'pBlob', { type: WINTRUST_BLOB_INFO.Ptr, offset: 40 })
        DefineProp(this.Prototype, 'pSgnr', { type: WINTRUST_SGNR_INFO.Ptr, offset: 40 })
        DefineProp(this.Prototype, 'pCert', { type: WINTRUST_CERT_INFO.Ptr, offset: 40 })
        DefineProp(this.Prototype, 'pDetachedSig', { type: WINTRUST_DETACHED_SIG_INFO.Ptr, offset: 40 })
        this.DeleteProp("__New")
    }
}

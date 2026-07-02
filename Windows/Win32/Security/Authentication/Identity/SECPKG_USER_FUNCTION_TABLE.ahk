#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SpVerifySignatureFn.ahk" { SpVerifySignatureFn }
#Import ".\SpUnsealMessageFn.ahk" { SpUnsealMessageFn }
#Import ".\SpDeleteContextFn.ahk" { SpDeleteContextFn }
#Import ".\SpMarshalAttributeDataFn.ahk" { SpMarshalAttributeDataFn }
#Import ".\SpImportSecurityContextFn.ahk" { SpImportSecurityContextFn }
#Import ".\SpMarshallSupplementalCredsFn.ahk" { SpMarshallSupplementalCredsFn }
#Import ".\SpInstanceInitFn.ahk" { SpInstanceInitFn }
#Import ".\SpFormatCredentialsFn.ahk" { SpFormatCredentialsFn }
#Import ".\SpInitUserModeContextFn.ahk" { SpInitUserModeContextFn }
#Import ".\SpQueryContextAttributesFn.ahk" { SpQueryContextAttributesFn }
#Import ".\SpExportSecurityContextFn.ahk" { SpExportSecurityContextFn }
#Import ".\SpMakeSignatureFn.ahk" { SpMakeSignatureFn }
#Import ".\SpGetContextTokenFn.ahk" { SpGetContextTokenFn }
#Import ".\SpCompleteAuthTokenFn.ahk" { SpCompleteAuthTokenFn }
#Import ".\SpSealMessageFn.ahk" { SpSealMessageFn }

/**
 * The SECPKG_USER_FUNCTION_TABLE structure contains pointers to the functions that a security package implements to support executing in process with client/server applications. This structure is provided by the SpUserModeInitialize function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_USER_FUNCTION_TABLE {
    #StructPack 8

    /**
     * Pointer to the <b>InstanceInit</b> function.
     */
    InstanceInit : SpInstanceInitFn

    /**
     * Pointer to the <b>InitUserModeContext</b> function.
     */
    InitUserModeContext : SpInitUserModeContextFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> function.
     */
    MakeSignature : SpMakeSignatureFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-verifysignature">VerifySignature</a> function.
     */
    VerifySignature : SpVerifySignatureFn

    /**
     * Pointer to the <b>SealMessage</b> function.
     */
    SealMessage : SpSealMessageFn

    /**
     * Pointer to the <b>UnsealMessage</b> function.
     */
    UnsealMessage : SpUnsealMessageFn

    /**
     * Pointer to the <b>GetContextToken</b> function.
     */
    GetContextToken : SpGetContextTokenFn

    QueryContextAttributesA : SpQueryContextAttributesFn

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> function.
     */
    CompleteAuthToken : SpCompleteAuthTokenFn

    /**
     * Pointer to the <b>DeleteUserModeContext</b> function.
     */
    DeleteUserModeContext : SpDeleteContextFn

    /**
     * Pointer to the <b>FormatCredentials</b> function.
     */
    FormatCredentials : SpFormatCredentialsFn

    /**
     * Pointer to the <b>MarshallSupplementalCreds</b> function.
     */
    MarshallSupplementalCreds : SpMarshallSupplementalCredsFn

    /**
     * Pointer to the <b>ExportContext</b> function.
     */
    ExportContext : SpExportSecurityContextFn

    /**
     * Pointer to the <b>ImportContext</b> function.
     */
    ImportContext : SpImportSecurityContextFn

    MarshalAttributeData : SpMarshalAttributeDataFn

}

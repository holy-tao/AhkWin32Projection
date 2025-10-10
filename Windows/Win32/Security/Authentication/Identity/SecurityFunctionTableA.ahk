#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecurityFunctionTable structure is a dispatch table that contains pointers to the functions defined in SSPI.
 * @remarks
 * 
  * > [!NOTE]
  * > The sspi.h header defines SecurityFunctionTable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-securityfunctiontablea
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 * @charset ANSI
 */
class SecurityFunctionTableA extends Win32Struct
{
    static sizeof => 256

    static packingSize => 8

    /**
     * Version number of the table.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Pointer<ENUMERATE_SECURITY_PACKAGES_FN_A>}
     */
    EnumerateSecurityPackagesA {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Pointer<QUERY_CREDENTIALS_ATTRIBUTES_FN_A>}
     */
    QueryCredentialsAttributesA {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Pointer<ACQUIRE_CREDENTIALS_HANDLE_FN_A>}
     */
    AcquireCredentialsHandleA {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<FREE_CREDENTIALS_HANDLE_FN>}
     */
    FreeCredentialsHandle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Reserved for future use.
     * @type {Pointer<Void>}
     */
    Reserved2 {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * 
     * @type {Pointer<INITIALIZE_SECURITY_CONTEXT_FN_A>}
     */
    InitializeSecurityContextA {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function.
     * @type {Pointer<ACCEPT_SECURITY_CONTEXT_FN>}
     */
    AcceptSecurityContext {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> function.
     * @type {Pointer<COMPLETE_AUTH_TOKEN_FN>}
     */
    CompleteAuthToken {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-deletesecuritycontext">DeleteSecurityContext</a> function.
     * @type {Pointer<DELETE_SECURITY_CONTEXT_FN>}
     */
    DeleteSecurityContext {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-applycontroltoken">ApplyControlToken</a> function.
     * @type {Pointer<APPLY_CONTROL_TOKEN_FN>}
     */
    ApplyControlToken {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * 
     * @type {Pointer<QUERY_CONTEXT_ATTRIBUTES_FN_A>}
     */
    QueryContextAttributesA {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-impersonatesecuritycontext">ImpersonateSecurityContext</a> function.
     * @type {Pointer<IMPERSONATE_SECURITY_CONTEXT_FN>}
     */
    ImpersonateSecurityContext {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-revertsecuritycontext">RevertSecurityContext</a> function.
     * @type {Pointer<REVERT_SECURITY_CONTEXT_FN>}
     */
    RevertSecurityContext {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> function.
     * @type {Pointer<MAKE_SIGNATURE_FN>}
     */
    MakeSignature {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-verifysignature">VerifySignature</a> function.
     * @type {Pointer<VERIFY_SIGNATURE_FN>}
     */
    VerifySignature {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
     * @type {Pointer<FREE_CONTEXT_BUFFER_FN>}
     */
    FreeContextBuffer {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * 
     * @type {Pointer<QUERY_SECURITY_PACKAGE_INFO_FN_A>}
     */
    QuerySecurityPackageInfoA {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * Reserved for future use.
     * @type {Pointer<Void>}
     */
    Reserved3 {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * Reserved for future use.
     * @type {Pointer<Void>}
     */
    Reserved4 {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-exportsecuritycontext">ExportSecurityContext</a> function.
     * @type {Pointer<EXPORT_SECURITY_CONTEXT_FN>}
     */
    ExportSecurityContext {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * 
     * @type {Pointer<IMPORT_SECURITY_CONTEXT_FN_A>}
     */
    ImportSecurityContextA {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * 
     * @type {Pointer<ADD_CREDENTIALS_FN_A>}
     */
    AddCredentialsA {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * Reserved for future use.
     * @type {Pointer<Void>}
     */
    Reserved8 {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-querysecuritycontexttoken">QuerySecurityContextToken</a> function.
     * @type {Pointer<QUERY_SECURITY_CONTEXT_TOKEN_FN>}
     */
    QuerySecurityContextToken {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage (General)</a> function.
     * @type {Pointer<ENCRYPT_MESSAGE_FN>}
     */
    EncryptMessage {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * Pointer to the   <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-decryptmessage">DecryptMessage (General)</a> function.
     * @type {Pointer<DECRYPT_MESSAGE_FN>}
     */
    DecryptMessage {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * 
     * @type {Pointer<SET_CONTEXT_ATTRIBUTES_FN_A>}
     */
    SetContextAttributesA {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * 
     * @type {Pointer<SET_CREDENTIALS_ATTRIBUTES_FN_A>}
     */
    SetCredentialsAttributesA {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * 
     * @type {Pointer<CHANGE_PASSWORD_FN_A>}
     */
    ChangeAccountPasswordA {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * 
     * @type {Pointer<QUERY_CONTEXT_ATTRIBUTES_EX_FN_A>}
     */
    QueryContextAttributesExA {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * 
     * @type {Pointer<QUERY_CREDENTIALS_ATTRIBUTES_EX_FN_A>}
     */
    QueryCredentialsAttributesExA {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }
}

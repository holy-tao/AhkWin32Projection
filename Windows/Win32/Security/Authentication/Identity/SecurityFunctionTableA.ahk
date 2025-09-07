#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecurityFunctionTable structure is a dispatch table that contains pointers to the functions defined in SSPI. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The sspi.h header defines SecurityFunctionTable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-securityfunctiontablea
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
     * @type {Pointer<Ptr>}
     */
    EnumerateSecurityPackagesA {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    QueryCredentialsAttributesA {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    AcquireCredentialsHandleA {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Ptr>}
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
     * @type {Pointer<Ptr>}
     */
    InitializeSecurityContextA {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-acceptsecuritycontext">AcceptSecurityContext (General)</a> function.
     * @type {Pointer<Ptr>}
     */
    AcceptSecurityContext {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-completeauthtoken">CompleteAuthToken</a> function.
     * @type {Pointer<Ptr>}
     */
    CompleteAuthToken {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-deletesecuritycontext">DeleteSecurityContext</a> function.
     * @type {Pointer<Ptr>}
     */
    DeleteSecurityContext {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-applycontroltoken">ApplyControlToken</a> function.
     * @type {Pointer<Ptr>}
     */
    ApplyControlToken {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    QueryContextAttributesA {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-impersonatesecuritycontext">ImpersonateSecurityContext</a> function.
     * @type {Pointer<Ptr>}
     */
    ImpersonateSecurityContext {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-revertsecuritycontext">RevertSecurityContext</a> function.
     * @type {Pointer<Ptr>}
     */
    RevertSecurityContext {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> function.
     * @type {Pointer<Ptr>}
     */
    MakeSignature {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-verifysignature">VerifySignature</a> function.
     * @type {Pointer<Ptr>}
     */
    VerifySignature {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
     * @type {Pointer<Ptr>}
     */
    FreeContextBuffer {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
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
     * @type {Pointer<Ptr>}
     */
    ExportSecurityContext {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    ImportSecurityContextA {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
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
     * @type {Pointer<Ptr>}
     */
    QuerySecurityContextToken {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-encryptmessage">EncryptMessage (General)</a> function.
     * @type {Pointer<Ptr>}
     */
    EncryptMessage {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * Pointer to the   <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-decryptmessage">DecryptMessage (General)</a> function.
     * @type {Pointer<Ptr>}
     */
    DecryptMessage {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    SetContextAttributesA {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    SetCredentialsAttributesA {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    ChangeAccountPasswordA {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    QueryContextAttributesExA {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    QueryCredentialsAttributesExA {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }
}

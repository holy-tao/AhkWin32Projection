#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SECPKG_USER_FUNCTION_TABLE structure contains pointers to the functions that a security package implements to support executing in process with client/server applications. This structure is provided by the SpUserModeInitialize function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_USER_FUNCTION_TABLE extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * Pointer to the <b>InstanceInit</b> function.
     * @type {Pointer<Ptr>}
     */
    InstanceInit {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to the <b>InitUserModeContext</b> function.
     * @type {Pointer<Ptr>}
     */
    InitUserModeContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-makesignature">MakeSignature</a> function.
     * @type {Pointer<Ptr>}
     */
    MakeSignature {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-verifysignature">VerifySignature</a> function.
     * @type {Pointer<Ptr>}
     */
    VerifySignature {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the <b>SealMessage</b> function.
     * @type {Pointer<Ptr>}
     */
    SealMessage {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the <b>UnsealMessage</b> function.
     * @type {Pointer<Ptr>}
     */
    UnsealMessage {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to the <b>GetContextToken</b> function.
     * @type {Pointer<Ptr>}
     */
    GetContextToken {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    QueryContextAttributesA {
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
     * Pointer to the <b>DeleteUserModeContext</b> function.
     * @type {Pointer<Ptr>}
     */
    DeleteUserModeContext {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Pointer to the <b>FormatCredentials</b> function.
     * @type {Pointer<Ptr>}
     */
    FormatCredentials {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Pointer to the <b>MarshallSupplementalCreds</b> function.
     * @type {Pointer<Ptr>}
     */
    MarshallSupplementalCreds {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Pointer to the <b>ExportContext</b> function.
     * @type {Pointer<Ptr>}
     */
    ExportContext {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Pointer to the <b>ImportContext</b> function.
     * @type {Pointer<Ptr>}
     */
    ImportContext {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    MarshalAttributeData {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}

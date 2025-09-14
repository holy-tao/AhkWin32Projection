#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BCRYPT_INTERFACE_VERSION.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCRYPT_KEY_DERIVATION_FUNCTION_TABLE extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {BCRYPT_INTERFACE_VERSION}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := BCRYPT_INTERFACE_VERSION(this.ptr + 0)
            return this.__Version
        }
    }

    /**
     * @type {Pointer<BCryptOpenAlgorithmProviderFn>}
     */
    OpenAlgorithmProvider {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<BCryptGetPropertyFn>}
     */
    GetProperty {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<BCryptSetPropertyFn>}
     */
    SetProperty {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<BCryptCloseAlgorithmProviderFn>}
     */
    CloseAlgorithmProvider {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<BCryptGenerateSymmetricKeyFn>}
     */
    GenerateKey {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<BCryptDestroyKeyFn>}
     */
    DestroyKey {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<BCryptKeyDerivationFn>}
     */
    KeyDerivation {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<BCryptExportKeyFn>}
     */
    ExportKey {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<BCryptImportKeyFn>}
     */
    ImportKey {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<BCryptDuplicateKeyFn>}
     */
    DuplicateKey {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}

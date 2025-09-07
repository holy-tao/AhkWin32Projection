#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CERT_SYSTEM_STORE_RELOCATE_PARA structure contains data to be passed to CertOpenStore when that function's dwFlags parameter is set to CERT_SYSTEM_STORE_RELOCATE_FLAG.
 * @remarks
 * The relocate capability is used to access system stores persisted in the Group Policy Template (GPT). For example, the Group Policy Editor's MMC snap-in extension for managing group policy trust lists and certificates uses the GPT's base HKEY to call 
  * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certopenstore">CertOpenStore</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_system_store_relocate_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_SYSTEM_STORE_RELOCATE_PARA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<Ptr>}
     */
    hKeyBase {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvBase {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvSystemStore {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pszSystemStore {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pwszSystemStore {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

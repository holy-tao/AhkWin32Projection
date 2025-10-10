#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains private data to be used by a provider.
 * @see https://docs.microsoft.com/windows/win32/api//wintrust/ns-wintrust-crypt_provider_privdata
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class CRYPT_PROVIDER_PRIVDATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <b>GUID</b> that identifies the provider.
     * @type {Pointer<Guid>}
     */
    gProviderID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Number of bytes referenced by <b>pvProvData</b>.
     * @type {Integer}
     */
    cbProvData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to a <b>void</b> that contains the private data.
     * @type {Pointer<Void>}
     */
    pvProvData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

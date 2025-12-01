#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Provides additional information for catalog member subject types.
 * @see https://learn.microsoft.com/windows/win32/api/mssip/ns-mssip-ms_addinfo_catalogmember
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 * @version v4.0.30319
 */
class MS_ADDINFO_CATALOGMEMBER extends Win32Struct
{
    static sizeof => 24

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
     * A [CRYPTCATSTORE](/windows/desktop/api/mscat/ns-mscat-cryptcatstore) structure that contains a catalog file store.
     * @type {Pointer<CRYPTCATSTORE>}
     */
    pStore {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A [CRYPTCATMEMBER](/windows/desktop/api/mscat/ns-mscat-cryptcatmember) structure that contains a catalog member.
     * @type {Pointer<CRYPTCATMEMBER>}
     */
    pMember {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

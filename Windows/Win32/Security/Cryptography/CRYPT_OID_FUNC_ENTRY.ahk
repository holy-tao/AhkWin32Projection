#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an object identifier (OID) and a pointer to its related function.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_oid_func_entry
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_OID_FUNC_ENTRY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * If the high-order word of the OID is nonzero, <b>pszOID</b> is a pointer to either an OID string, such as "2.5.29.1" or an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">ASCII</a> string, such as "file". If the high-order word of the OID is zero, the low-order word specifies the numeric identifier to be used as the object identifier.
     * @type {Pointer<PSTR>}
     */
    pszOID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The starting address of the function that the OID identifies.
     * @type {Pointer<Void>}
     */
    pvFuncAddr {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

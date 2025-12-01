#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains certificate attributes to be added to a certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_add_attributes_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMC_ADD_ATTRIBUTES_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * <b>DWORD</b> data reference number.
     * @type {Integer}
     */
    dwCmcDataReference {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Count of elements in the <b>rgdwCertReference</b> array.
     * @type {Integer}
     */
    cCertReference {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Array of certificate reference numbers.
     * @type {Pointer<Integer>}
     */
    rgdwCertReference {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Count of the elements in the <b>rgAttribute</b> array.
     * @type {Integer}
     */
    cAttribute {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Array of pointers to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> certificate attributes to be added.
     * @type {Pointer<CRYPT_ATTRIBUTE>}
     */
    rgAttribute {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

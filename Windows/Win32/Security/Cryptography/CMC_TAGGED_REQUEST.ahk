#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used in the CMC_DATA_INFO structures to request a certificate.
 * @remarks
 * Additional members of the union may be defined in future versions.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_tagged_request
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMC_TAGGED_REQUEST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * <b>DWORD</b> identifying the union member to be used. CMC_TAGGED_CERT_REQUEST_CHOICE can be used to select the CMC_TAGGED_CERT_REQUEST.
     * @type {Integer}
     */
    dwTaggedRequestChoice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<TypeHandle>}
     */
    Anonymous {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A certificate template.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_template_ext
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_TEMPLATE_EXT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * <b>LPSTR</b> object identifier (OID).
     * @type {Pointer<PSTR>}
     */
    pszObjId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * <b>DWORD</b> indicating the major version of the template.
     * @type {Integer}
     */
    dwMajorVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * <b>BOOL</b> flag set to <b>TRUE</b> if there is a minor version number.
     * @type {Integer}
     */
    fMinorVersion {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * <b>DWORD</b> indicating the minor version of the template.
     * @type {Integer}
     */
    dwMinorVersion {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}

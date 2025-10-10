#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a list of certificate revocation list (CRL) distribution points a certificate user can reference to determine whether the certificate has been revoked.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crl_dist_points_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRL_DIST_POINTS_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of elements in the <b>rgDistPoint</b> member array.
     * @type {Integer}
     */
    cDistPoint {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crl_dist_point">CRL_DIST_POINT</a> structures.
     * @type {Pointer<CRL_DIST_POINT>}
     */
    rgDistPoint {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

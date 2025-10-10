#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information used to update dynamic cross certificates.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cross_cert_dist_points_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CROSS_CERT_DIST_POINTS_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * <b>DWORD</b> indicating seconds between synchronization. If this member is zero, the client default synchronization time is used.
     * @type {Integer}
     */
    dwSyncDeltaTime {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Count of the number of elements in the <b>rgDistPoint</b> member array.
     * @type {Integer}
     */
    cDistPoint {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_info">CERT_ALT_NAME_INFO</a> structures for distribution points for updating cross certificates.
     * @type {Pointer<CERT_ALT_NAME_INFO>}
     */
    rgDistPoint {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

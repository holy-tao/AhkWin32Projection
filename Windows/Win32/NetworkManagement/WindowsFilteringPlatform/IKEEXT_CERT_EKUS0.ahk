#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the extended key usage (EKU) properties of a certificate.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_cert_ekus0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CERT_EKUS0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     *  The number of EKUs in the <b>eku</b> member.
     * @type {Integer}
     */
    numEku {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPSTR*</b>
     * 
     * The list of EKU object identifiers (OIDs).
     * @type {Pointer<Byte>}
     */
    eku {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

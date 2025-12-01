#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the certificate information.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_certificate_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_CERTIFICATE_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The size, in bytes, of the <b>KERB_CERTIFICATE_INFO</b> structure including the marshaled payload which is a structure of type specified in the <i>InfoType</i> parameter and immediately follows the <b>KERB_CERTIFICATE_INFO</b> structure in contiguous memory.
     * @type {Integer}
     */
    CertInfoSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_certificate_info_type">KERB_CERTIFICATE_INFO_TYPE</a> 	enumeration that specifies the type of certificate information that is provided.
     * @type {Integer}
     */
    InfoType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

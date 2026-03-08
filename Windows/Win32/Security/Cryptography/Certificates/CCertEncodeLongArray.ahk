#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Decodes an Abstract Syntax Notation One (ASN.1)-encoded Long array and stores the resulting array of Long values in the CertEncodeLongArray object.
 * @remarks
 * This method places the decoded contents of <i>strBinary</i> into the object's array of <b>Long</b> values. If the object's array already contains <b>Long</b> values, the existing content will be freed, and the array will be loaded with the decoded values.
 * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodelongarray-decode
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CCertEncodeLongArray extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

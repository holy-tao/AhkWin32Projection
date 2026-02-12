#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Decodes an Abstract Syntax Notation One (ASN.1)-encoded string array and stores the resulting array of strings in the CertEncodeStringArray object.
 * @remarks
 * This method will place the decoded contents of <i>strBinary</i> into the object's array of strings. If the object's array already contains strings, this existing content will be freed, and the array will be loaded with the decoded values.
 * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodestringarray-decode
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CCertEncodeStringArray extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

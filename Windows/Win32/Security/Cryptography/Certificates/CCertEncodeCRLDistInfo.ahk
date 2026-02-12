#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Decodes an Abstract Syntax Notation One (ASN.1)-encoded certificate revocation list (CRL) distribution information extension and stores the resulting array in the COM object.
 * @remarks
 * This method places the decoded contents of <i>strBinary</i> into the object's array of CRL distribution information points. If the object's array already contains data, this existing content will be freed, and the array will be loaded with the decoded values.
 * @see https://learn.microsoft.com/windows/win32/api//content/certenc/nf-certenc-icertencodecrldistinfo-decode
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CCertEncodeCRLDistInfo extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

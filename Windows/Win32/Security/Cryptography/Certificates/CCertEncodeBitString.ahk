#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Decodes an Abstract Syntax Notation One (ASN.1)-encoded bit string and stores the resulting bit string in this object.
 * @remarks
 * Use this method to decode an encoded bit string.
 * @see https://learn.microsoft.com/windows/win32/api/certenc/nf-certenc-icertencodebitstring-decode
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CCertEncodeBitString extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

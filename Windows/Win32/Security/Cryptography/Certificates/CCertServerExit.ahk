#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Returns the name of the next request attribute within the current context, then increments the internal pointer to the following attribute.
 * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverexit-enumerateattributes
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CCertServerExit extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

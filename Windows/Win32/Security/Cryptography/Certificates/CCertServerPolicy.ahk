#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Retrieves the name of the current attribute and moves the internal enumeration pointer to the next attribute.
 * @remarks
 * Before calling the <b>EnumerateAttributes</b>  method for the first time, call 
 * the <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-enumerateattributessetup">EnumerateAttributesSetup</a> method to initialize the enumeration pointer to the first attribute.
 * 
 *  When done enumerating, call  
 * the <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-enumerateattributesclose">EnumerateAttributesClose</a> method to free resources used by the enumeration calls.
 * @see https://learn.microsoft.com/windows/win32/api/certif/nf-certif-icertserverpolicy-enumerateattributes
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CCertServerPolicy extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

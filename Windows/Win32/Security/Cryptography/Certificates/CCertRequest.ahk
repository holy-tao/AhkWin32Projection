#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Returns the certification authority (CA) certificate for the Certificate Services server.
 * @remarks
 * Administration tasks use DCOM. Code that calls this interface method as defined in an earlier version of Certadm.h will run on Windows-based servers as long as the client and the server are both running the same Windows operating system.
 * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertrequest-getcacertificate
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CCertRequest extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}

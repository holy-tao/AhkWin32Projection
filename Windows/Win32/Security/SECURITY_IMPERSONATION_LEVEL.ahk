#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values that specify security impersonation levels. Security impersonation levels govern the degree to which a server process can act on behalf of a client process.
 * @remarks
 * 
 * Impersonation is the ability of a process to take on the security attributes of another process.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-security_impersonation_level
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SECURITY_IMPERSONATION_LEVEL extends Win32Enum{

    /**
     * The server process cannot obtain identification information about the client, and it cannot impersonate the client. It is defined with no value given, and thus, by ANSI C rules, defaults to a value of zero.
     * @type {Integer (Int32)}
     */
    static SecurityAnonymous => 0

    /**
     * The server process can obtain information about the client, such as security identifiers and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privileges</a>, but it cannot impersonate the client. This is useful for servers that export their own objects, for example, database products that export tables and views. Using the retrieved client-security information, the server can make access-validation decisions without being able to use other services that are using the client's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>.
     * @type {Integer (Int32)}
     */
    static SecurityIdentification => 1

    /**
     * The server process can impersonate the client's security context on its local system. The server cannot impersonate the client on remote systems.
     * @type {Integer (Int32)}
     */
    static SecurityImpersonation => 2

    /**
     * The server process can impersonate the client's security context on remote systems.
     * @type {Integer (Int32)}
     */
    static SecurityDelegation => 3
}

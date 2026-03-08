#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Database operations are performed within the domain of the system. The calling application must have appropriate access permissions for any database actions.
 * @see https://learn.microsoft.com/windows/win32/api/winscard/nf-winscard-scardestablishcontext
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class SCARD_SCOPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_SCOPE_USER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_SCOPE_SYSTEM => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_w
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class SEC_WINNT_AUTH_IDENTITY extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_ANSI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_UNICODE => 2
}

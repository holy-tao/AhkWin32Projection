#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * If this flag is set, domain controller accounts can be used for authentication; otherwise, only user accounts can be used.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-msv1_0_subauth_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0 extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_PASSTHRU => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MSV1_0_GUEST_LOGON => 2
}

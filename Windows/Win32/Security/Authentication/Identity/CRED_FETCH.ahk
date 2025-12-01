#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines values that determine how to fetch the credential of a Group Managed Service Account (gMSA).
 * @see https://learn.microsoft.com/windows/win32/SecMgmt/cred-fetch
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class CRED_FETCH extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CredFetchDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static CredFetchDPAPI => 1

    /**
     * @type {Integer (Int32)}
     */
    static CredFetchForced => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines values that determine how to fetch the credential of a Group Managed Service Account (gMSA).
 * @see https://learn.microsoft.com/windows/win32/SecMgmt/cred-fetch
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class CRED_FETCH extends Win32Enum {

    /**
     * Native name: CredFetchDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: CredFetchDPAPI
     * @type {Integer (Int32)}
     */
    static FetchDPAPI => 1

    /**
     * Native name: CredFetchForced
     * @type {Integer (Int32)}
     */
    static Forced => 2
}

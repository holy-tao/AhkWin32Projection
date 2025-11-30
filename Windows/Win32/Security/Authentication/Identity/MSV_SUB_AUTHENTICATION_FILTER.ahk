#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV_SUB_AUTHENTICATION_FILTER extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_GUEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_NOENCRYPTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_CACHED_ACCOUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_USED_LM_PASSWORD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_EXTRA_SIDS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_SUBAUTH_SESSION_KEY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_SERVER_TRUST_ACCOUNT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_PROFILE_PATH_RETURNED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_RESOURCE_GROUPS => 512
}

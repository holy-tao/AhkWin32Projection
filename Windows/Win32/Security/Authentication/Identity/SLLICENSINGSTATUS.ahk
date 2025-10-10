#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the licensing status.
 * @see https://docs.microsoft.com/windows/win32/api//slpublic/ne-slpublic-sllicensingstatus
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SLLICENSINGSTATUS{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SL_LICENSING_STATUS_UNLICENSED => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SL_LICENSING_STATUS_LICENSED => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SL_LICENSING_STATUS_IN_GRACE_PERIOD => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SL_LICENSING_STATUS_NOTIFICATION => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SL_LICENSING_STATUS_LAST => 4
}

#Requires AutoHotkey v2.0.0 64-bit

/**
 * The different possible values for MS_ATTRIBUTE_IDENTITY_TYPE.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-identity_type
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class IDENTITY_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITIES_ALL => 0

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITIES_ME_ONLY => 1
}

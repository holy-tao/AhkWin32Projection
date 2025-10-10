#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the type of offline activation for a license.
 * @see https://docs.microsoft.com/windows/win32/api//slpublic/ne-slpublic-sl_activation_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SL_ACTIVATION_TYPE{

    /**
     * Retail phone activation.
     * @type {Integer (Int32)}
     */
    static SL_ACTIVATION_TYPE_DEFAULT => 0

    /**
     * The product activation is through Active Directory.
     * @type {Integer (Int32)}
     */
    static SL_ACTIVATION_TYPE_ACTIVE_DIRECTORY => 1
}

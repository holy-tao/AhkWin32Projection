#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Represents the type of offline activation for a license.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/ne-slpublic-sl_activation_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SL_ACTIVATION_TYPE extends Win32Enum {

    /**
     * Retail phone activation.
     * Native name: SL_ACTIVATION_TYPE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * The product activation is through Active Directory.
     * Native name: SL_ACTIVATION_TYPE_ACTIVE_DIRECTORY
     * @type {Integer (Int32)}
     */
    static ACTIVE_DIRECTORY => 1
}

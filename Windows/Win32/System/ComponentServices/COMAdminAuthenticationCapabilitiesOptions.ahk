#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class COMAdminAuthenticationCapabilitiesOptions extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationCapabilitiesNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationCapabilitiesSecureReference => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationCapabilitiesStaticCloaking => 32

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationCapabilitiesDynamicCloaking => 64
}

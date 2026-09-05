#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminAuthenticationCapabilitiesOptions extends Win32Enum {

    /**
     * Native name: COMAdminAuthenticationCapabilitiesNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: COMAdminAuthenticationCapabilitiesSecureReference
     * @type {Integer (Int32)}
     */
    static SecureReference => 2

    /**
     * Native name: COMAdminAuthenticationCapabilitiesStaticCloaking
     * @type {Integer (Int32)}
     */
    static StaticCloaking => 32

    /**
     * Native name: COMAdminAuthenticationCapabilitiesDynamicCloaking
     * @type {Integer (Int32)}
     */
    static DynamicCloaking => 64
}

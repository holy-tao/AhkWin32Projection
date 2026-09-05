#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ACTCTX_COMPATIBILITY_ELEMENT_TYPE enumeration describes the compatibility element in the application manifest.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-actctx_compatibility_element_type
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class ACTCTX_COMPATIBILITY_ELEMENT_TYPE extends Win32Enum {

    /**
     * Native name: ACTCTX_COMPATIBILITY_ELEMENT_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: ACTCTX_COMPATIBILITY_ELEMENT_TYPE_OS
     * @type {Integer (Int32)}
     */
    static OS => 1

    /**
     * Native name: ACTCTX_COMPATIBILITY_ELEMENT_TYPE_MITIGATION
     * @type {Integer (Int32)}
     */
    static MITIGATION => 2

    /**
     * Native name: ACTCTX_COMPATIBILITY_ELEMENT_TYPE_MAXVERSIONTESTED
     * @type {Integer (Int32)}
     */
    static MAXVERSIONTESTED => 3
}

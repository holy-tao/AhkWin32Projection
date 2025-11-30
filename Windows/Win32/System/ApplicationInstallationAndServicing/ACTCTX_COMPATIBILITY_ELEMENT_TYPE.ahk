#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ACTCTX_COMPATIBILITY_ELEMENT_TYPE enumeration describes the compatibility element in the application manifest.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-actctx_compatibility_element_type
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class ACTCTX_COMPATIBILITY_ELEMENT_TYPE extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACTCTX_COMPATIBILITY_ELEMENT_TYPE_UNKNOWN => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACTCTX_COMPATIBILITY_ELEMENT_TYPE_OS => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACTCTX_COMPATIBILITY_ELEMENT_TYPE_MITIGATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static ACTCTX_COMPATIBILITY_ELEMENT_TYPE_MAXVERSIONTESTED => 3
}

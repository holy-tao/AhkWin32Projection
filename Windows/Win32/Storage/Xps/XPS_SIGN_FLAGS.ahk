#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether markup compatibility detection must be run before signing.
 * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/ne-xpsdigitalsignature-xps_sign_flags
 * @namespace Windows.Win32.Storage.Xps
 */
class XPS_SIGN_FLAGS extends Win32BitflagEnum {

    /**
     * The system will check for any markup compatibility elements before 
     * signing the package. If any markup compatibility elements are found, the signing operation 
     * fails with an <b>XPS_E_MARKUP_COMPATIBILITY_ELEMENTS</b> error.
     * Native name: XPS_SIGN_FLAGS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The system will not check for any markup compatibility elements before 
     * signing the package.
     * Native name: XPS_SIGN_FLAGS_IGNORE_MARKUP_COMPATIBILITY
     * @type {Integer (Int32)}
     */
    static IGNORE_MARKUP_COMPATIBILITY => 1
}

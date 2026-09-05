#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides a set of values that indicate the base key that will be used for an enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-shregenum_flags
 * @namespace Windows.Win32.UI.Shell
 */
class SHREGENUM_FLAGS extends Win32Enum {

    /**
     * Enumerates under <b>HKEY_CURRENT_USER</b>, or, if the specified item is not found in <b>HKEY_CURRENT_USER</b>, enumerates under <b>HKEY_LOCAL_MACHINE</b>.
     * Native name: SHREGENUM_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Enumerates under <b>HKEY_CURRENT_USER</b> only.
     * Native name: SHREGENUM_HKCU
     * @type {Integer (Int32)}
     */
    static HKCU => 1

    /**
     * Enumerates under <b>HKEY_LOCAL_MACHINE</b> only.
     * Native name: SHREGENUM_HKLM
     * @type {Integer (Int32)}
     */
    static HKLM => 16

    /**
     * Not used.
     * Native name: SHREGENUM_BOTH
     * @type {Integer (Int32)}
     */
    static BOTH => 17
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides a set of values that indicate the base key that will be used for an enumeration.
 * @see https://docs.microsoft.com/windows/win32/api//shlwapi/ne-shlwapi-shregenum_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHREGENUM_FLAGS extends Win32Enum{

    /**
     * Enumerates under <b>HKEY_CURRENT_USER</b>, or, if the specified item is not found in <b>HKEY_CURRENT_USER</b>, enumerates under <b>HKEY_LOCAL_MACHINE</b>.
     * @type {Integer (Int32)}
     */
    static SHREGENUM_DEFAULT => 0

    /**
     * Enumerates under <b>HKEY_CURRENT_USER</b> only.
     * @type {Integer (Int32)}
     */
    static SHREGENUM_HKCU => 1

    /**
     * Enumerates under <b>HKEY_LOCAL_MACHINE</b> only.
     * @type {Integer (Int32)}
     */
    static SHREGENUM_HKLM => 16

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static SHREGENUM_BOTH => 17
}

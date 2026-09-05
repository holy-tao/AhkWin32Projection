#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides a set of values that indicate from which base key an item will be deleted.
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-shregdel_flags
 * @namespace Windows.Win32.UI.Shell
 */
class SHREGDEL_FLAGS extends Win32Enum {

    /**
     * Deletes from <b>HKEY_CURRENT_USER</b>. If the specified item is not found under <b>HKEY_CURRENT_USER</b>, deletes from <b>HKEY_LOCAL_MACHINE</b>.
     * Native name: SHREGDEL_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Enumerates from <b>HKEY_CURRENT_USER</b> only.
     * Native name: SHREGDEL_HKCU
     * @type {Integer (Int32)}
     */
    static HKCU => 1

    /**
     * Enumerates under <b>HKEY_LOCAL_MACHINE</b> only.
     * Native name: SHREGDEL_HKLM
     * @type {Integer (Int32)}
     */
    static HKLM => 16

    /**
     * Deletes from both <b>HKEY_CURRENT_USER</b> and <b>HKEY_LOCAL_MACHINE</b>.
     * Native name: SHREGDEL_BOTH
     * @type {Integer (Int32)}
     */
    static BOTH => 17
}

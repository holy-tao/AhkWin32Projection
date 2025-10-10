#Requires AutoHotkey v2.0.0 64-bit

/**
 * Provides a set of values that indicate from which base key an item will be deleted.
 * @see https://docs.microsoft.com/windows/win32/api//shlwapi/ne-shlwapi-shregdel_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHREGDEL_FLAGS{

    /**
     * Deletes from <b>HKEY_CURRENT_USER</b>. If the specified item is not found under <b>HKEY_CURRENT_USER</b>, deletes from <b>HKEY_LOCAL_MACHINE</b>.
     * @type {Integer (Int32)}
     */
    static SHREGDEL_DEFAULT => 0

    /**
     * Enumerates from <b>HKEY_CURRENT_USER</b> only.
     * @type {Integer (Int32)}
     */
    static SHREGDEL_HKCU => 1

    /**
     * Enumerates under <b>HKEY_LOCAL_MACHINE</b> only.
     * @type {Integer (Int32)}
     */
    static SHREGDEL_HKLM => 16

    /**
     * Deletes from both <b>HKEY_CURRENT_USER</b> and <b>HKEY_LOCAL_MACHINE</b>.
     * @type {Integer (Int32)}
     */
    static SHREGDEL_BOTH => 17
}

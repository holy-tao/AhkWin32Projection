#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides a set of values that indicate the base key that will be used for an enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-shregenum_flags
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHREGENUM_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

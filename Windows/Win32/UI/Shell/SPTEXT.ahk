#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of descriptive text being provided to an IActionProgress interface.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-sptext
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SPTEXT{

    /**
     * The text is a high level, short description.
     * @type {Integer (Int32)}
     */
    static SPTEXT_ACTIONDESCRIPTION => 1

    /**
     * The text is a detailed description.
     * @type {Integer (Int32)}
     */
    static SPTEXT_ACTIONDETAIL => 2
}

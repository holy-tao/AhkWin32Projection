#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of descriptive text being provided to an IActionProgress interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-sptext
 * @namespace Windows.Win32.UI.Shell
 */
class SPTEXT extends Win32Enum {

    /**
     * The text is a high level, short description.
     * Native name: SPTEXT_ACTIONDESCRIPTION
     * @type {Integer (Int32)}
     */
    static ACTIONDESCRIPTION => 1

    /**
     * The text is a detailed description.
     * Native name: SPTEXT_ACTIONDETAIL
     * @type {Integer (Int32)}
     */
    static ACTIONDETAIL => 2
}

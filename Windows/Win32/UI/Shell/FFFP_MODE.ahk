#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes match criteria. Used by methods of the IKnownFolderManager interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-fffp_mode
 * @namespace Windows.Win32.UI.Shell
 */
class FFFP_MODE extends Win32Enum {

    /**
     * Exact match.
     * Native name: FFFP_EXACTMATCH
     * @type {Integer (Int32)}
     */
    static EXACTMATCH => 0

    /**
     * Nearest parent match.
     * Native name: FFFP_NEARESTPARENTMATCH
     * @type {Integer (Int32)}
     */
    static NEARESTPARENTMATCH => 1
}

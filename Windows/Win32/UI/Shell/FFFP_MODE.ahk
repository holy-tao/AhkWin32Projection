#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes match criteria. Used by methods of the IKnownFolderManager interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-fffp_mode
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FFFP_MODE{

    /**
     * Exact match.
     * @type {Integer (Int32)}
     */
    static FFFP_EXACTMATCH => 0

    /**
     * Nearest parent match.
     * @type {Integer (Int32)}
     */
    static FFFP_NEARESTPARENTMATCH => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by IFolderViewSettings::GetViewMode and ISearchFolderItemFactory::SetFolderLogicalViewMode to describe the view mode.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-folderlogicalviewmode
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FOLDERLOGICALVIEWMODE extends Win32Enum{

    /**
     * The view is not specified.
     * @type {Integer (Int32)}
     */
    static FLVM_UNSPECIFIED => -1

    /**
     * The minimum valid enumeration value. Used for validation purposes only.
     * @type {Integer (Int32)}
     */
    static FLVM_FIRST => 1

    /**
     * Details view.
     * @type {Integer (Int32)}
     */
    static FLVM_DETAILS => 1

    /**
     * Tiles view.
     * @type {Integer (Int32)}
     */
    static FLVM_TILES => 2

    /**
     * Icons view.
     * @type {Integer (Int32)}
     */
    static FLVM_ICONS => 3

    /**
     * <b>Windows 7 and later</b>. List view.
     * @type {Integer (Int32)}
     */
    static FLVM_LIST => 4

    /**
     * <b>Windows 7 and later</b>. Content view.
     * @type {Integer (Int32)}
     */
    static FLVM_CONTENT => 5

    /**
     * The maximum valid enumeration value. Used for validation purposes only.
     * @type {Integer (Int32)}
     */
    static FLVM_LAST => 5
}

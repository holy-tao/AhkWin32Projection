#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the folder view type.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-folderviewmode
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FOLDERVIEWMODE extends Win32Enum{

    /**
     * The view should determine the best option.
     * @type {Integer (Int32)}
     */
    static FVM_AUTO => -1

    /**
     * The minimum constant value in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a>, for validation purposes.
     * @type {Integer (Int32)}
     */
    static FVM_FIRST => 1

    /**
     * The view should display medium-size icons.
     * @type {Integer (Int32)}
     */
    static FVM_ICON => 1

    /**
     * The view should display small icons.
     * @type {Integer (Int32)}
     */
    static FVM_SMALLICON => 2

    /**
     * Object names are displayed in a list view.
     * @type {Integer (Int32)}
     */
    static FVM_LIST => 3

    /**
     * Object names and other selected information, such as the size or date last updated, are shown.
     * @type {Integer (Int32)}
     */
    static FVM_DETAILS => 4

    /**
     * The view should display thumbnail icons.
     * @type {Integer (Int32)}
     */
    static FVM_THUMBNAIL => 5

    /**
     * The view should display large icons.
     * @type {Integer (Int32)}
     */
    static FVM_TILE => 6

    /**
     * The view should display icons in a filmstrip format.
     * @type {Integer (Int32)}
     */
    static FVM_THUMBSTRIP => 7

    /**
     * <b>Windows 7 and later</b>. The view should display content mode.
     * @type {Integer (Int32)}
     */
    static FVM_CONTENT => 8

    /**
     * The maximum constant value in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a>, for validation purposes.
     * @type {Integer (Int32)}
     */
    static FVM_LAST => 8
}

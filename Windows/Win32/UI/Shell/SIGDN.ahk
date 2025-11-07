#Requires AutoHotkey v2.0.0 64-bit

/**
 * Requests the form of an item's display name to retrieve through IShellItem::GetDisplayName and SHGetNameFromIDList.
 * @remarks
 * 
 * Different forms of an item's name can be retrieved through the item's properties, including those listed here. Note that not all properties are present on all items, so only those appropriate to the item will appear.
 *             
 *                 
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-filename">PKEY_FileName</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-itemfoldernamedisplay">PKEY_ItemFolderNameDisplay</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-itemfolderpathdisplay">PKEY_ItemFolderPathDisplay</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/properties/props-system-itemfolderpathdisplaynarrow">PKEY_ItemFolderPathDisplayNarrow</a>
 * </li>
 * </ul>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-sigdn
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SIGDN{

    /**
     * 0x00000000. Returns the display name relative to the parent folder. In UI this name is generally ideal for display to the user.
     * @type {Integer (Int32)}
     */
    static SIGDN_NORMALDISPLAY => 0

    /**
     * (int)0x80018001. Returns the parsing name relative to the parent folder. This name is not suitable for use in UI.
     * @type {Integer (Int32)}
     */
    static SIGDN_PARENTRELATIVEPARSING => -2147385343

    /**
     * (int)0x80028000. Returns the parsing name relative to the desktop. This name is not suitable for use in UI.
     * @type {Integer (Int32)}
     */
    static SIGDN_DESKTOPABSOLUTEPARSING => -2147319808

    /**
     * (int)0x80031001. Returns the editing name relative to the parent folder. In UI this name is suitable for display to the user.
     * @type {Integer (Int32)}
     */
    static SIGDN_PARENTRELATIVEEDITING => -2147282943

    /**
     * (int)0x8004c000. Returns the editing name relative to the desktop. In UI this name is suitable for display to the user.
     * @type {Integer (Int32)}
     */
    static SIGDN_DESKTOPABSOLUTEEDITING => -2147172352

    /**
     * (int)0x80058000. Returns the item's file system path, if it has one. Only items that report <a href="https://docs.microsoft.com/windows/desktop/shell/sfgao">SFGAO_FILESYSTEM</a> have a file system path. When an item does not have a file system path, a call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-getdisplayname">IShellItem::GetDisplayName</a> on that item will fail. In UI this name is suitable for display to the user in some cases, but note that it might not be specified for all items.
     * @type {Integer (Int32)}
     */
    static SIGDN_FILESYSPATH => -2147123200

    /**
     * (int)0x80068000. Returns the item's URL, if it has one. Some items do not have a URL, and in those cases a call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-getdisplayname">IShellItem::GetDisplayName</a> will fail. This name is suitable for display to the user in some cases, but note that it might not be specified for all items.
     * @type {Integer (Int32)}
     */
    static SIGDN_URL => -2147057664

    /**
     * (int)0x8007c001. Returns the path relative to the parent folder in a friendly format as displayed in an address bar. This name is suitable for display to the user.
     * @type {Integer (Int32)}
     */
    static SIGDN_PARENTRELATIVEFORADDRESSBAR => -2146975743

    /**
     * (int)0x80080001. Returns the path relative to the parent folder.
     * @type {Integer (Int32)}
     */
    static SIGDN_PARENTRELATIVE => -2146959359

    /**
     * (int)0x80094001. <b>Introduced in Windows 8</b>.
     * @type {Integer (Int32)}
     */
    static SIGDN_PARENTRELATIVEFORUI => -2146877439
}

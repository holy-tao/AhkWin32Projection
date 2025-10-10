#Requires AutoHotkey v2.0.0 64-bit

/**
 * A set of flags that specify folder view options. The flags are independent of each other and can be used in any combination.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-folderflags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FOLDERFLAGS{

    /**
     * 0x00000000. <b>Windows 7 and later</b>. No special view options.
     * @type {Integer (Int32)}
     */
    static FWF_NONE => 0

    /**
     * 0x00000001. Automatically arrange the elements in the view. This implies <a href="https://docs.microsoft.com/windows/desktop/Controls/list-view-window-styles">LVS_AUTOARRANGE</a> if the list-view control is used to implement the view.
     * @type {Integer (Int32)}
     */
    static FWF_AUTOARRANGE => 1

    /**
     * 0x00000002. Not supported.
     * @type {Integer (Int32)}
     */
    static FWF_ABBREVIATEDNAMES => 2

    /**
     * 0x00000004. Not supported.
     * @type {Integer (Int32)}
     */
    static FWF_SNAPTOGRID => 4

    /**
     * 0x00000008. Not supported.
     * @type {Integer (Int32)}
     */
    static FWF_OWNERDATA => 8

    /**
     * 0x00000010. Not supported.
     * @type {Integer (Int32)}
     */
    static FWF_BESTFITWINDOW => 16

    /**
     * 0x00000020. Make the folder behave like the desktop. This value applies only to the desktop and is not used for typical Shell folders. This flag implies <b>FWF_NOCLIENTEDGE</b> and <b>FWF_NOSCROLL</b>.
     * @type {Integer (Int32)}
     */
    static FWF_DESKTOP => 32

    /**
     * 0x00000040. Do not allow more than a single item to be selected. This is used in the common dialog boxes.
     * @type {Integer (Int32)}
     */
    static FWF_SINGLESEL => 64

    /**
     * 0x00000080. Do not show subfolders.
     * @type {Integer (Int32)}
     */
    static FWF_NOSUBFOLDERS => 128

    /**
     * 0x00000100. Draw transparently. This is used only for the desktop.
     * @type {Integer (Int32)}
     */
    static FWF_TRANSPARENT => 256

    /**
     * 0x00000200. Not supported.
     * @type {Integer (Int32)}
     */
    static FWF_NOCLIENTEDGE => 512

    /**
     * 0x00000400. Do not add scroll bars. This is used only for the desktop.
     * @type {Integer (Int32)}
     */
    static FWF_NOSCROLL => 1024

    /**
     * 0x00000800. The view should be left-aligned. This implies <a href="https://docs.microsoft.com/windows/desktop/Controls/list-view-window-styles">LVS_ALIGNLEFT</a> if the list-view control is used to implement the view.
     * @type {Integer (Int32)}
     */
    static FWF_ALIGNLEFT => 2048

    /**
     * 0x00001000. The view should not display icons.
     * @type {Integer (Int32)}
     */
    static FWF_NOICONS => 4096

    /**
     * 0x00002000. This flag is deprecated as of Windows XP and has no effect. Always show the selection.
     * @type {Integer (Int32)}
     */
    static FWF_SHOWSELALWAYS => 8192

    /**
     * 0x00004000. Not supported.
     * @type {Integer (Int32)}
     */
    static FWF_NOVISIBLE => 16384

    /**
     * 0x00008000. Not supported.
     * @type {Integer (Int32)}
     */
    static FWF_SINGLECLICKACTIVATE => 32768

    /**
     * 0x00010000. The view should not be shown as a web view.
     * @type {Integer (Int32)}
     */
    static FWF_NOWEBVIEW => 65536

    /**
     * 0x00020000. The view should not display file names.
     * @type {Integer (Int32)}
     */
    static FWF_HIDEFILENAMES => 131072

    /**
     * 0x00040000. Turns on the check mode for the view.
     * @type {Integer (Int32)}
     */
    static FWF_CHECKSELECT => 262144

    /**
     * 0x00080000. <b>Windows Vista and later</b>. Do not re-enumerate the view (or drop the current contents of the view) when the view is refreshed.
     * @type {Integer (Int32)}
     */
    static FWF_NOENUMREFRESH => 524288

    /**
     * 0x00100000. <b>Windows Vista and later</b>. Do not allow grouping in the view
     * @type {Integer (Int32)}
     */
    static FWF_NOGROUPING => 1048576

    /**
     * 0x00200000. <b>Windows Vista and later</b>. When an item is selected, the item and all its sub-items are highlighted.
     * @type {Integer (Int32)}
     */
    static FWF_FULLROWSELECT => 2097152

    /**
     * 0x00400000. <b>Windows Vista and later</b>. Do not display filters in the view.
     * @type {Integer (Int32)}
     */
    static FWF_NOFILTERS => 4194304

    /**
     * 0x00800000. <b>Windows Vista and later</b>. Do not display a column header in the view in any view mode.
     * @type {Integer (Int32)}
     */
    static FWF_NOCOLUMNHEADER => 8388608

    /**
     * 0x01000000. <b>Windows Vista and later</b>. Only show the column header in details view mode.
     * @type {Integer (Int32)}
     */
    static FWF_NOHEADERINALLVIEWS => 16777216

    /**
     * 0x02000000. <b>Windows Vista and later</b>. When the view is in "tile view mode" the layout of a single item should be extended to the width of the view.
     * @type {Integer (Int32)}
     */
    static FWF_EXTENDEDTILES => 33554432

    /**
     * 0x04000000. <b>Windows Vista and later</b>. Not supported.
     * @type {Integer (Int32)}
     */
    static FWF_TRICHECKSELECT => 67108864

    /**
     * 0x08000000. <b>Windows Vista and later</b>. Items can be selected using checkboxes.
     * @type {Integer (Int32)}
     */
    static FWF_AUTOCHECKSELECT => 134217728

    /**
     * 0x10000000. <b>Windows Vista and later</b>. The view should not save view state in the browser.
     * @type {Integer (Int32)}
     */
    static FWF_NOBROWSERVIEWSTATE => 268435456

    /**
     * 0x20000000. <b>Windows Vista and later</b>. The view should list the number of items displayed in each group.  To be used with <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifolderview2-setgroupsubsetcount">IFolderView2::SetGroupSubsetCount</a>.
     * @type {Integer (Int32)}
     */
    static FWF_SUBSETGROUPS => 536870912

    /**
     * 0x40000000. <b>Windows Vista and later</b>. Use the search folder for stacking and searching.
     * @type {Integer (Int32)}
     */
    static FWF_USESEARCHFOLDER => 1073741824

    /**
     * (int)0x80000000. <b>Windows Vista and later</b>. Ensure right-to-left reading layout in a right-to-left system. Without this flag, the view displays strings from left-to-right both on systems set to left-to-right and right-to-left reading layout, which ensures that file names display correctly.
     * @type {Integer (Int32)}
     */
    static FWF_ALLOWRTLREADING => -2147483648
}

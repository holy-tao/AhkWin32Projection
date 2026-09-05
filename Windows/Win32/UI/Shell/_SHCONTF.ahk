#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines the types of items included in an enumeration. These values are used with the IShellFolder::EnumObjects method.
 * @remarks
 * By setting the <b><b>SHCONTF_INIT_ON_FIRST_NEXT</b></b> flag, the calling application suggests that the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-enumobjects">IShellFolder::EnumObjects</a> method can expedite the enumeration process by returning an uninitialized enumeration object. Initialization can be deferred until the enumeration process starts. If initializing the enumeration object is a lengthy process, the method implementation should immediately return an uninitialized object. Defer initialization until the first time the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ienumidlist-next">IEnumIDList::Next</a> method is called. If initialization requires user input, the method implementation should use <i>hwnd</i> as the parent window for the user interface. For an explanation of what to do when <i>hwnd</i> is set to <b>NULL</b>, see the <b>IShellFolder::EnumObjects</b> reference.
 * 
 * <div class="alert"><b>Note</b>  The name of this enumeration was changed to <b>SHCONTF</b> in Windows Vista. Earlier, it was named <b>SHCONTF</b>. The name <b>SHCONTF</b> is still defined through a typedef statement, however, so it can continue to be used by legacy code.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf
 * @namespace Windows.Win32.UI.Shell
 */
class _SHCONTF extends Win32Enum {

    /**
     * 0x00010. <b>Windows 7 and later</b>. The calling application is checking for the existence of child items in the folder.
     * Native name: SHCONTF_CHECKING_FOR_CHILDREN
     * @type {Integer (Int32)}
     */
    static CHECKING_FOR_CHILDREN => 16

    /**
     * 0x00020. Include items that are folders in the enumeration.
     * Native name: SHCONTF_FOLDERS
     * @type {Integer (Int32)}
     */
    static FOLDERS => 32

    /**
     * 0x00040. Include items that are not folders in the enumeration.
     * Native name: SHCONTF_NONFOLDERS
     * @type {Integer (Int32)}
     */
    static NONFOLDERS => 64

    /**
     * 0x00080. Include hidden items in the enumeration. This does not include hidden system items. (To include hidden system items, use SHCONTF_INCLUDESUPERHIDDEN.)
     * Native name: SHCONTF_INCLUDEHIDDEN
     * @type {Integer (Int32)}
     */
    static INCLUDEHIDDEN => 128

    /**
     * 0x00100. No longer used; always assumed. <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-enumobjects">IShellFolder::EnumObjects</a> can return without validating the enumeration object. Validation can be postponed until the first call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ienumidlist-next">IEnumIDList::Next</a>. Use this flag when a user interface might be displayed prior to the first <b>IEnumIDList::Next</b> call. For a user interface to be presented, <i>hwnd</i> must be set to a valid window handle.
     * Native name: SHCONTF_INIT_ON_FIRST_NEXT
     * @type {Integer (Int32)}
     */
    static INIT_ON_FIRST_NEXT => 256

    /**
     * 0x00200. The calling application is looking for printer objects.
     * Native name: SHCONTF_NETPRINTERSRCH
     * @type {Integer (Int32)}
     */
    static NETPRINTERSRCH => 512

    /**
     * 0x00400. The calling application is looking for resources that can be shared.
     * Native name: SHCONTF_SHAREABLE
     * @type {Integer (Int32)}
     */
    static SHAREABLE => 1024

    /**
     * 0x00800. Include items with accessible storage and their ancestors, including hidden items.
     * Native name: SHCONTF_STORAGE
     * @type {Integer (Int32)}
     */
    static STORAGE => 2048

    /**
     * 0x01000. <b>Windows 7 and later</b>. Child folders should provide a navigation enumeration.
     * Native name: SHCONTF_NAVIGATION_ENUM
     * @type {Integer (Int32)}
     */
    static NAVIGATION_ENUM => 4096

    /**
     * 0x02000. <b>Windows Vista and later</b>. The calling application is looking for resources that can be enumerated quickly.
     * Native name: SHCONTF_FASTITEMS
     * @type {Integer (Int32)}
     */
    static FASTITEMS => 8192

    /**
     * 0x04000. <b>Windows Vista and later</b>. Enumerate items as a simple list even if the folder itself is not structured in that way.
     * Native name: SHCONTF_FLATLIST
     * @type {Integer (Int32)}
     */
    static FLATLIST => 16384

    /**
     * 0x08000. <b>Windows Vista and later</b>. The calling application is monitoring for change notifications. This means that the enumerator does not have to return all results. Items can be reported through change notifications.
     * Native name: SHCONTF_ENABLE_ASYNC
     * @type {Integer (Int32)}
     */
    static ENABLE_ASYNC => 32768

    /**
     * 0x10000. <b>Windows 7 and later</b>. Include hidden system items in the enumeration. This value does not include hidden non-system items. (To include hidden non-system items, use SHCONTF_INCLUDEHIDDEN.)
     * Native name: SHCONTF_INCLUDESUPERHIDDEN
     * @type {Integer (Int32)}
     */
    static INCLUDESUPERHIDDEN => 65536
}

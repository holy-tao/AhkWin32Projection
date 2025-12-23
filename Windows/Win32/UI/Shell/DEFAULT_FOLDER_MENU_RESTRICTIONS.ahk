#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * . (DEFAULT_FOLDER_MENU_RESTRICTIONS)
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-default_folder_menu_restrictions
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DEFAULT_FOLDER_MENU_RESTRICTIONS extends Win32BitflagEnum{

    /**
     * 0x0000. No restrictions.
     * @type {Integer (Int32)}
     */
    static DFMR_DEFAULT => 0

    /**
     * 0x0008. Don't use the handler for static verbs.
     * @type {Integer (Int32)}
     */
    static DFMR_NO_STATIC_VERBS => 8

    /**
     * 0x0010. Static verbs only. No dynamic **IContextMenu** verbs allowed.
     * @type {Integer (Int32)}
     */
    static DFMR_STATIC_VERBS_ONLY => 16

    /**
     * 0x0020. Don't add verbs for cut, copy, paste, link, delete, rename, or properties.
     * @type {Integer (Int32)}
     */
    static DFMR_NO_RESOURCE_VERBS => 32

    /**
     * 0x0040. Opt-in to load handler for partial cloud files. Only used for handlers that will not cause implicit hydration. Opt-in handlers must have the registry value "ContextMenuOptIn" under HKCR\CLSID\<handler clsid>
     * @type {Integer (Int32)}
     */
    static DFMR_OPTIN_HANDLERS_ONLY => 64

    /**
     * 0x0080. Only load resource verbs (cut, copy, paste, link, delete, rename, and properties) and folder verbs added by [IContextMenuCB](nn-shobjidl_core-icontextmenucb.md).
     * @type {Integer (Int32)}
     */
    static DFMR_RESOURCE_AND_FOLDER_VERBS_ONLY => 128

    /**
     * 0x0100. Use handlers with CLSID values that were added through [IDefaultFolderMenuInitialize::SetHandlerClsid](nf-shobjidl_core-idefaultfoldermenuinitialize-sethandlerclsid.md)
     * @type {Integer (Int32)}
     */
    static DFMR_USE_SPECIFIED_HANDLERS => 256

    /**
     * 0x0200. Only load handlers that support the specified verbs.
     * @type {Integer (Int32)}
     */
    static DFMR_USE_SPECIFIED_VERBS => 512

    /**
     * 0x0400. Ignore async verbs.
     * @type {Integer (Int32)}
     */
    static DFMR_NO_ASYNC_VERBS => 1024

    /**
     * 0x0800. Ignore verbs that are registered for the native CPU architecture.
     * @type {Integer (Int32)}
     */
    static DFMR_NO_NATIVECPU_VERBS => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DFMR_NO_NONWOW_VERBS => 4096
}

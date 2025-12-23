#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values used by the SHGetItemFromDataObject function to specify options concerning the processing of the source object.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-dataobj_get_item_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DATAOBJ_GET_ITEM_FLAGS extends Win32BitflagEnum{

    /**
     * 0x0000. No special options.
     * @type {Integer (Int32)}
     */
    static DOGIF_DEFAULT => 0

    /**
     * 0x0001. If the source object is a link, base the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> on the link's target rather than the link file itself.
     * @type {Integer (Int32)}
     */
    static DOGIF_TRAVERSE_LINK => 1

    /**
     * 0x0002. If the source data object does not contain data in the CFSTR_SHELLIDLIST format, which identifies the object through an IDList, do not revert to the <a href="https://docs.microsoft.com/windows/desktop/shell/clipboard">CF_HDROP</a> format, which uses a file path, as an alternative in the transfer.
     * @type {Integer (Int32)}
     */
    static DOGIF_NO_HDROP => 2

    /**
     * 0x0004. If the source data object does not contain data in the CFSTR_SHELLIDLIST format, which identifies the object through an IDList, do not revert to the <a href="https://docs.microsoft.com/windows/desktop/shell/clipboard">CFSTR_INETURL</a> clipboard format, which uses a URL, as an alternative in the transfer.
     * @type {Integer (Int32)}
     */
    static DOGIF_NO_URL => 4

    /**
     * 0x0008. If the source object is an array of items, use it only if the array contains just one item.
     * @type {Integer (Int32)}
     */
    static DOGIF_ONLY_IF_ONE => 8
}

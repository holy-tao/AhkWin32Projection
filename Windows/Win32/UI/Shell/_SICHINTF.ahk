#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used to determine how to compare two Shell items. IShellItem::Compare uses this enumerated type.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_sichintf
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _SICHINTF extends Win32Enum{

    /**
     * 0x00000000. This relates to the <i>iOrder</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-compare">IShellItem::Compare</a> interface and indicates that the comparison is based on the display in a folder view.
     * @type {Integer (Int32)}
     */
    static SICHINT_DISPLAY => 0

    /**
     * (int)0x80000000. Exact comparison of two instances of a Shell item.
     * @type {Integer (Int32)}
     */
    static SICHINT_ALLFIELDS => -2147483648

    /**
     * 0x10000000. This relates to the <i>iOrder</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-compare">IShellItem::Compare</a> interface and indicates that the comparison is based on a canonical name.
     * @type {Integer (Int32)}
     */
    static SICHINT_CANONICAL => 268435456

    /**
     * 0x20000000. <b>Windows 7 and later</b>. If the Shell items are not the same, test the file system paths.
     * @type {Integer (Int32)}
     */
    static SICHINT_TEST_FILESYSPATH_IF_NOT_EQUAL => 536870912
}

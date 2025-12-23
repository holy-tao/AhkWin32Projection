#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * EXPCMDSTATE values represent the command state of a Shell item.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_expcmdstate
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _EXPCMDSTATE extends Win32BitflagEnum{

    /**
     * The item is enabled.
     * @type {Integer (Int32)}
     */
    static ECS_ENABLED => 0

    /**
     * The item is unavailable. It might be displayed to the user as a dimmed, inaccessible item.
     * @type {Integer (Int32)}
     */
    static ECS_DISABLED => 1

    /**
     * The item is hidden.
     * @type {Integer (Int32)}
     */
    static ECS_HIDDEN => 2

    /**
     * The item is displayed with a check box and that check box is not checked.
     * @type {Integer (Int32)}
     */
    static ECS_CHECKBOX => 4

    /**
     * The item is displayed with a check box and that check box is checked. <b>ECS_CHECKED</b> is always returned with ECS_CHECKBOX.
     * @type {Integer (Int32)}
     */
    static ECS_CHECKED => 8

    /**
     * <b>Windows 7 and later</b>. The item is one of a group of mutually exclusive options selected through a radio button. ECS_RADIOCHECK does not imply that the item is the selected option, though it might be.
     * @type {Integer (Int32)}
     */
    static ECS_RADIOCHECK => 16
}

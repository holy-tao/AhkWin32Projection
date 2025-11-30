#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_expcmdstate
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _EXPCMDSTATE extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static ECS_ENABLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static ECS_DISABLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static ECS_HIDDEN => 2

    /**
     * @type {Integer (Int32)}
     */
    static ECS_CHECKBOX => 4

    /**
     * @type {Integer (Int32)}
     */
    static ECS_CHECKED => 8

    /**
     * @type {Integer (Int32)}
     */
    static ECS_RADIOCHECK => 16
}

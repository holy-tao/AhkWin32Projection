#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the kind of system group used by an app's jump list.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplistsystemgroupkind
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class JumpListSystemGroupKind extends Win32Enum{

    /**
     * Specifies that no system managed group be used in the jump list.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Specifies that the system managed frequent group be used in the jump list.
     * @type {Integer (Int32)}
     */
    static Frequent => 1

    /**
     * Specifies that the system managed recent group be used in the jump list.
     * @type {Integer (Int32)}
     */
    static Recent => 2
}

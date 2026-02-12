#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the set of built-in [RadialController](radialcontroller.md) tools available on the [RadialControllerMenu](radialcontrollermenu.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollersystemmenuitemkind
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class RadialControllerSystemMenuItemKind extends Win32Enum{

    /**
     * Scroll command.
     * @type {Integer (Int32)}
     */
    static Scroll => 0

    /**
     * Zoom command.
     * @type {Integer (Int32)}
     */
    static Zoom => 1

    /**
     * Undo and Redo commands.
     * @type {Integer (Int32)}
     */
    static UndoRedo => 2

    /**
     * System volume command.
     * @type {Integer (Int32)}
     */
    static Volume => 3

    /**
     * Next and Previous track selection media commands.
     * @type {Integer (Int32)}
     */
    static NextPreviousTrack => 4
}

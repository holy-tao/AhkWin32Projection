#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the size of tile to pin. Used by some secondary tile constructors.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.tilesize
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class TileSize extends Win32Enum{

    /**
     * Use the default size of the app tile.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The small image size used in search results, the Apps list, and in some other parts of the UI.
     * @type {Integer (Int32)}
     */
    static Square30x30 => 1

    /**
     * The small tile used on the Start screen.
     * @type {Integer (Int32)}
     */
    static Square70x70 => 2

    /**
     * The medium tile.
     * @type {Integer (Int32)}
     */
    static Square150x150 => 3

    /**
     * The wide tile.
     * @type {Integer (Int32)}
     */
    static Wide310x150 => 4

    /**
     * The large tile.
     * @type {Integer (Int32)}
     */
    static Square310x310 => 5

    /**
     * ** only**: The small tile used on the Start screen. Note that you cannot specify the size of a pinned secondary tile on Windows Phone 8.1, so this value currently has no use.
     * @type {Integer (Int32)}
     */
    static Square71x71 => 6

    /**
     * The small image size used in search results, the Apps list, and in some other parts of the UI.
     * @type {Integer (Int32)}
     */
    static Square44x44 => 7
}

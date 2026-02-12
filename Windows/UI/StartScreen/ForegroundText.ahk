#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the color of the tile's foreground text.
  * 
  * > [!NOTE]
  * > This value is ignored on Windows Phone 8.1.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.foregroundtext
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class ForegroundText extends Win32Enum{

    /**
     * A Windows-specified default dark text color.
     * @type {Integer (Int32)}
     */
    static Dark => 0

    /**
     * A Windows-specified default light text color.
     * @type {Integer (Int32)}
     */
    static Light => 1
}

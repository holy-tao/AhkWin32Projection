#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the sound played by the [ElementSoundPlayer.Play](elementsoundplayer_play_1940496813.md) method.
 * @remarks
 * For more info, see [Sound in UWP apps](/windows/uwp/style/sound).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementsoundkind
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ElementSoundKind extends Win32Enum{

    /**
     * The sound to play when an element gets focus.
     * @type {Integer (Int32)}
     */
    static Focus => 0

    /**
     * The sound to play when an element is invoked.
     * @type {Integer (Int32)}
     */
    static Invoke => 1

    /**
     * The sound to play when a flyout, dialog, or command bar is opened.
     * @type {Integer (Int32)}
     */
    static Show => 2

    /**
     * The sound to play when a flyout, dialog, or command bar is closed.
     * @type {Integer (Int32)}
     */
    static Hide => 3

    /**
     * The sound to play when a user navigates to the previous panel or view within a page.
     * @type {Integer (Int32)}
     */
    static MovePrevious => 4

    /**
     * The sound to play when a user navigates to the next panel or view within a page.
     * @type {Integer (Int32)}
     */
    static MoveNext => 5

    /**
     * The sound to play when a user navigates back.
     * @type {Integer (Int32)}
     */
    static GoBack => 6
}

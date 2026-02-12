#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether XAML controls play sounds.
 * @remarks
 * This enumeration is used by the [ElementSoundPlayer.State](elementsoundplayer_state.md) property.
 * 
 * For more info, see [Sound in UWP apps](/windows/uwp/style/sound).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementsoundplayerstate
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ElementSoundPlayerState extends Win32Enum{

    /**
     * The platform determines whether or not sounds are played.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Sounds are never played on any platform.
     * @type {Integer (Int32)}
     */
    static Off => 1

    /**
     * Sounds are played on all platforms.
     * @type {Integer (Int32)}
     */
    static On => 2
}

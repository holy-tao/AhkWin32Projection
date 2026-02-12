#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the component animations that make up a connected animation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.connectedanimationcomponent
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ConnectedAnimationComponent extends Win32Enum{

    /**
     * The X component of the translation animation.
     * @type {Integer (Int32)}
     */
    static OffsetX => 0

    /**
     * The Y component of the translation animation.
     * @type {Integer (Int32)}
     */
    static OffsetY => 1

    /**
     * The crossfade animation.
     * @type {Integer (Int32)}
     */
    static CrossFade => 2

    /**
     * The scale animation.
     * @type {Integer (Int32)}
     */
    static Scale => 3
}

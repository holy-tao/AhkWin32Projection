#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the direction in which an animation translates from start to end.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.animationdirection
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class AnimationDirection extends Win32Enum{

    /**
     * The animation or transition progresses in a left direction.
     * @type {Integer (Int32)}
     */
    static Left => 0

    /**
     * The animation or transition progresses in an up direction.
     * @type {Integer (Int32)}
     */
    static Top => 1

    /**
     * The animation or transition progresses in a right direction.
     * @type {Integer (Int32)}
     */
    static Right => 2

    /**
     * The animation or transition progresses in a down direction.
     * @type {Integer (Int32)}
     */
    static Bottom => 3
}

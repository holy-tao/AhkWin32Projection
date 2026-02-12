#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the play direction of an animation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationdirection
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class AnimationDirection extends Win32Enum{

    /**
     * Play the animation from start to end.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Play the animation in reverse from end to start.
     * @type {Integer (Int32)}
     */
    static Reverse => 1

    /**
     * Alternate between normal and reverse playback.
     * @type {Integer (Int32)}
     */
    static Alternate => 2

    /**
     * Alternate between reverse and normal playback.
     * @type {Integer (Int32)}
     */
    static AlternateReverse => 3
}

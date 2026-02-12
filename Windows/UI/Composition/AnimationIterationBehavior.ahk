#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies if the animation should loop.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationiterationbehavior
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class AnimationIterationBehavior extends Win32Enum{

    /**
     * The animation should loop the specified number of times.
     * @type {Integer (Int32)}
     */
    static Count => 0

    /**
     * The animation should loop forever.
     * @type {Integer (Int32)}
     */
    static Forever => 1
}

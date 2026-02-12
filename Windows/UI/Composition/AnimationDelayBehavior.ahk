#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the animation delay behavior.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationdelaybehavior
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class AnimationDelayBehavior extends Win32Enum{

    /**
     * Does not compute anything in animation nor holds the value of composition object property. If a DelayTime is specified, it delays starting the animation according to delay time and after delay has expired it applies animation to the object property.
     * @type {Integer (Int32)}
     */
    static SetInitialValueAfterDelay => 0

    /**
     * Applies the initial value of the animation (i.e. the value at Keyframe 0) to the object before the delay time is elapsed (when there is a DelayTime specified), it then delays starting the animation according to the DelayTime.
     * @type {Integer (Int32)}
     */
    static SetInitialValueBeforeDelay => 1
}

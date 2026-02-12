#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how the [AnimationController.Progress](animationcontroller_progress.md) value is determined.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationcontrollerprogressbehavior
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class AnimationControllerProgressBehavior extends Win32Enum{

    /**
     * The progress value does not include delay time.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The progress value includes delay time.
     * @type {Integer (Int32)}
     */
    static IncludesDelayTime => 1
}

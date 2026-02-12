#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the reason why the [VideoStabilizationEffect.Enabled](videostabilizationeffect_enabled.md) property changed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostabilizationeffectenabledchangedreason
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class VideoStabilizationEffectEnabledChangedReason extends Win32Enum{

    /**
     * The value was changed programmatically from app code.
     * @type {Integer (Int32)}
     */
    static Programmatic => 0

    /**
     * The pixel rate of the video stream was too high.
     * @type {Integer (Int32)}
     */
    static PixelRateTooHigh => 1

    /**
     * The video stabilization effect was running slowly.
     * @type {Integer (Int32)}
     */
    static RunningSlowly => 2
}

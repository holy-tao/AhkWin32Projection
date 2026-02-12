#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies whether a Present call should wait for the frame to finish or returns control to the thread immediately.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframepresentwaitbehavior
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicFramePresentWaitBehavior extends Win32Enum{

    /**
     * Wait for the time to start head pose dependent rendering for the next frame.  This method must only be called after [PresentUsingCurrentPrediction](holographicframe_presentusingcurrentprediction_1384220218.md) has already been called on this frame.
     * @type {Integer (Int32)}
     */
    static WaitForFrameToFinish => 0

    /**
     * Return control to the thread immediately.
     * @type {Integer (Int32)}
     */
    static DoNotWaitForFrameToFinish => 1
}

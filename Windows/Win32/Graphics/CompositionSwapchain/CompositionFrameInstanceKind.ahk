#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that indicate how the content was used in a composition frame.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentation/ne-presentation-compositionframeinstancekind
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class CompositionFrameInstanceKind extends Win32Enum{

    /**
     * Content was composed directly to the Desktop Window Manager (DWM) backbuffer.
     * @type {Integer (Int32)}
     */
    static CompositionFrameInstanceKind_ComposedOnScreen => 0

    /**
     * Content was directly scanned out in an MPO plane.
     * @type {Integer (Int32)}
     */
    static CompositionFrameInstanceKind_ScanoutOnScreen => 1

    /**
     * Content was composed to an intermediate.
     * @type {Integer (Int32)}
     */
    static CompositionFrameInstanceKind_ComposedToIntermediate => 2
}

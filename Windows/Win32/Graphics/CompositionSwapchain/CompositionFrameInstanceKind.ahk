#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that indicate how the content was used in a composition frame.
 * @see https://learn.microsoft.com/windows/win32/api/presentation/ne-presentation-compositionframeinstancekind
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
class CompositionFrameInstanceKind extends Win32Enum {

    /**
     * Content was composed directly to the Desktop Window Manager (DWM) backbuffer.
     * Native name: CompositionFrameInstanceKind_ComposedOnScreen
     * @type {Integer (Int32)}
     */
    static ComposedOnScreen => 0

    /**
     * Content was directly scanned out in an MPO plane.
     * Native name: CompositionFrameInstanceKind_ScanoutOnScreen
     * @type {Integer (Int32)}
     */
    static ScanoutOnScreen => 1

    /**
     * Content was composed to an intermediate.
     * Native name: CompositionFrameInstanceKind_ComposedToIntermediate
     * @type {Integer (Int32)}
     */
    static ComposedToIntermediate => 2
}

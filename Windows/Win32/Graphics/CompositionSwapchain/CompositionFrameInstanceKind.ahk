#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that indicate how the content was used in a composition frame.
 * @see https://learn.microsoft.com/windows/win32/api/presentation/ne-presentation-compositionframeinstancekind
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 */
export default struct CompositionFrameInstanceKind {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

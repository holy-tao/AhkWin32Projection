#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CROSS_SLIDE_THRESHOLD.ahk" { CROSS_SLIDE_THRESHOLD }

/**
 * Defines the cross-slide threshold and its distance threshold.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ns-interactioncontext-cross_slide_parameter
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct CROSS_SLIDE_PARAMETER {
    #StructPack 4

    /**
     * One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-cross_slide_threshold">CROSS_SLIDE_THRESHOLD</a>.
     */
    threshold : CROSS_SLIDE_THRESHOLD

    /**
     * The <i>threshold</i> distance, in DIPs.
     */
    distance : Float32

}

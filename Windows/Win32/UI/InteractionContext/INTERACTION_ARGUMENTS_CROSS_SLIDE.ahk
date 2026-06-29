#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CROSS_SLIDE_FLAGS.ahk" { CROSS_SLIDE_FLAGS }

/**
 * Defines the state of the cross-slide interaction.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ns-interactioncontext-interaction_arguments_cross_slide
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct INTERACTION_ARGUMENTS_CROSS_SLIDE {
    #StructPack 4

    /**
     * One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-cross_slide_flags">CROSS_SLIDE_FLAGS</a>.
     */
    flags : CROSS_SLIDE_FLAGS

}

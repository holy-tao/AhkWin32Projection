#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MANIPULATION_TRANSFORM.ahk" { MANIPULATION_TRANSFORM }
#Import ".\MANIPULATION_RAILS_STATE.ahk" { MANIPULATION_RAILS_STATE }
#Import ".\MANIPULATION_VELOCITY.ahk" { MANIPULATION_VELOCITY }

/**
 * Defines the state of a manipulation.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ns-interactioncontext-interaction_arguments_manipulation
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct INTERACTION_ARGUMENTS_MANIPULATION {
    #StructPack 4

    /**
     * The change in translation, rotation, and scale since the last <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/nc-interactioncontext-interaction_context_output_callback">INTERACTION_CONTEXT_OUTPUT_CALLBACK</a>.
     */
    delta : MANIPULATION_TRANSFORM

    /**
     * The accumulated change in translation, rotation, and scale since the interaction started.
     */
    cumulative : MANIPULATION_TRANSFORM

    /**
     * The velocities of the accumulated transformations for the interaction.
     */
    velocity : MANIPULATION_VELOCITY

    /**
     * One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-manipulation_rails_state">MANIPULATION_RAILS_STATE</a>.
     */
    railsState : MANIPULATION_RAILS_STATE

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERACTION_ID.ahk" { INTERACTION_ID }
#Import ".\INTERACTION_CONFIGURATION_FLAGS.ahk" { INTERACTION_CONFIGURATION_FLAGS }

/**
 * Defines the configuration of an Interaction Context object that enables, disables, or modifies the behavior of an interaction.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ns-interactioncontext-interaction_context_configuration
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct INTERACTION_CONTEXT_CONFIGURATION {
    #StructPack 4

    /**
     * One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-interaction_id">INTERACTION_ID</a>.
     * 
     * <div class="alert"><b>Note</b>  INTERACTION_FLAG_NONE is not a valid value.</div>
     * <div> </div>
     */
    interactionId : INTERACTION_ID

    /**
     * The value of this property is a bitmask, which can be set to one or more of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-interaction_configuration_flags">INTERACTION_CONFIGURATION_FLAGS</a>.
     * 
     * This example shows the default setting for <b>INTERACTION_CONTEXT_CONFIGURATION</b>.
     * 
     * 
     * ```cpp
     */
    enable : INTERACTION_CONFIGURATION_FLAGS

}

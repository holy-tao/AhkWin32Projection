#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the state of the tap interaction.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ns-interactioncontext-interaction_arguments_tap
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct INTERACTION_ARGUMENTS_TAP {
    #StructPack 4

    /**
     * The number of taps detected.
     */
    count : UInt32

}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the configuration of an Interaction Context object that enables, disables, or modifies the behavior of an interaction.
 * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/ns-interactioncontext-interaction_context_configuration
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class INTERACTION_CONTEXT_CONFIGURATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-interaction_id">INTERACTION_ID</a>.
     * 
     * <div class="alert"><b>Note</b>  INTERACTION_FLAG_NONE is not a valid value.</div>
     * <div> </div>
     * @type {Integer}
     */
    interactionId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The value of this property is a bitmask, which can be set to one or more of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-interaction_configuration_flags">INTERACTION_CONFIGURATION_FLAGS</a>.
     * 
     * This example shows the default setting for <b>INTERACTION_CONTEXT_CONFIGURATION</b>.
     * 
     * 
     * ```cpp
     * @type {Integer}
     */
    enable {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

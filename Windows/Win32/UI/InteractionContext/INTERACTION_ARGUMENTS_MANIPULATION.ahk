#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MANIPULATION_TRANSFORM.ahk
#Include .\MANIPULATION_VELOCITY.ahk

/**
 * Defines the state of a manipulation.
 * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/ns-interactioncontext-interaction_arguments_manipulation
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class INTERACTION_ARGUMENTS_MANIPULATION extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * The change in translation, rotation, and scale since the last <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/nc-interactioncontext-interaction_context_output_callback">INTERACTION_CONTEXT_OUTPUT_CALLBACK</a>.
     * @type {MANIPULATION_TRANSFORM}
     */
    delta{
        get {
            if(!this.HasProp("__delta"))
                this.__delta := MANIPULATION_TRANSFORM(this.ptr + 0)
            return this.__delta
        }
    }

    /**
     * The accumulated change in translation, rotation, and scale since the interaction started.
     * @type {MANIPULATION_TRANSFORM}
     */
    cumulative{
        get {
            if(!this.HasProp("__cumulative"))
                this.__cumulative := MANIPULATION_TRANSFORM(this.ptr + 24)
            return this.__cumulative
        }
    }

    /**
     * The velocities of the accumulated transformations for the interaction.
     * @type {MANIPULATION_VELOCITY}
     */
    velocity{
        get {
            if(!this.HasProp("__velocity"))
                this.__velocity := MANIPULATION_VELOCITY(this.ptr + 48)
            return this.__velocity
        }
    }

    /**
     * One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-manipulation_rails_state">MANIPULATION_RAILS_STATE</a>.
     * @type {Integer}
     */
    railsState {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }
}

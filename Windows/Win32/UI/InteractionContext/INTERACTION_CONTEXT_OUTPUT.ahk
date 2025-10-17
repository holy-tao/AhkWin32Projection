#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MANIPULATION_TRANSFORM.ahk
#Include .\MANIPULATION_VELOCITY.ahk
#Include .\INTERACTION_ARGUMENTS_MANIPULATION.ahk
#Include .\INTERACTION_ARGUMENTS_TAP.ahk
#Include .\INTERACTION_ARGUMENTS_CROSS_SLIDE.ahk

/**
 * Defines the output of the Interaction Context object.
 * @see https://docs.microsoft.com/windows/win32/api//interactioncontext/ns-interactioncontext-interaction_context_output
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class INTERACTION_CONTEXT_OUTPUT extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * ID of the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
     * @type {Integer}
     */
    interactionId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-interaction_flags">INTERACTION_FLAGS</a>.
     * @type {Integer}
     */
    interactionFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * One of the constants from <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">POINTER_INPUT_TYPE</a>.
     * @type {Integer}
     */
    inputType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The x-coordinate of the input pointer, in HIMETRIC units.
     * @type {Float}
     */
    x {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * The y-coordinate of the input pointer, in HIMETRIC units.
     * @type {Float}
     */
    y {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * @type {INTERACTION_ARGUMENTS_MANIPULATION}
     */
    manipulation{
        get {
            if(!this.HasProp("__manipulation"))
                this.__manipulation := INTERACTION_ARGUMENTS_MANIPULATION(24, this)
            return this.__manipulation
        }
    }

    /**
     * @type {INTERACTION_ARGUMENTS_TAP}
     */
    tap{
        get {
            if(!this.HasProp("__tap"))
                this.__tap := INTERACTION_ARGUMENTS_TAP(24, this)
            return this.__tap
        }
    }

    /**
     * @type {INTERACTION_ARGUMENTS_CROSS_SLIDE}
     */
    crossSlide{
        get {
            if(!this.HasProp("__crossSlide"))
                this.__crossSlide := INTERACTION_ARGUMENTS_CROSS_SLIDE(24, this)
            return this.__crossSlide
        }
    }
}

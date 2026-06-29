#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERACTION_ARGUMENTS_TAP.ahk" { INTERACTION_ARGUMENTS_TAP }
#Import ".\MANIPULATION_RAILS_STATE.ahk" { MANIPULATION_RAILS_STATE }
#Import ".\INTERACTION_ID.ahk" { INTERACTION_ID }
#Import ".\MANIPULATION_TRANSFORM.ahk" { MANIPULATION_TRANSFORM }
#Import ".\INTERACTION_FLAGS.ahk" { INTERACTION_FLAGS }
#Import "..\WindowsAndMessaging\POINTER_INPUT_TYPE.ahk" { POINTER_INPUT_TYPE }
#Import ".\INTERACTION_ARGUMENTS_CROSS_SLIDE.ahk" { INTERACTION_ARGUMENTS_CROSS_SLIDE }
#Import ".\INTERACTION_ARGUMENTS_MANIPULATION.ahk" { INTERACTION_ARGUMENTS_MANIPULATION }
#Import ".\CROSS_SLIDE_FLAGS.ahk" { CROSS_SLIDE_FLAGS }
#Import ".\MANIPULATION_VELOCITY.ahk" { MANIPULATION_VELOCITY }

/**
 * Defines the output of the Interaction Context object.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ns-interactioncontext-interaction_context_output
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct INTERACTION_CONTEXT_OUTPUT {
    #StructPack 4


    struct _arguments {
        manipulation : INTERACTION_ARGUMENTS_MANIPULATION

        static __New() {
            DefineProp(this.Prototype, 'tap', { type: INTERACTION_ARGUMENTS_TAP, offset: 0 })
            DefineProp(this.Prototype, 'crossSlide', { type: INTERACTION_ARGUMENTS_CROSS_SLIDE, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * ID of the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object.
     */
    interactionId : INTERACTION_ID

    /**
     * One of the constants from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/ne-interactioncontext-interaction_flags">INTERACTION_FLAGS</a>.
     */
    interactionFlags : INTERACTION_FLAGS

    /**
     * One of the constants from <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">POINTER_INPUT_TYPE</a>.
     */
    inputType : POINTER_INPUT_TYPE

    /**
     * The x-coordinate of the input pointer, in HIMETRIC units.
     */
    x : Float32

    /**
     * The y-coordinate of the input pointer, in HIMETRIC units.
     */
    y : Float32

    arguments : INTERACTION_CONTEXT_OUTPUT._arguments

}

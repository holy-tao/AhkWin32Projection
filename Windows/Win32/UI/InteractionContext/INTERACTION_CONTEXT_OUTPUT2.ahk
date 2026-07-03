#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CROSS_SLIDE_FLAGS.ahk" { CROSS_SLIDE_FLAGS }
#Import ".\INTERACTION_ARGUMENTS_CROSS_SLIDE.ahk" { INTERACTION_ARGUMENTS_CROSS_SLIDE }
#Import ".\INTERACTION_ARGUMENTS_MANIPULATION.ahk" { INTERACTION_ARGUMENTS_MANIPULATION }
#Import ".\INTERACTION_ARGUMENTS_TAP.ahk" { INTERACTION_ARGUMENTS_TAP }
#Import ".\INTERACTION_FLAGS.ahk" { INTERACTION_FLAGS }
#Import ".\INTERACTION_ID.ahk" { INTERACTION_ID }
#Import ".\MANIPULATION_RAILS_STATE.ahk" { MANIPULATION_RAILS_STATE }
#Import ".\MANIPULATION_TRANSFORM.ahk" { MANIPULATION_TRANSFORM }
#Import ".\MANIPULATION_VELOCITY.ahk" { MANIPULATION_VELOCITY }
#Import "..\WindowsAndMessaging\POINTER_INPUT_TYPE.ahk" { POINTER_INPUT_TYPE }

/**
 * @namespace Windows.Win32.UI.InteractionContext
 */
export default struct INTERACTION_CONTEXT_OUTPUT2 {
    #StructPack 4


    struct _arguments {
        manipulation : INTERACTION_ARGUMENTS_MANIPULATION

        static __New() {
            DefineProp(this.Prototype, 'tap', { type: INTERACTION_ARGUMENTS_TAP, offset: 0 })
            DefineProp(this.Prototype, 'crossSlide', { type: INTERACTION_ARGUMENTS_CROSS_SLIDE, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    interactionId : INTERACTION_ID

    interactionFlags : INTERACTION_FLAGS

    inputType : POINTER_INPUT_TYPE

    contactCount : UInt32

    currentContactCount : UInt32

    x : Float32

    y : Float32

    arguments : INTERACTION_CONTEXT_OUTPUT2._arguments

}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\INTERACTION_ID.ahk
#Include .\INTERACTION_FLAGS.ahk
#Include ..\WindowsAndMessaging\POINTER_INPUT_TYPE.ahk
#Include .\INTERACTION_ARGUMENTS_MANIPULATION.ahk
#Include .\MANIPULATION_TRANSFORM.ahk
#Include .\MANIPULATION_VELOCITY.ahk
#Include .\MANIPULATION_RAILS_STATE.ahk
#Include .\INTERACTION_ARGUMENTS_TAP.ahk
#Include .\INTERACTION_ARGUMENTS_CROSS_SLIDE.ahk
#Include .\CROSS_SLIDE_FLAGS.ahk

/**
 * @namespace Windows.Win32.UI.InteractionContext
 */
class INTERACTION_CONTEXT_OUTPUT2 extends Win32Struct {
    static sizeof => 88

    static packingSize => 4

    class _arguments_e__Union extends Win32Struct {
        static sizeof => 60
        static packingSize => 4

        /**
         * @type {INTERACTION_ARGUMENTS_MANIPULATION}
         */
        manipulation {
            get {
                if(!this.HasProp("__manipulation"))
                    this.__manipulation := INTERACTION_ARGUMENTS_MANIPULATION(0, this)
                return this.__manipulation
            }
        }

        /**
         * @type {INTERACTION_ARGUMENTS_TAP}
         */
        tap {
            get {
                if(!this.HasProp("__tap"))
                    this.__tap := INTERACTION_ARGUMENTS_TAP(0, this)
                return this.__tap
            }
        }

        /**
         * @type {INTERACTION_ARGUMENTS_CROSS_SLIDE}
         */
        crossSlide {
            get {
                if(!this.HasProp("__crossSlide"))
                    this.__crossSlide := INTERACTION_ARGUMENTS_CROSS_SLIDE(0, this)
                return this.__crossSlide
            }
        }
    }

    /**
     * @type {INTERACTION_ID}
     */
    interactionId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {INTERACTION_FLAGS}
     */
    interactionFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {POINTER_INPUT_TYPE}
     */
    inputType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    contactCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    currentContactCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Float}
     */
    x {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * @type {Float}
     */
    y {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * @type {_arguments_e__Union}
     */
    arguments {
        get {
            if(!this.HasProp("__arguments"))
                this.__arguments := INTERACTION_CONTEXT_OUTPUT2._arguments_e__Union(28, this)
            return this.__arguments
        }
    }
}

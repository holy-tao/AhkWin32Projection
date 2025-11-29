#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MANIPULATION_TRANSFORM.ahk
#Include .\MANIPULATION_VELOCITY.ahk
#Include .\INTERACTION_ARGUMENTS_MANIPULATION.ahk
#Include .\INTERACTION_ARGUMENTS_TAP.ahk
#Include .\INTERACTION_ARGUMENTS_CROSS_SLIDE.ahk

/**
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class INTERACTION_CONTEXT_OUTPUT2 extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    class _arguments_e__Union extends Win32Struct {
        static sizeof => 72
        static packingSize => 8

        /**
         * @type {INTERACTION_ARGUMENTS_MANIPULATION}
         */
        manipulation{
            get {
                if(!this.HasProp("__manipulation"))
                    this.__manipulation := INTERACTION_ARGUMENTS_MANIPULATION(0, this)
                return this.__manipulation
            }
        }
    
        /**
         * @type {INTERACTION_ARGUMENTS_TAP}
         */
        tap{
            get {
                if(!this.HasProp("__tap"))
                    this.__tap := INTERACTION_ARGUMENTS_TAP(0, this)
                return this.__tap
            }
        }
    
        /**
         * @type {INTERACTION_ARGUMENTS_CROSS_SLIDE}
         */
        crossSlide{
            get {
                if(!this.HasProp("__crossSlide"))
                    this.__crossSlide := INTERACTION_ARGUMENTS_CROSS_SLIDE(0, this)
                return this.__crossSlide
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    interactionId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    interactionFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
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
    arguments{
        get {
            if(!this.HasProp("__arguments"))
                this.__arguments := %this.__Class%._arguments_e__Union(32, this)
            return this.__arguments
        }
    }
}

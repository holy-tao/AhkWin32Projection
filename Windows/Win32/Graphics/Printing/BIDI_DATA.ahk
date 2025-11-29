#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BINARY_CONTAINER.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class BIDI_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _u_e__Union extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {BOOL}
         */
        bData {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        iData {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {PWSTR}
         */
        sData {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Float}
         */
        fData {
            get => NumGet(this, 0, "float")
            set => NumPut("float", value, this, 0)
        }
    
        /**
         * @type {BINARY_CONTAINER}
         */
        biData{
            get {
                if(!this.HasProp("__biData"))
                    this.__biData := BINARY_CONTAINER(0, this)
                return this.__biData
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    dwBidiType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(8, this)
            return this.__u
        }
    }
}

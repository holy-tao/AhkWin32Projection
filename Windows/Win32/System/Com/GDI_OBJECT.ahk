#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class GDI_OBJECT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class _u extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Pointer<userHBITMAP>}
         */
        hBitmap {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<userHPALETTE>}
         */
        hPalette {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<userHGLOBAL>}
         */
        hGeneric {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    /**
     * @type {Integer}
     */
    ObjectType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {_u}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u(8, this)
            return this.__u
        }
    }
}

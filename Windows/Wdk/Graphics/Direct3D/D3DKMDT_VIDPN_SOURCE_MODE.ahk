#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_VIDPN_SOURCE_MODE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _Format_e__Union extends Win32Struct {
        static sizeof => 12
        static packingSize => 8

        /**
         * @type {Pointer<D3DKMDT_GRAPHICS_RENDERING_FORMAT>}
         */
        Graphics {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Text {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
    }

    /**
     * @type {Integer}
     */
    Id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {_Format_e__Union}
     */
    Format{
        get {
            if(!this.HasProp("__Format"))
                this.__Format := %this.__Class%._Format_e__Union(8, this)
            return this.__Format
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMDT_TEXT_RENDERING_FORMAT.ahk
#Include .\D3DKMDT_VIDPN_SOURCE_MODE_TYPE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_VIDPN_SOURCE_MODE extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    class _Format extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer}
         */
        Graphics {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }

        /**
         * @type {D3DKMDT_TEXT_RENDERING_FORMAT}
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
     * @type {D3DKMDT_VIDPN_SOURCE_MODE_TYPE}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {_Format}
     */
    Format {
        get {
            if(!this.HasProp("__Format"))
                this.__Format := D3DKMDT_VIDPN_SOURCE_MODE._Format(8, this)
            return this.__Format
        }
    }
}

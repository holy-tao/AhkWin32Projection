#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GAMMA_RAMP_RGB256x3x16.ahk
#Include .\GAMMA_RAMP_RGB.ahk
#Include .\GAMMA_RAMP_DXGI_1.ahk
#Include .\COLORSPACE_TRANSFORM_3x4.ahk
#Include .\COLORSPACE_TRANSFORM_MATRIX_V2.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class COLORSPACE_TRANSFORM extends Win32Struct
{
    static sizeof => 65600

    static packingSize => 8

    class _Data_e__Union extends Win32Struct {
        static sizeof => 65592
        static packingSize => 8

        /**
         * @type {GAMMA_RAMP_RGB256x3x16}
         */
        Rgb256x3x16{
            get {
                if(!this.HasProp("__Rgb256x3x16"))
                    this.__Rgb256x3x16 := GAMMA_RAMP_RGB256x3x16(0, this)
                return this.__Rgb256x3x16
            }
        }
    
        /**
         * @type {GAMMA_RAMP_DXGI_1}
         */
        Dxgi1{
            get {
                if(!this.HasProp("__Dxgi1"))
                    this.__Dxgi1 := GAMMA_RAMP_DXGI_1(0, this)
                return this.__Dxgi1
            }
        }
    
        /**
         * @type {COLORSPACE_TRANSFORM_3x4}
         */
        T3x4{
            get {
                if(!this.HasProp("__T3x4"))
                    this.__T3x4 := COLORSPACE_TRANSFORM_3x4(0, this)
                return this.__T3x4
            }
        }
    
        /**
         * @type {COLORSPACE_TRANSFORM_MATRIX_V2}
         */
        MatrixV2{
            get {
                if(!this.HasProp("__MatrixV2"))
                    this.__MatrixV2 := COLORSPACE_TRANSFORM_MATRIX_V2(0, this)
                return this.__MatrixV2
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {_Data_e__Union}
     */
    Data{
        get {
            if(!this.HasProp("__Data"))
                this.__Data := %this.__Class%._Data_e__Union(8, this)
            return this.__Data
        }
    }
}

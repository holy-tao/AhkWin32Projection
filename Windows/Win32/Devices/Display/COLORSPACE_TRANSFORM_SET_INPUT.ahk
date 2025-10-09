#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OUTPUT_WIRE_FORMAT.ahk
#Include .\GAMMA_RAMP_RGB256x3x16.ahk
#Include .\GAMMA_RAMP_RGB.ahk
#Include .\GAMMA_RAMP_DXGI_1.ahk
#Include .\COLORSPACE_TRANSFORM_3x4.ahk
#Include .\COLORSPACE_TRANSFORM_MATRIX_V2.ahk
#Include .\COLORSPACE_TRANSFORM.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class COLORSPACE_TRANSFORM_SET_INPUT extends Win32Struct
{
    static sizeof => 65616

    static packingSize => 8

    /**
     * @type {Integer}
     */
    OutputWireColorSpaceExpected {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {OUTPUT_WIRE_FORMAT}
     */
    OutputWireFormatExpected{
        get {
            if(!this.HasProp("__OutputWireFormatExpected"))
                this.__OutputWireFormatExpected := OUTPUT_WIRE_FORMAT(this.ptr + 8)
            return this.__OutputWireFormatExpected
        }
    }

    /**
     * @type {COLORSPACE_TRANSFORM}
     */
    ColorSpaceTransform{
        get {
            if(!this.HasProp("__ColorSpaceTransform"))
                this.__ColorSpaceTransform := COLORSPACE_TRANSFORM(this.ptr + 16)
            return this.__ColorSpaceTransform
        }
    }
}

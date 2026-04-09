#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OUTPUT_WIRE_COLOR_SPACE_TYPE.ahk
#Include .\OUTPUT_WIRE_FORMAT.ahk
#Include .\OUTPUT_COLOR_ENCODING.ahk
#Include .\COLORSPACE_TRANSFORM.ahk
#Include .\COLORSPACE_TRANSFORM_TYPE.ahk
#Include .\GAMMA_RAMP_RGB256x3x16.ahk
#Include .\GAMMA_RAMP_DXGI_1.ahk
#Include .\GAMMA_RAMP_RGB.ahk
#Include .\COLORSPACE_TRANSFORM_3x4.ahk
#Include .\COLORSPACE_TRANSFORM_MATRIX_V2.ahk
#Include .\COLORSPACE_TRANSFORM_STAGE_CONTROL.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class COLORSPACE_TRANSFORM_SET_INPUT extends Win32Struct {
    static sizeof => 98368

    static packingSize => 4

    /**
     * @type {OUTPUT_WIRE_COLOR_SPACE_TYPE}
     */
    OutputWireColorSpaceExpected {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {OUTPUT_WIRE_FORMAT}
     */
    OutputWireFormatExpected {
        get {
            if(!this.HasProp("__OutputWireFormatExpected"))
                this.__OutputWireFormatExpected := OUTPUT_WIRE_FORMAT(4, this)
            return this.__OutputWireFormatExpected
        }
    }

    /**
     * @type {COLORSPACE_TRANSFORM}
     */
    ColorSpaceTransform {
        get {
            if(!this.HasProp("__ColorSpaceTransform"))
                this.__ColorSpaceTransform := COLORSPACE_TRANSFORM(12, this)
            return this.__ColorSpaceTransform
        }
    }
}

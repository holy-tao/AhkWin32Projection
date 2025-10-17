#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 * @version v4.0.30319
 */
class DXGI_GAMMA_CONTROL_CAPABILITIES extends Win32Struct
{
    static sizeof => 4116

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    ScaleAndOffsetSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Float}
     */
    MaxConvertedValue {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Float}
     */
    MinConvertedValue {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumGammaControlPoints {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Single>}
     */
    ControlPointPositions{
        get {
            if(!this.HasProp("__ControlPointPositionsProxyArray"))
                this.__ControlPointPositionsProxyArray := Win32FixedArray(this.ptr + 16, 1025, Primitive, "float")
            return this.__ControlPointPositionsProxyArray
        }
    }
}

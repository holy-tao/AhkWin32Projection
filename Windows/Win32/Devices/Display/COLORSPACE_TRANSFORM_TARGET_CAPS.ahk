#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COLORSPACE_TRANSFORM_DATA_CAP.ahk
#Include .\COLORSPACE_TRANSFORM_1DLUT_CAP.ahk
#Include .\COLORSPACE_TRANSFORM_MATRIX_CAP.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class COLORSPACE_TRANSFORM_TARGET_CAPS extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {COLORSPACE_TRANSFORM_1DLUT_CAP}
     */
    LookupTable1DDegammaCap{
        get {
            if(!this.HasProp("__LookupTable1DDegammaCap"))
                this.__LookupTable1DDegammaCap := COLORSPACE_TRANSFORM_1DLUT_CAP(this.ptr + 8)
            return this.__LookupTable1DDegammaCap
        }
    }

    /**
     * @type {COLORSPACE_TRANSFORM_MATRIX_CAP}
     */
    ColorMatrix3x3Cap{
        get {
            if(!this.HasProp("__ColorMatrix3x3Cap"))
                this.__ColorMatrix3x3Cap := COLORSPACE_TRANSFORM_MATRIX_CAP(this.ptr + 32)
            return this.__ColorMatrix3x3Cap
        }
    }

    /**
     * @type {COLORSPACE_TRANSFORM_1DLUT_CAP}
     */
    LookupTable1DRegammaCap{
        get {
            if(!this.HasProp("__LookupTable1DRegammaCap"))
                this.__LookupTable1DRegammaCap := COLORSPACE_TRANSFORM_1DLUT_CAP(this.ptr + 56)
            return this.__LookupTable1DRegammaCap
        }
    }
}

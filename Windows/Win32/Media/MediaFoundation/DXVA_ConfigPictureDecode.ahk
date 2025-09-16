#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_ConfigPictureDecode extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwFunction {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    dwReservedBits{
        get {
            if(!this.HasProp("__dwReservedBitsProxyArray"))
                this.__dwReservedBitsProxyArray := Win32FixedArray(this.ptr + 4, 3, Primitive, "uint")
            return this.__dwReservedBitsProxyArray
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidConfigBitstreamEncryption {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidConfigMBcontrolEncryption {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidConfigResidDiffEncryption {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    bConfigBitstreamRaw {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    bConfigMBcontrolRasterOrder {
        get => NumGet(this, 41, "char")
        set => NumPut("char", value, this, 41)
    }

    /**
     * @type {Integer}
     */
    bConfigResidDiffHost {
        get => NumGet(this, 42, "char")
        set => NumPut("char", value, this, 42)
    }

    /**
     * @type {Integer}
     */
    bConfigSpatialResid8 {
        get => NumGet(this, 43, "char")
        set => NumPut("char", value, this, 43)
    }

    /**
     * @type {Integer}
     */
    bConfigResid8Subtraction {
        get => NumGet(this, 44, "char")
        set => NumPut("char", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    bConfigSpatialHost8or9Clipping {
        get => NumGet(this, 45, "char")
        set => NumPut("char", value, this, 45)
    }

    /**
     * @type {Integer}
     */
    bConfigSpatialResidInterleaved {
        get => NumGet(this, 46, "char")
        set => NumPut("char", value, this, 46)
    }

    /**
     * @type {Integer}
     */
    bConfigIntraResidUnsigned {
        get => NumGet(this, 47, "char")
        set => NumPut("char", value, this, 47)
    }

    /**
     * @type {Integer}
     */
    bConfigResidDiffAccelerator {
        get => NumGet(this, 48, "char")
        set => NumPut("char", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    bConfigHostInverseScan {
        get => NumGet(this, 49, "char")
        set => NumPut("char", value, this, 49)
    }

    /**
     * @type {Integer}
     */
    bConfigSpecificIDCT {
        get => NumGet(this, 50, "char")
        set => NumPut("char", value, this, 50)
    }

    /**
     * @type {Integer}
     */
    bConfig4GroupedCoefs {
        get => NumGet(this, 51, "char")
        set => NumPut("char", value, this, 51)
    }
}

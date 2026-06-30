#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_ConfigPictureDecode extends Win32Struct {
    static sizeof => 76

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwFunction {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    dwReservedBits {
        get {
            if(!this.HasProp("__dwReservedBitsProxyArray"))
                this.__dwReservedBitsProxyArray := Win32FixedArray(this.ptr + 4, 3, Primitive, "uint")
            return this.__dwReservedBitsProxyArray
        }
    }

    /**
     * @type {Guid}
     */
    guidConfigBitstreamEncryption {
        get {
            if(!this.HasProp("__guidConfigBitstreamEncryption"))
                this.__guidConfigBitstreamEncryption := Guid(16, this)
            return this.__guidConfigBitstreamEncryption
        }
    }

    /**
     * @type {Guid}
     */
    guidConfigMBcontrolEncryption {
        get {
            if(!this.HasProp("__guidConfigMBcontrolEncryption"))
                this.__guidConfigMBcontrolEncryption := Guid(32, this)
            return this.__guidConfigMBcontrolEncryption
        }
    }

    /**
     * @type {Guid}
     */
    guidConfigResidDiffEncryption {
        get {
            if(!this.HasProp("__guidConfigResidDiffEncryption"))
                this.__guidConfigResidDiffEncryption := Guid(48, this)
            return this.__guidConfigResidDiffEncryption
        }
    }

    /**
     * @type {Integer}
     */
    bConfigBitstreamRaw {
        get => NumGet(this, 64, "char")
        set => NumPut("char", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    bConfigMBcontrolRasterOrder {
        get => NumGet(this, 65, "char")
        set => NumPut("char", value, this, 65)
    }

    /**
     * @type {Integer}
     */
    bConfigResidDiffHost {
        get => NumGet(this, 66, "char")
        set => NumPut("char", value, this, 66)
    }

    /**
     * @type {Integer}
     */
    bConfigSpatialResid8 {
        get => NumGet(this, 67, "char")
        set => NumPut("char", value, this, 67)
    }

    /**
     * @type {Integer}
     */
    bConfigResid8Subtraction {
        get => NumGet(this, 68, "char")
        set => NumPut("char", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    bConfigSpatialHost8or9Clipping {
        get => NumGet(this, 69, "char")
        set => NumPut("char", value, this, 69)
    }

    /**
     * @type {Integer}
     */
    bConfigSpatialResidInterleaved {
        get => NumGet(this, 70, "char")
        set => NumPut("char", value, this, 70)
    }

    /**
     * @type {Integer}
     */
    bConfigIntraResidUnsigned {
        get => NumGet(this, 71, "char")
        set => NumPut("char", value, this, 71)
    }

    /**
     * @type {Integer}
     */
    bConfigResidDiffAccelerator {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    bConfigHostInverseScan {
        get => NumGet(this, 73, "char")
        set => NumPut("char", value, this, 73)
    }

    /**
     * @type {Integer}
     */
    bConfigSpecificIDCT {
        get => NumGet(this, 74, "char")
        set => NumPut("char", value, this, 74)
    }

    /**
     * @type {Integer}
     */
    bConfig4GroupedCoefs {
        get => NumGet(this, 75, "char")
        set => NumPut("char", value, this, 75)
    }
}

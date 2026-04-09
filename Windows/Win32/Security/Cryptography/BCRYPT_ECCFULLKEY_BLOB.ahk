#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ECC_CURVE_TYPE_ENUM.ahk
#Include .\ECC_CURVE_ALG_ID_ENUM.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class BCRYPT_ECCFULLKEY_BLOB extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwMagic {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {ECC_CURVE_TYPE_ENUM}
     */
    dwCurveType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {ECC_CURVE_ALG_ID_ENUM}
     */
    dwCurveGenerationAlgId {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    cbFieldLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cbSubgroupOrder {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    cbCofactor {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    cbSeed {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}

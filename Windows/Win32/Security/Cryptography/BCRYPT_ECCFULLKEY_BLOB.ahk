#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ECC_CURVE_TYPE_ENUM.ahk" { ECC_CURVE_TYPE_ENUM }
#Import ".\ECC_CURVE_ALG_ID_ENUM.ahk" { ECC_CURVE_ALG_ID_ENUM }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_ECCFULLKEY_BLOB {
    #StructPack 4

    dwMagic : UInt32

    dwVersion : UInt32

    dwCurveType : ECC_CURVE_TYPE_ENUM

    dwCurveGenerationAlgId : ECC_CURVE_ALG_ID_ENUM

    cbFieldLength : UInt32

    cbSubgroupOrder : UInt32

    cbCofactor : UInt32

    cbSeed : UInt32

}

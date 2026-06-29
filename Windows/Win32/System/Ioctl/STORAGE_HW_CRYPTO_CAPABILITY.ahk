#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_CRYPTO_KEY_SIZE.ahk" { STORAGE_CRYPTO_KEY_SIZE }
#Import ".\STORAGE_CRYPTO_ALGORITHM_ID.ahk" { STORAGE_CRYPTO_ALGORITHM_ID }
#Import ".\STORAGE_SECURITY_COMPLIANCE_BITMASK.ahk" { STORAGE_SECURITY_COMPLIANCE_BITMASK }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_HW_CRYPTO_CAPABILITY {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    CryptoCapabilityIndex : UInt32

    AlgorithmId : STORAGE_CRYPTO_ALGORITHM_ID

    KeySize : STORAGE_CRYPTO_KEY_SIZE

    DataUnitSizeBitmask : UInt32

    MaxIVBitSize : UInt16

    Reserved : UInt16

    SecurityComplianceBitmask : STORAGE_SECURITY_COMPLIANCE_BITMASK

}

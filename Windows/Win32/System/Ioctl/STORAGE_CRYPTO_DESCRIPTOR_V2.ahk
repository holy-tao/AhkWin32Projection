#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_CRYPTO_CAPABILITY_V2.ahk" { STORAGE_CRYPTO_CAPABILITY_V2 }
#Import ".\STORAGE_CRYPTO_KEY_SIZE.ahk" { STORAGE_CRYPTO_KEY_SIZE }
#Import ".\STORAGE_ICE_TYPE.ahk" { STORAGE_ICE_TYPE }
#Import ".\STORAGE_CRYPTO_ALGORITHM_ID.ahk" { STORAGE_CRYPTO_ALGORITHM_ID }
#Import ".\STORAGE_SECURITY_COMPLIANCE_BITMASK.ahk" { STORAGE_SECURITY_COMPLIANCE_BITMASK }
#Import ".\STORAGE_CRYPTO_KEY_TYPE.ahk" { STORAGE_CRYPTO_KEY_TYPE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_CRYPTO_DESCRIPTOR_V2 {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    NumKeysSupported : UInt32

    NumCryptoCapabilities : UInt32

    IceType : STORAGE_ICE_TYPE

    SecurityComplianceBitmask : STORAGE_SECURITY_COMPLIANCE_BITMASK

    KeyTypeBitmask : STORAGE_CRYPTO_KEY_TYPE

    CryptoCapabilities : STORAGE_CRYPTO_CAPABILITY_V2[1]

}

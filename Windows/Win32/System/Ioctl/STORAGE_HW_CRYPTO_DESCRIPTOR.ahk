#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_ICE_TYPE.ahk" { STORAGE_ICE_TYPE }
#Import ".\STORAGE_SECURITY_COMPLIANCE_BITMASK.ahk" { STORAGE_SECURITY_COMPLIANCE_BITMASK }
#Import ".\STORAGE_CRYPTO_KEY_TYPE.ahk" { STORAGE_CRYPTO_KEY_TYPE }
#Import ".\STORAGE_DESCRIPTOR_HEADER.ahk" { STORAGE_DESCRIPTOR_HEADER }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_HW_CRYPTO_DESCRIPTOR {
    #StructPack 4

    Header : STORAGE_DESCRIPTOR_HEADER

    NumKeysSupported : UInt32

    NumCryptoCapabilities : UInt32

    OffsetToCryptoCapabilities : UInt32

    SizeOfCryptoCapability : UInt32

    IceType : STORAGE_ICE_TYPE

    SecurityComplianceBitmask : STORAGE_SECURITY_COMPLIANCE_BITMASK

    KeyTypeBitmask : STORAGE_CRYPTO_KEY_TYPE

}

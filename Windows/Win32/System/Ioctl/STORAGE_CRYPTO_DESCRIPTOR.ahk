#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_CRYPTO_KEY_SIZE.ahk" { STORAGE_CRYPTO_KEY_SIZE }
#Import ".\STORAGE_CRYPTO_ALGORITHM_ID.ahk" { STORAGE_CRYPTO_ALGORITHM_ID }
#Import ".\STORAGE_CRYPTO_CAPABILITY.ahk" { STORAGE_CRYPTO_CAPABILITY }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_CRYPTO_DESCRIPTOR {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    NumKeysSupported : UInt32

    NumCryptoCapabilities : UInt32

    CryptoCapabilities : STORAGE_CRYPTO_CAPABILITY[1]

}

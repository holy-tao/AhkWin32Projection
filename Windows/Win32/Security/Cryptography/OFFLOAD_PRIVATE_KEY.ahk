#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct OFFLOAD_PRIVATE_KEY {
    #StructPack 8

    dwVersion : UInt32

    cbPrime1 : UInt32

    cbPrime2 : UInt32

    pbPrime1 : IntPtr

    pbPrime2 : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CONTAINER_INFO {
    #StructPack 8

    dwVersion : UInt32

    dwReserved : UInt32

    cbSigPublicKey : UInt32

    pbSigPublicKey : IntPtr

    cbKeyExPublicKey : UInt32

    pbKeyExPublicKey : IntPtr

}

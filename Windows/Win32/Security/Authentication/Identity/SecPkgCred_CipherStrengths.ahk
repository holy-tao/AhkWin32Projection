#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgCred_CipherStrengths {
    #StructPack 4

    dwMinimumCipherStrength : UInt32

    dwMaximumCipherStrength : UInt32

}

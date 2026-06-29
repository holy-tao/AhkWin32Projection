#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_EXPORTED_ISOLATED_KEY_HEADER.ahk" { NCRYPT_EXPORTED_ISOLATED_KEY_HEADER }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_EXPORTED_ISOLATED_KEY_ENVELOPE {
    #StructPack 4

    Header : NCRYPT_EXPORTED_ISOLATED_KEY_HEADER

}

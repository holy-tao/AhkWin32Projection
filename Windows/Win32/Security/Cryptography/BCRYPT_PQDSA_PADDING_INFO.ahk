#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct BCRYPT_PQDSA_PADDING_INFO {
    #StructPack 8

    pbCtx : IntPtr

    cbCtx : UInt32

    pszPrehashAlgId : PWSTR

}

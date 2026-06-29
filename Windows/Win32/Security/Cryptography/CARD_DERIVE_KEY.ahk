#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CARD_DERIVE_KEY {
    #StructPack 8

    dwVersion : UInt32

    dwFlags : UInt32

    pwszKDF : PWSTR

    bSecretAgreementIndex : Int8

    pParameterList : IntPtr

    pbDerivedKey : IntPtr

    cbDerivedKey : UInt32

    pwszAlgId : PWSTR

    dwKeyLen : UInt32

    hKey : IntPtr

}

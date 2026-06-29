#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SPC_SERIALIZED_OBJECT.ahk" { SPC_SERIALIZED_OBJECT }
#Import "..\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct SPC_LINK {
    #StructPack 8

    dwLinkChoice : UInt32

    pwszUrl : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'Moniker', { type: SPC_SERIALIZED_OBJECT, offset: 8 })
        DefineProp(this.Prototype, 'pwszFile', { type: PWSTR, offset: 8 })
        this.DeleteProp("__New")
    }
}

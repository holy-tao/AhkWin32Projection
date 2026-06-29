#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The CERT_SYSTEM_STORE_RELOCATE_PARA structure contains data to be passed to CertOpenStore when that function's dwFlags parameter is set to CERT_SYSTEM_STORE_RELOCATE_FLAG.
 * @remarks
 * The relocate capability is used to access system stores persisted in the Group Policy Template (GPT). For example, the Group Policy Editor's MMC snap-in extension for managing group policy trust lists and certificates uses the GPT's base HKEY to call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certopenstore">CertOpenStore</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_system_store_relocate_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_SYSTEM_STORE_RELOCATE_PARA {
    #StructPack 8

    hKeyBase : HKEY

    pvSystemStore : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'pvBase', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'pszSystemStore', { type: PSTR, offset: 8 })
        DefineProp(this.Prototype, 'pwszSystemStore', { type: PWSTR, offset: 8 })
        this.DeleteProp("__New")
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_CREDENTIALS {
    #StructPack 8

    lpcwszHostName : PWSTR

    dwPort : UInt32

    dwScheme : UInt32

    lpcwszUrl : PWSTR

    lpcwszRealm : PWSTR

    fAuthIdentity : BOOL

    lpcwszUserName : PWSTR

    lpcwszPassword : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'pAuthIdentityOpaque', { type: IntPtr, offset: 40 })
        this.DeleteProp("__New")
    }
}

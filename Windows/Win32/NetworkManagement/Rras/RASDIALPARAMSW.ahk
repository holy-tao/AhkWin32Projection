#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct RASDIALPARAMSW {
    #StructPack 8

    dwSize : UInt32

    szEntryName : WCHAR[257]

    szPhoneNumber : WCHAR[129]

    szCallbackNumber : WCHAR[129]

    szUserName : WCHAR[257]

    szPassword : WCHAR[257]

    szDomain : WCHAR[16]

    dwSubEntry : UInt32

    dwCallbackId : IntPtr

    dwIfIndex : UInt32

    szEncPassword : PWSTR

}

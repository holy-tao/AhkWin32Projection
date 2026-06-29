#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset ANSI
 * @architecture X64, Arm64
 */
export default struct RASDIALPARAMSA {
    #StructPack 8

    dwSize : UInt32

    szEntryName : CHAR[257]

    szPhoneNumber : CHAR[129]

    szCallbackNumber : CHAR[129]

    szUserName : CHAR[257]

    szPassword : CHAR[257]

    szDomain : CHAR[16]

    dwSubEntry : UInt32

    dwCallbackId : IntPtr

    dwIfIndex : UInt32

    szEncPassword : PSTR

}

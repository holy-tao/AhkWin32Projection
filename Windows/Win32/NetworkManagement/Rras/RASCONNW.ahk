#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRASCONN.ahk" { HRASCONN }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct RASCONNW {
    #StructPack 8

    dwSize : UInt32

    hrasconn : HRASCONN

    szEntryName : WCHAR[257]

    szDeviceType : WCHAR[17]

    szDeviceName : WCHAR[129]

    szPhonebook : WCHAR[260]

    dwSubEntry : UInt32

    guidEntry : Guid

    dwFlags : UInt32

    luid : LUID

    guidCorrelationId : Guid

}

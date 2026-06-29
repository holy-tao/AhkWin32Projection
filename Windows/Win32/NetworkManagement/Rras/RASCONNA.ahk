#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRASCONN.ahk" { HRASCONN }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset ANSI
 * @architecture X64, Arm64
 */
export default struct RASCONNA {
    #StructPack 8

    dwSize : UInt32

    hrasconn : HRASCONN

    szEntryName : CHAR[257]

    szDeviceType : CHAR[17]

    szDeviceName : CHAR[129]

    szPhonebook : CHAR[260]

    dwSubEntry : UInt32

    guidEntry : Guid

    dwFlags : UInt32

    luid : LUID

    guidCorrelationId : Guid

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIACTIONW.ahk" { DIACTIONW }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
export default struct DIACTIONFORMATW {
    #StructPack 8

    dwSize : UInt32

    dwActionSize : UInt32

    dwDataSize : UInt32

    dwNumActions : UInt32

    rgoAction : DIACTIONW.Ptr

    guidActionMap : Guid

    dwGenre : UInt32

    dwBufferSize : UInt32

    lAxisMin : Int32

    lAxisMax : Int32

    hInstString : HINSTANCE

    ftTimeStamp : FILETIME

    dwCRC : UInt32

    tszActionMap : WCHAR[260]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import ".\DIACTIONA.ahk" { DIACTIONA }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
export default struct DIACTIONFORMATA {
    #StructPack 8

    dwSize : UInt32

    dwActionSize : UInt32

    dwDataSize : UInt32

    dwNumActions : UInt32

    rgoAction : DIACTIONA.Ptr

    guidActionMap : Guid

    dwGenre : UInt32

    dwBufferSize : UInt32

    lAxisMin : Int32

    lAxisMax : Int32

    hInstString : HINSTANCE

    ftTimeStamp : FILETIME

    dwCRC : UInt32

    tszActionMap : CHAR[260]

}

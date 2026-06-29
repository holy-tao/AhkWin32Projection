#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMUS_CLOCKTYPE.ahk" { DMUS_CLOCKTYPE }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_CLOCKINFO8 {
    #StructPack 4

    dwSize : UInt32

    ctType : DMUS_CLOCKTYPE

    guidClock : Guid

    wszDescription : WCHAR[128]

    dwFlags : UInt32

}

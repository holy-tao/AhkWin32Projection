#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_BUFFERDESC {
    #StructPack 4

    dwSize : UInt32

    dwFlags : UInt32

    guidBufferFormat : Guid

    cbBuffer : UInt32

}

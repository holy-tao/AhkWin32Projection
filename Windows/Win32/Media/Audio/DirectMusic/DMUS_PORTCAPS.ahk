#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_PORTCAPS {
    #StructPack 4

    dwSize : UInt32

    dwFlags : UInt32

    guidPort : Guid

    dwClass : UInt32

    dwType : UInt32

    dwMemorySize : UInt32

    dwMaxChannelGroups : UInt32

    dwMaxVoices : UInt32

    dwMaxAudioChannels : UInt32

    dwEffectFlags : UInt32

    wszDescription : WCHAR[128]

}

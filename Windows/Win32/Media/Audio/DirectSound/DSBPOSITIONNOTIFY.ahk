#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct DSBPOSITIONNOTIFY {
    #StructPack 8

    dwOffset : UInt32

    hEventNotify : HANDLE

}

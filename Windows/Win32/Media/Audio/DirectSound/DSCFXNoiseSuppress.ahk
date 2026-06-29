#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct DSCFXNoiseSuppress {
    #StructPack 4

    fEnable : BOOL

}

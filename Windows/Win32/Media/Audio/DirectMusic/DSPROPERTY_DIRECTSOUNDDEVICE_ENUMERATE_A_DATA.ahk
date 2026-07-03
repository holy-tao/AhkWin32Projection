#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKA.ahk" { LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKA }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_A_DATA {
    #StructPack 8

    Callback : LPFNDIRECTSOUNDDEVICEENUMERATECALLBACKA

    Context : IntPtr

}

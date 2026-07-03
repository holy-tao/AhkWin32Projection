#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPFNDIRECTSOUNDDEVICEENUMERATECALLBACK1.ahk" { LPFNDIRECTSOUNDDEVICEENUMERATECALLBACK1 }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_1_DATA {
    #StructPack 8

    Callback : LPFNDIRECTSOUNDDEVICEENUMERATECALLBACK1

    Context : IntPtr

}

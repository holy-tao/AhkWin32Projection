#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA_SampleFormat.ahk" { DXVA_SampleFormat }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_VideoSample {
    #StructPack 8

    rtStart : Int64

    rtEnd : Int64

    SampleFormat : DXVA_SampleFormat

    lpDDSSrcSurface : IntPtr

}

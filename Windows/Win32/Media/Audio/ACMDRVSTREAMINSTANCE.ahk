#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HACMSTREAM.ahk" { HACMSTREAM }
#Import ".\WAVEFILTER.ahk" { WAVEFILTER }
#Import ".\WAVEFORMATEX.ahk" { WAVEFORMATEX }

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct ACMDRVSTREAMINSTANCE {
    #StructPack 8

    cbStruct : UInt32

    pwfxSrc : WAVEFORMATEX.Ptr

    pwfxDst : WAVEFORMATEX.Ptr

    pwfltr : WAVEFILTER.Ptr

    dwCallback : IntPtr

    dwInstance : IntPtr

    fdwOpen : UInt32

    fdwDriver : UInt32

    dwDriver : IntPtr

    has : HACMSTREAM

}

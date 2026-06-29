#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSDS3D_HRTF_PARAMS_MSG {
    #StructPack 4

    Size : UInt32

    Enabled : UInt32

    SwapChannels : BOOL

    ZeroAzimuth : BOOL

    CrossFadeOutput : BOOL

    FilterSize : UInt32

}

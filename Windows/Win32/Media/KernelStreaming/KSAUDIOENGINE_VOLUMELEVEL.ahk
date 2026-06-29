#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AUDIO_CURVE_TYPE.ahk" { AUDIO_CURVE_TYPE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIOENGINE_VOLUMELEVEL {
    #StructPack 8

    TargetVolume : Int32

    CurveType : AUDIO_CURVE_TYPE

    CurveDuration : Int64

}

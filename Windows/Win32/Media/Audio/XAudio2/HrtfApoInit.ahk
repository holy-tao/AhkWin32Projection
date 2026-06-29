#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HrtfDistanceDecay.ahk" { HrtfDistanceDecay }
#Import ".\HrtfDirectivity.ahk" { HrtfDirectivity }

/**
 * Specifies parameters used to initialize HRTF spatial audio.
 * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/ns-hrtfapoapi-hrtfapoinit
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct HrtfApoInit {
    #StructPack 8

    /**
     * The decay type. If you pass in nullptr, the default value is used. The default is natural decay.
     */
    distanceDecay : HrtfDistanceDecay.Ptr

    /**
     * The directivity type. If you pass in nullptr, the default value is used. The default directivity is omni-directional.
     */
    directivity : HrtfDirectivity.Ptr

}

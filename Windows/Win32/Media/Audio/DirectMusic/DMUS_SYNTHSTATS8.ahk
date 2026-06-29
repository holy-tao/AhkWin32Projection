#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_SYNTHSTATS8 {
    #StructPack 4

    dwSize : UInt32

    dwValidStats : UInt32

    dwVoices : UInt32

    dwTotalCPU : UInt32

    dwCPUPerVoice : UInt32

    dwLostNotes : UInt32

    dwFreeMemory : UInt32

    lPeakVolume : Int32

    dwSynthMemUse : UInt32

}

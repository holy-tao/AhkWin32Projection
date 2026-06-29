#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPWORDPRONUNCIATION.ahk" { SPWORDPRONUNCIATION }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPWORDPRONUNCIATIONLIST {
    #StructPack 8

    ulSize : UInt32

    pvBuffer : IntPtr

    pFirstWordPronunciation : SPWORDPRONUNCIATION.Ptr

}

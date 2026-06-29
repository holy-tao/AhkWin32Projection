#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPWORD.ahk" { SPWORD }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPWORDLIST {
    #StructPack 8

    ulSize : UInt32

    pvBuffer : IntPtr

    pFirstWord : SPWORD.Ptr

}

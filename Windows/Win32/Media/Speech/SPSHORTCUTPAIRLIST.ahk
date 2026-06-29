#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SPSHORTCUTPAIR.ahk" { SPSHORTCUTPAIR }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPSHORTCUTPAIRLIST {
    #StructPack 8

    ulSize : UInt32

    pvBuffer : IntPtr

    pFirstShortcutPair : SPSHORTCUTPAIR.Ptr

}

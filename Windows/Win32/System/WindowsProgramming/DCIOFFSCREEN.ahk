#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DCISURFACEINFO.ahk" { DCISURFACEINFO }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct DCIOFFSCREEN {
    #StructPack 8

    dciInfo : DCISURFACEINFO

    Draw : IntPtr

    SetClipList : IntPtr

    SetDestination : IntPtr

}

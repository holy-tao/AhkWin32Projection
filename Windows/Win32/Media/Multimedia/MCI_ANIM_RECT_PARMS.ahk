#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MCI_ANIM_RECT_PARMS {
    #StructPack 8

    dwCallback : IntPtr

    rc : RECT

}

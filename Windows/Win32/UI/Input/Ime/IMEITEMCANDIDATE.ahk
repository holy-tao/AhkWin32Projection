#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMEITEM.ahk" { IMEITEM }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEITEMCANDIDATE {
    #StructPack 8

    uCount : UInt32

    imeItem : IMEITEM[1]

}

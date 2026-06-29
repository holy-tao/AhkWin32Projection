#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct LIGATURE {
    #StructPack 8

    culSize : UInt32

    pwsz : PWSTR

    chglyph : UInt32

    ahglyph : UInt32[1]

}

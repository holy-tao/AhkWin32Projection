#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LIGATURE.ahk" { LIGATURE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct FD_LIGATURE {
    #StructPack 8

    culThis : UInt32

    ulType : UInt32

    cLigatures : UInt32

    alig : LIGATURE[1]

}

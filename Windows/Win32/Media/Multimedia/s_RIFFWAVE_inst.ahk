#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct s_RIFFWAVE_inst {
    #StructPack 1

    bUnshiftedNote : Int8

    chFineTune : CHAR

    chGain : CHAR

    bLowNote : Int8

    bHighNote : Int8

    bLowVelocity : Int8

    bHighVelocity : Int8

}

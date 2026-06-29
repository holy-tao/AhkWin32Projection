#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RGNRANGE.ahk" { RGNRANGE }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct RGNHEADER {
    #StructPack 2

    RangeKey : RGNRANGE

    RangeVelocity : RGNRANGE

    fusOptions : UInt16

    usKeyGroup : UInt16

}

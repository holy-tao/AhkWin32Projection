#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RGNRANGE.ahk" { RGNRANGE }
#Import ".\WAVELINK.ahk" { WAVELINK }
#Import ".\WLOOP.ahk" { WLOOP }
#Import ".\WSMPL.ahk" { WSMPL }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_REGION {
    #StructPack 4

    RangeKey : RGNRANGE

    RangeVelocity : RGNRANGE

    fusOptions : UInt16

    usKeyGroup : UInt16

    ulRegionArtIdx : UInt32

    ulNextRegionIdx : UInt32

    ulFirstExtCkIdx : UInt32

    WaveLink : WAVELINK

    WSMP : WSMPL

    WLOOP : WLOOP[1]

}

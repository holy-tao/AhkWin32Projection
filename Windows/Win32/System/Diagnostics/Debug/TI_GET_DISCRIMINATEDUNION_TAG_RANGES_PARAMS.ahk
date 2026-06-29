#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISCRIMINATEDUNION_TAG_VALUE.ahk" { DISCRIMINATEDUNION_TAG_VALUE }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct TI_GET_DISCRIMINATEDUNION_TAG_RANGES_PARAMS {
    #StructPack 4

    Count : UInt32

    Start : UInt32

    Range : DISCRIMINATEDUNION_TAG_VALUE[1]

}

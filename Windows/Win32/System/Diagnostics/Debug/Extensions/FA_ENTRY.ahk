#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEBUG_FLR_PARAM_TYPE.ahk" { DEBUG_FLR_PARAM_TYPE }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct FA_ENTRY {
    #StructPack 4

    Tag : DEBUG_FLR_PARAM_TYPE

    FullSize : UInt16

    DataSize : UInt16

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDR64_STRING_HEADER_FORMAT.ahk" { NDR64_STRING_HEADER_FORMAT }
#Import ".\NDR64_STRING_FLAGS.ahk" { NDR64_STRING_FLAGS }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_RANGED_STRING_FORMAT {
    #StructPack 8

    Header : NDR64_STRING_HEADER_FORMAT

    Reserved : UInt32

    Min : Int64

    Max : Int64

}

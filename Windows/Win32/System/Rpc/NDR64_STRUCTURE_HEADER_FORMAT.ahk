#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDR64_STRUCTURE_FLAGS.ahk" { NDR64_STRUCTURE_FLAGS }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_STRUCTURE_HEADER_FORMAT {
    #StructPack 4

    FormatCode : Int8

    Alignment : Int8

    Flags : NDR64_STRUCTURE_FLAGS

    Reserve : Int8

    MemorySize : UInt32

}

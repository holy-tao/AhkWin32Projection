#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDR64_STRUCTURE_FLAGS.ahk" { NDR64_STRUCTURE_FLAGS }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_CONF_BOGUS_STRUCTURE_HEADER_FORMAT {
    #StructPack 8

    FormatCode : Int8

    Alignment : Int8

    Flags : NDR64_STRUCTURE_FLAGS

    Dimensions : Int8

    MemorySize : UInt32

    OriginalMemberLayout : IntPtr

    OriginalPointerLayout : IntPtr

    PointerLayout : IntPtr

    ConfArrayDescription : IntPtr

}

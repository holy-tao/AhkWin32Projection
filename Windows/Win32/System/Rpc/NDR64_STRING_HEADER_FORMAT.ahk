#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDR64_STRING_FLAGS.ahk" { NDR64_STRING_FLAGS }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_STRING_HEADER_FORMAT {
    #StructPack 2

    FormatCode : Int8

    Flags : NDR64_STRING_FLAGS

    ElementSize : UInt16

}

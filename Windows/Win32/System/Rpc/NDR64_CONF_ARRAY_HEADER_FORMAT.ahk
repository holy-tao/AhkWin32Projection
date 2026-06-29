#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDR64_ARRAY_FLAGS.ahk" { NDR64_ARRAY_FLAGS }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_CONF_ARRAY_HEADER_FORMAT {
    #StructPack 8

    FormatCode : Int8

    Alignment : Int8

    Flags : NDR64_ARRAY_FLAGS

    Reserved : Int8

    ElementSize : UInt32

    ConfDescriptor : IntPtr

}

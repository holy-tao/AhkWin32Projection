#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDR64_STRING_HEADER_FORMAT.ahk" { NDR64_STRING_HEADER_FORMAT }
#Import ".\NDR64_STRING_FLAGS.ahk" { NDR64_STRING_FLAGS }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_NON_CONFORMANT_STRING_FORMAT {
    #StructPack 4

    Header : NDR64_STRING_HEADER_FORMAT

    TotalSize : UInt32

}

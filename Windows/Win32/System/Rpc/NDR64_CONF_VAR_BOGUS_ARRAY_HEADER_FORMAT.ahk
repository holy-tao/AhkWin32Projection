#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDR64_ARRAY_FLAGS.ahk" { NDR64_ARRAY_FLAGS }
#Import ".\NDR64_BOGUS_ARRAY_HEADER_FORMAT.ahk" { NDR64_BOGUS_ARRAY_HEADER_FORMAT }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_CONF_VAR_BOGUS_ARRAY_HEADER_FORMAT {
    #StructPack 8

    FixedArrayFormat : NDR64_BOGUS_ARRAY_HEADER_FORMAT

    ConfDescription : IntPtr

    VarDescription : IntPtr

    OffsetDescription : IntPtr

}

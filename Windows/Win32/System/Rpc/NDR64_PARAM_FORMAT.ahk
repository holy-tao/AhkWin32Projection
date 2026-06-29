#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDR64_PARAM_FLAGS.ahk" { NDR64_PARAM_FLAGS }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_PARAM_FORMAT {
    #StructPack 8

    Type : IntPtr

    Attributes : NDR64_PARAM_FLAGS

    Reserved : UInt16

    StackOffset : UInt32

}

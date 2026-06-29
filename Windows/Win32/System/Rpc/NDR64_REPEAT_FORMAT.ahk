#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDR64_POINTER_REPEAT_FLAGS.ahk" { NDR64_POINTER_REPEAT_FLAGS }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_REPEAT_FORMAT {
    #StructPack 4

    FormatCode : Int8

    Flags : NDR64_POINTER_REPEAT_FLAGS

    Reserved : UInt16

    Increment : UInt32

    OffsetToArray : UInt32

    NumberOfPointers : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KBUGCHECK_DUMP_IO_TYPE.ahk" { KBUGCHECK_DUMP_IO_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KBUGCHECK_DUMP_IO {
    #StructPack 8

    Offset : Int64

    Buffer : IntPtr

    BufferLength : UInt32

    Type : KBUGCHECK_DUMP_IO_TYPE

}

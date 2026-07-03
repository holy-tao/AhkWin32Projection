#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }
#Import ".\PFLT_INSTANCE.ahk" { PFLT_INSTANCE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_IO_PARAMETER_BLOCK {
    #StructPack 8

    IrpFlags : UInt32

    MajorFunction : Int8

    MinorFunction : Int8

    OperationFlags : Int8

    Reserved : Int8

    TargetFileObject : FILE_OBJECT.Ptr

    TargetInstance : PFLT_INSTANCE

    Parameters : IntPtr

}

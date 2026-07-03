#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFLT_POST_OPERATION_CALLBACK.ahk" { PFLT_POST_OPERATION_CALLBACK }
#Import ".\PFLT_PRE_OPERATION_CALLBACK.ahk" { PFLT_PRE_OPERATION_CALLBACK }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_OPERATION_REGISTRATION {
    #StructPack 8

    MajorFunction : Int8

    Flags : UInt32

    PreOperation : PFLT_PRE_OPERATION_CALLBACK

    PostOperation : PFLT_POST_OPERATION_CALLBACK

    Reserved1 : IntPtr

}

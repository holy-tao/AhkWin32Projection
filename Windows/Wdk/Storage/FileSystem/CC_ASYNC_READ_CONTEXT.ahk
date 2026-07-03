#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import ".\PASYNC_READ_COMPLETION_CALLBACK.ahk" { PASYNC_READ_COMPLETION_CALLBACK }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CC_ASYNC_READ_CONTEXT {
    #StructPack 8

    CompletionRoutine : PASYNC_READ_COMPLETION_CALLBACK

    Context : IntPtr

    Mdl : MDL.Ptr

    RequestorMode : Int8

    NestingLevel : UInt32

}

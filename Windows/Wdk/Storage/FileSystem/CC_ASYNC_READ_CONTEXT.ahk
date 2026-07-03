#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\MDL.ahk" { MDL }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CC_ASYNC_READ_CONTEXT {
    #StructPack 8

    CompletionRoutine : IntPtr

    Context : IntPtr

    Mdl : MDL.Ptr

    RequestorMode : Int8

    NestingLevel : UInt32

}

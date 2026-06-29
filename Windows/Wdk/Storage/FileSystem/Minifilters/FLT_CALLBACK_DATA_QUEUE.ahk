#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_CALLBACK_DATA_QUEUE_FLAGS.ahk" { FLT_CALLBACK_DATA_QUEUE_FLAGS }
#Import ".\PFLT_INSTANCE.ahk" { PFLT_INSTANCE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_CALLBACK_DATA_QUEUE {
    #StructPack 8

    Csq : IntPtr

    Flags : FLT_CALLBACK_DATA_QUEUE_FLAGS

    Instance : PFLT_INSTANCE

    InsertIo : IntPtr

    RemoveIo : IntPtr

    PeekNextIo : IntPtr

    Acquire : IntPtr

    Release : IntPtr

    CompleteCanceledIo : IntPtr

}

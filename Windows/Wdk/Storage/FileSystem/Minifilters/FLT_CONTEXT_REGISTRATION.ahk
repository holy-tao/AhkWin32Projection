#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFLT_CONTEXT_ALLOCATE_CALLBACK.ahk" { PFLT_CONTEXT_ALLOCATE_CALLBACK }
#Import ".\PFLT_CONTEXT_CLEANUP_CALLBACK.ahk" { PFLT_CONTEXT_CLEANUP_CALLBACK }
#Import ".\PFLT_CONTEXT_FREE_CALLBACK.ahk" { PFLT_CONTEXT_FREE_CALLBACK }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_CONTEXT_REGISTRATION {
    #StructPack 8

    ContextType : UInt16

    Flags : UInt16

    ContextCleanupCallback : PFLT_CONTEXT_CLEANUP_CALLBACK

    Size : IntPtr

    PoolTag : UInt32

    ContextAllocateCallback : PFLT_CONTEXT_ALLOCATE_CALLBACK

    ContextFreeCallback : PFLT_CONTEXT_FREE_CALLBACK

    Reserved1 : IntPtr

}

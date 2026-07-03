#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PALLOCATE_VIRTUAL_MEMORY_EX_CALLBACK.ahk" { PALLOCATE_VIRTUAL_MEMORY_EX_CALLBACK }
#Import ".\PFREE_VIRTUAL_MEMORY_EX_CALLBACK.ahk" { PFREE_VIRTUAL_MEMORY_EX_CALLBACK }
#Import ".\PQUERY_VIRTUAL_MEMORY_CALLBACK.ahk" { PQUERY_VIRTUAL_MEMORY_CALLBACK }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct RTL_SEGMENT_HEAP_VA_CALLBACKS {
    #StructPack 8

    CallbackContext : HANDLE

    AllocateVirtualMemory : PALLOCATE_VIRTUAL_MEMORY_EX_CALLBACK

    FreeVirtualMemory : PFREE_VIRTUAL_MEMORY_EX_CALLBACK

    QueryVirtualMemory : PQUERY_VIRTUAL_MEMORY_CALLBACK

}

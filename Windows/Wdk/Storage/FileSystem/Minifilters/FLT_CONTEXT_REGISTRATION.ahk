#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_CONTEXT_REGISTRATION {
    #StructPack 8

    ContextType : UInt16

    Flags : UInt16

    ContextCleanupCallback : IntPtr

    Size : IntPtr

    PoolTag : UInt32

    ContextAllocateCallback : IntPtr

    ContextFreeCallback : IntPtr

    Reserved1 : IntPtr

}

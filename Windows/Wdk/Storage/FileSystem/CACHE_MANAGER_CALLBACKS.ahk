#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CACHE_MANAGER_CALLBACKS {
    #StructPack 8

    AcquireForLazyWrite : IntPtr

    ReleaseFromLazyWrite : IntPtr

    AcquireForReadAhead : IntPtr

    ReleaseFromReadAhead : IntPtr

}

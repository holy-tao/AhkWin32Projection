#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A structure containing optional memory allocation and deallocation routines.
 * @see https://learn.microsoft.com/windows/win32/api/compressapi/ns-compressapi-compress_allocation_routines
 * @namespace Windows.Win32.Storage.Compression
 */
export default struct COMPRESS_ALLOCATION_ROUTINES {
    #StructPack 8

    /**
     * Callback that allocates memory.
     */
    Allocate : IntPtr

    /**
     * Callback that deallocates memory.
     */
    Free : IntPtr

    /**
     * A pointer to context information for the allocation or deallocation routine defined by the user.
     */
    UserContext : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a name cache.
 * @see https://learn.microsoft.com/windows/win32/api/filehc/ns-filehc-name_cache_context
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NAME_CACHE_CONTEXT {
    #StructPack 4

    /**
     * The signature to this structure to ensure whether this name cache context is valid.
     * 
     * <div class="alert"><b>Note</b>  Users should never change this for any reason.</div>
     * <div> </div>
     */
    m_dwSignature : UInt32

}

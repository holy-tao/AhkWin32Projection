#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an opaque handle to a resource indexer object. The handle is managed by the operating system. For more info, and scenario-based walkthroughs of how to use these APIs, see Package resource indexing (PRI) APIs and custom build systems.
 * @see https://learn.microsoft.com/windows/win32/menurc/mrmresourceindexerhandle
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MrmResourceIndexerHandle {
    #StructPack 8

    /**
     * Type: **PVOID**
     * 
     * 
     * An opaque handle to a resource indexer object.
     */
    handle : IntPtr

}

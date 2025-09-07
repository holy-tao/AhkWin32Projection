#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an opaque handle to a resource indexer object. The handle is managed by the operating system. For more info, and scenario-based walkthroughs of how to use these APIs, see Package resource indexing (PRI) APIs and custom build systems.
 * @see https://learn.microsoft.com/windows/win32/menurc/mrmresourceindexerhandle
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MrmResourceIndexerHandle extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Type: **PVOID**
     * 
     * 
     * An opaque handle to a resource indexer object.
     * @type {Pointer<Void>}
     */
    handle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A structure containing optional memory allocation and deallocation routines.
 * @see https://learn.microsoft.com/windows/win32/api/compressapi/ns-compressapi-compress_allocation_routines
 * @namespace Windows.Win32.Storage.Compression
 * @version v4.0.30319
 */
class COMPRESS_ALLOCATION_ROUTINES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Callback that allocates memory.
     * @type {Pointer<PFN_COMPRESS_ALLOCATE>}
     */
    Allocate {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Callback that deallocates memory.
     * @type {Pointer<PFN_COMPRESS_FREE>}
     */
    Free {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to context information for the allocation or deallocation routine defined by the user.
     * @type {Pointer<Void>}
     */
    UserContext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

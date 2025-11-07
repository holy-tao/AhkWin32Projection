#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies custom functions which the Process Snapshotting functions use to allocate and free the internal walk marker structures.
 * @remarks
 * 
 * To use custom memory allocation functions, pass this structure to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalkmarkercreate">PssWalkMarkerCreate</a>. Otherwise, the Process Snapshotting functions use  the default process heap.
 * 
 * The <b>PSS_ALLOCATOR</b> structure that provides the custom functions should remain valid for the lifetime of the walk marker that <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalkmarkercreate">PssWalkMarkerCreate</a> creates. 
 * 
 * <b>FreeRoutine</b> must accept <b>NULL</b> address parameters without failing.
 * 
 * The custom functions are called from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalkmarkercreate">PssWalkMarkerCreate</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalkmarkerfree">PssWalkMarkerFree</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a> using the same thread that calls <b>PssWalkMarkerCreate</b>, <b>PssWalkMarkerFree</b> and <b>PssWalkSnapshot</b>. Therefore the custom functions need not be multi-threaded.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/ns-processsnapshot-pss_allocator
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_ALLOCATOR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * An arbitrary pointer-sized value that the Process Snapshotting functions pass to <b>AllocRoutine</b> and <b>FreeRoutine</b>.
     * @type {Pointer<Void>}
     */
    Context {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a WINAPI-calling convention function that takes two parameters. It returns a pointer to the block of memory that it allocates, or <b>NULL</b> if allocation fails.
     * @type {Pointer}
     */
    AllocRoutine {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a WINAPI-calling convention function taking two parameters. It deallocates a block of memory that <b>AllocRoutine</b> allocated.
     * @type {Pointer}
     */
    FreeRoutine {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

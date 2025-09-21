#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes one entry (block) of a heap that is being examined.
 * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/ns-tlhelp32-heapentry32
 * @namespace Windows.Win32.System.Diagnostics.ToolHelp
 * @version v4.0.30319
 */
class HEAPENTRY32 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The size of the structure, in bytes. Before calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-heap32first">Heap32First</a> function, set this member to <c>sizeof(HEAPENTRY32)</c>. If you do not initialize <b>dwSize</b>, 
     * <b>Heap32First</b> fails.
     * @type {Pointer}
     */
    dwSize {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A handle to the heap block.
     * @type {Pointer<Void>}
     */
    hHandle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The linear address of the start of the block.
     * @type {Pointer}
     */
    dwAddress {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The size of the heap block, in bytes.
     * @type {Pointer}
     */
    dwBlockSize {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * This member is no longer used and is always set to zero.
     * @type {Integer}
     */
    dwLockCount {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Reserved; do not use or alter.
     * @type {Integer}
     */
    dwResvd {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The identifier of the process that uses the heap.
     * @type {Integer}
     */
    th32ProcessID {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The heap identifier. This is not a handle, and has meaning only to the tool help functions.
     * @type {Pointer}
     */
    th32HeapID {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HEAPENTRY32_FLAGS.ahk" { HEAPENTRY32_FLAGS }

/**
 * Describes one entry (block) of a heap that is being examined.
 * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/ns-tlhelp32-heapentry32
 * @namespace Windows.Win32.System.Diagnostics.ToolHelp
 */
export default struct HEAPENTRY32 {
    #StructPack 8

    /**
     * The size of the structure, in bytes. Before calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-heap32first">Heap32First</a> function, set this member to <c>sizeof(HEAPENTRY32)</c>. If you do not initialize <b>dwSize</b>, 
     * <b>Heap32First</b> fails.
     */
    dwSize : IntPtr

    /**
     * A handle to the heap block.
     */
    hHandle : HANDLE

    /**
     * The linear address of the start of the block.
     */
    dwAddress : IntPtr

    /**
     * The size of the heap block, in bytes.
     */
    dwBlockSize : IntPtr

    dwFlags : HEAPENTRY32_FLAGS

    /**
     * This member is no longer used and is always set to zero.
     */
    dwLockCount : UInt32

    /**
     * Reserved; do not use or alter.
     */
    dwResvd : UInt32

    /**
     * The identifier of the process that uses the heap.
     */
    th32ProcessID : UInt32

    /**
     * The heap identifier. This is not a handle, and has meaning only to the tool help functions.
     */
    th32HeapID : IntPtr

}

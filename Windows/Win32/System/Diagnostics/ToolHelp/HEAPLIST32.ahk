#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes an entry from a list that enumerates the heaps used by a specified process.
 * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/ns-tlhelp32-heaplist32
 * @namespace Windows.Win32.System.Diagnostics.ToolHelp
 */
export default struct HEAPLIST32 {
    #StructPack 8

    /**
     * The size of the structure, in bytes. Before calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-heap32listfirst">Heap32ListFirst</a> function, set this member to <c>sizeof(HEAPLIST32)</c>. If you do not initialize <b>dwSize</b>, 
     * <b>Heap32ListFirst</b> will fail.
     */
    dwSize : IntPtr

    /**
     * The identifier of the process to be examined.
     */
    th32ProcessID : UInt32

    /**
     * The heap identifier. This is not a handle, and has meaning only to the tool help functions.
     */
    th32HeapID : IntPtr

    /**
     * This member can be one of the  following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HF32_DEFAULT"></a><a id="hf32_default"></a><dl>
     * <dt><b>HF32_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Process's default heap
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

}

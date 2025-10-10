#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes an entry from a list that enumerates the heaps used by a specified process.
 * @see https://docs.microsoft.com/windows/win32/api//tlhelp32/ns-tlhelp32-heaplist32
 * @namespace Windows.Win32.System.Diagnostics.ToolHelp
 * @version v4.0.30319
 */
class HEAPLIST32 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size of the structure, in bytes. Before calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-heap32listfirst">Heap32ListFirst</a> function, set this member to <c>sizeof(HEAPLIST32)</c>. If you do not initialize <b>dwSize</b>, 
     * <b>Heap32ListFirst</b> will fail.
     * @type {Pointer}
     */
    dwSize {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The identifier of the process to be examined.
     * @type {Integer}
     */
    th32ProcessID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The heap identifier. This is not a handle, and has meaning only to the tool help functions.
     * @type {Pointer}
     */
    th32HeapID {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}

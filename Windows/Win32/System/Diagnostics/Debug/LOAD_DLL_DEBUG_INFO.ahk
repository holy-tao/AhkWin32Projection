#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a dynamic-link library (DLL) that has just been loaded.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-load_dll_debug_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class LOAD_DLL_DEBUG_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A handle to the loaded DLL. If this member is <b>NULL</b>, the handle is not valid. Otherwise, the member is opened for reading and read-sharing in the context of the debugger.
     * 
     * When the debugger is finished with this file, it should close the handle using the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * @type {Pointer<Ptr>}
     */
    hFile {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the base address of the DLL in the address space of the process loading the DLL.
     * @type {Pointer<Void>}
     */
    lpBaseOfDll {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The offset to the debugging information in the file identified by the <b>hFile</b> member, in bytes. The system expects the debugging information to be in CodeView 4.0 format. This format is currently a derivative of Common Object File Format (COFF).
     * @type {Integer}
     */
    dwDebugInfoFileOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The size of the debugging information in the file, in bytes. If this member is zero, there is no debugging information.
     * @type {Integer}
     */
    nDebugInfoSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A pointer to the file name associated with <b>hFile</b>. This member may be <b>NULL</b>, or it may contain the address of a string pointer in the address space of the process being debugged. That address may, in turn, either be <b>NULL</b> or point to the actual filename. If <b>fUnicode</b> is a nonzero value, the name string is Unicode; otherwise, it is ANSI. 
     * 
     * 
     * 
     * 
     * This member is strictly optional. Debuggers must be prepared to handle the case where <b>lpImageName</b> is <b>NULL</b> or *<b>lpImageName</b> (in the address space of the process being debugged) is <b>NULL</b>. Specifically, the system will never provide an image name for a create process event, and it will not likely pass an image name for the first DLL event. The system will also never provide this information in the case of debugging events that originate from a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-debugactiveprocess">DebugActiveProcess</a> function.
     * @type {Pointer<Void>}
     */
    lpImageName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A value that indicates whether a filename specified by <b>lpImageName</b> is Unicode or ANSI. A nonzero value for this member indicates Unicode; zero indicates ANSI.
     * @type {Integer}
     */
    fUnicode {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }
}

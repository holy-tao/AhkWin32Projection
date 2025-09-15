#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The PROCESSENTRY32 (tlhelp32.h) structure describes an entry from a list of the processes residing in the system address space when a snapshot was taken.
 * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/ns-tlhelp32-processentry32
 * @namespace Windows.Win32.System.Diagnostics.ToolHelp
 * @version v4.0.30319
 * @charset ANSI
 */
class PROCESSENTRY32 extends Win32Struct
{
    static sizeof => 304

    static packingSize => 8

    /**
     * The size of the structure, in bytes. Before calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-process32first">Process32First</a> function, set this member to <c>sizeof(PROCESSENTRY32)</c>. If you do not initialize <b>dwSize</b>, 
     * <b>Process32First</b> fails.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is no longer used and is always set to zero.
     * @type {Integer}
     */
    cntUsage {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The process identifier.
     * @type {Integer}
     */
    th32ProcessID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * This member is no longer used and is always set to zero.
     * @type {Pointer}
     */
    th32DefaultHeapID {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * This member is no longer used and is always set to zero.
     * @type {Integer}
     */
    th32ModuleID {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of execution threads started by the process.
     * @type {Integer}
     */
    cntThreads {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The identifier of the process that created this process (its parent process).
     * @type {Integer}
     */
    th32ParentProcessID {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The base priority of any threads created by this process.
     * @type {Integer}
     */
    pcPriClassBase {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * This member is no longer used and is always set to zero.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The name of the executable file for the process. To retrieve the full path to the executable file, call the <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-module32first">Module32First</a> function and check the <b>szExePath</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-moduleentry32">MODULEENTRY32</a> structure that is returned. However, if the calling process is a 32-bit process, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryfullprocessimagenamea">QueryFullProcessImageName</a> function to retrieve the full path of the executable file for a 64-bit process.
     * @type {String}
     */
    szExeFile {
        get => StrGet(this.ptr + 44, 259, "UTF-8")
        set => StrPut(value, this.ptr + 44, 259, "UTF-8")
    }
}

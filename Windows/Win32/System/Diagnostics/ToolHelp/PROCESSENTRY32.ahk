#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The PROCESSENTRY32 (tlhelp32.h) structure describes an entry from a list of the processes residing in the system address space when a snapshot was taken.
 * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/ns-tlhelp32-processentry32
 * @namespace Windows.Win32.System.Diagnostics.ToolHelp
 * @charset ANSI
 */
export default struct PROCESSENTRY32 {
    #StructPack 8

    /**
     * The size of the structure, in bytes. Before calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-process32first">Process32First</a> function, set this member to <c>sizeof(PROCESSENTRY32)</c>. If you do not initialize <b>dwSize</b>, 
     * <b>Process32First</b> fails.
     */
    dwSize : UInt32

    /**
     * This member is no longer used and is always set to zero.
     */
    cntUsage : UInt32

    /**
     * The process identifier.
     */
    th32ProcessID : UInt32

    /**
     * This member is no longer used and is always set to zero.
     */
    th32DefaultHeapID : IntPtr

    /**
     * This member is no longer used and is always set to zero.
     */
    th32ModuleID : UInt32

    /**
     * The number of execution threads started by the process.
     */
    cntThreads : UInt32

    /**
     * The identifier of the process that created this process (its parent process).
     */
    th32ParentProcessID : UInt32

    /**
     * The base priority of any threads created by this process.
     */
    pcPriClassBase : Int32

    /**
     * This member is no longer used and is always set to zero.
     */
    dwFlags : UInt32

    /**
     * The name of the executable file for the process. To retrieve the full path to the executable file, call the <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-module32first">Module32First</a> function and check the <b>szExePath</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/ns-tlhelp32-moduleentry32">MODULEENTRY32</a> structure that is returned. However, if the calling process is a 32-bit process, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryfullprocessimagenamea">QueryFullProcessImageName</a> function to retrieve the full path of the executable file for a 64-bit process.
     */
    szExeFile : CHAR[260]

}

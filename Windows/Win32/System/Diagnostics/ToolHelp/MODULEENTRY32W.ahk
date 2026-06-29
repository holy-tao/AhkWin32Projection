#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HMODULE.ahk" { HMODULE }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The MODULEENTRY32W (Unicode) structure (tlhelp32.h) describes an entry from a list of the modules belonging to the specified process.
 * @remarks
 * The <b>modBaseAddr</b> and <b>hModule</b> members are valid only in the context of the process specified by <i>th32ProcessID</i>.
 * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/ns-tlhelp32-moduleentry32w
 * @namespace Windows.Win32.System.Diagnostics.ToolHelp
 * @charset Unicode
 */
export default struct MODULEENTRY32W {
    #StructPack 8

    /**
     * The size of the structure, in bytes. Before calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-module32first">Module32First</a> function, set this member to <c>sizeof(MODULEENTRY32)</c>. If you do not initialize <b>dwSize</b>, 
     * <b>Module32First</b> fails.
     */
    dwSize : UInt32

    /**
     * This member is no longer used, and is always set to one.
     */
    th32ModuleID : UInt32

    /**
     * The identifier of the process whose modules are to be examined.
     */
    th32ProcessID : UInt32

    /**
     * The load count of the module, which is not generally meaningful, and usually equal to 0xFFFF.
     */
    GlblcntUsage : UInt32

    /**
     * The load count of the module (same as <i>GlblcntUsage</i>), which is not generally meaningful, and usually equal to 0xFFFF.
     */
    ProccntUsage : UInt32

    /**
     * The base address of the module in the context of the owning process.
     */
    modBaseAddr : IntPtr

    /**
     * The size of the module, in bytes.
     */
    modBaseSize : UInt32

    /**
     * A handle to the module in the context of the owning process.
     */
    hModule : HMODULE

    /**
     * The module name.
     */
    szModule : WCHAR[256]

    /**
     * The module path.
     */
    szExePath : WCHAR[260]

}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The MODULEENTRY32 (tlhelp32.h) structure describes an entry from a list of the modules belonging to the specified process.
 * @remarks
 * The <b>modBaseAddr</b> and <b>hModule</b> members are valid only in the context of the process specified by <i>th32ProcessID</i>.
 * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/ns-tlhelp32-moduleentry32
 * @namespace Windows.Win32.System.Diagnostics.ToolHelp
 * @version v4.0.30319
 * @charset ANSI
 */
class MODULEENTRY32 extends Win32Struct
{
    static sizeof => 568

    static packingSize => 8

    /**
     * The size of the structure, in bytes. Before calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-module32first">Module32First</a> function, set this member to <c>sizeof(MODULEENTRY32)</c>. If you do not initialize <b>dwSize</b>, 
     * <b>Module32First</b> fails.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is no longer used, and is always set to one.
     * @type {Integer}
     */
    th32ModuleID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The identifier of the process whose modules are to be examined.
     * @type {Integer}
     */
    th32ProcessID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The load count of the module, which is not generally meaningful, and usually equal to 0xFFFF.
     * @type {Integer}
     */
    GlblcntUsage {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The load count of the module (same as <i>GlblcntUsage</i>), which is not generally meaningful, and usually equal to 0xFFFF.
     * @type {Integer}
     */
    ProccntUsage {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The base address of the module in the context of the owning process.
     * @type {Pointer<Byte>}
     */
    modBaseAddr {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The size of the module, in bytes.
     * @type {Integer}
     */
    modBaseSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A handle to the module in the context of the owning process.
     * @type {Pointer<Ptr>}
     */
    hModule {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The module name.
     * @type {String}
     */
    szModule {
        get => StrGet(this.ptr + 48, 255, "UTF-8")
        set => StrPut(value, this.ptr + 48, 255, "UTF-8")
    }

    /**
     * The module path.
     * @type {String}
     */
    szExePath {
        get => StrGet(this.ptr + 304, 259, "UTF-8")
        set => StrPut(value, this.ptr + 304, 259, "UTF-8")
    }
}

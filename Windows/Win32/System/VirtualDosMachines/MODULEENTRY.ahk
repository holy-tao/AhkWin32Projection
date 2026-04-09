#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The MODULEENTRY32 (tlhelp32.h) structure describes an entry from a list of the modules belonging to the specified process.
 * @remarks
 * The <b>modBaseAddr</b> and <b>hModule</b> members are valid only in the context of the process specified by <i>th32ProcessID</i>.
 * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/ns-tlhelp32-moduleentry32
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
class MODULEENTRY extends Win32Struct {
    static sizeof => 288

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
     * The module name.
     * @type {String}
     */
    szModule {
        get => StrGet(this.ptr + 4, 9, "UTF-8")
        set => StrPut(value, this.ptr + 4, 9, "UTF-8")
    }

    /**
     * A handle to the module in the context of the owning process.
     * @type {HANDLE}
     */
    hModule {
        get {
            if(!this.HasProp("__hModule"))
                this.__hModule := HANDLE(16, this)
            return this.__hModule
        }
    }

    /**
     * @type {Integer}
     */
    wcUsage {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * The module path.
     * @type {String}
     */
    szExePath {
        get => StrGet(this.ptr + 26, 255, "UTF-8")
        set => StrPut(value, this.ptr + 26, 255, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    wNext {
        get => NumGet(this, 282, "ushort")
        set => NumPut("ushort", value, this, 282)
    }
}

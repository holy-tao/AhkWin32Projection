#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The MONITOR\_INFO\_2 structure identifies a monitor.
 * @see https://learn.microsoft.com/windows/win32/printdocs/monitor-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class MONITOR_INFO_2A extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A pointer to a null-terminated string that is the name of the monitor.
     * @type {PSTR}
     */
    pName{
        get {
            if(!this.HasProp("__pName"))
                this.__pName := PSTR(this.ptr + 0)
            return this.__pName
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the environment for which the monitor was written (for example, Windows NT x86, Windows IA64, Windows x64).
     * @type {PSTR}
     */
    pEnvironment{
        get {
            if(!this.HasProp("__pEnvironment"))
                this.__pEnvironment := PSTR(this.ptr + 8)
            return this.__pEnvironment
        }
    }

    /**
     * A pointer to a null-terminated string that is the name of the monitor DLL.
     * @type {PSTR}
     */
    pDLLName{
        get {
            if(!this.HasProp("__pDLLName"))
                this.__pDLLName := PSTR(this.ptr + 16)
            return this.__pDLLName
        }
    }
}

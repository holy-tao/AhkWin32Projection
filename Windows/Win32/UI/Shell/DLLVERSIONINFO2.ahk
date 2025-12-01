#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DLLVERSIONINFO.ahk

/**
 * Receives DLL-specific version information. It is used with the DllGetVersion function.
 * @remarks
 * Your application must set the <b>cbSize</b> member of the structure pointed to by <b>info1</b> to <b>sizeof(</b><b>DLLVERSIONINFO2</b><b>)</b> before calling <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nc-shlwapi-dllgetversionproc">DllGetVersion</a>. Otherwise, no value will be assigned to the <b>dwFlags</b> or <b>ullVersion</b> member of the <b>DLLVERSIONINFO2</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/ns-shlwapi-dllversioninfo2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DLLVERSIONINFO2 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ns-shlwapi-dllversioninfo">DLLVERSIONINFO</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ns-shlwapi-dllversioninfo">DLLVERSIONINFO</a> structure. This member is included to provide backward compatibility with applications that are not expecting a <b>DLLVERSIONINFO2</b> structure.
     * @type {DLLVERSIONINFO}
     */
    info1{
        get {
            if(!this.HasProp("__info1"))
                this.__info1 := DLLVERSIONINFO(0, this)
            return this.__info1
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>ULONGLONG</b>
     * 
     * A value that contains the version information. It is divided into four 16-bitfields containing the major and minor version numbers, the build number, and the hotfix version, in that order. Use the <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-makedllverull">MAKEDLLVERULL</a> macro to construct this value.
     * @type {Integer}
     */
    ullVersion {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}

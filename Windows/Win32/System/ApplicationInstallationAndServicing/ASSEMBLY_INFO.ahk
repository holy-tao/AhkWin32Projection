#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The ASSEMBLY_INFO structure contains information about an assembly in the side-by-side assembly store. The information is used by the QueryAssemblyInfo method.
 * @see https://learn.microsoft.com/windows/win32/api/winsxs/ns-winsxs-assembly_info
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class ASSEMBLY_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size of the structure in bytes.
     * @type {Integer}
     */
    cbAssemblyInfo {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member can contain the following values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ASSEMBLYINFO_FLAG_INSTALLED"></a><a id="assemblyinfo_flag_installed"></a><dl>
     * <dt><b>ASSEMBLYINFO_FLAG_INSTALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set this flag when using Windows Vista and later or Windows Server 2008 and later with the assembly installed in the side-by-side assembly store.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwAssemblyFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size of the files that comprise the assembly in kilobytes (KB).
     * @type {Integer}
     */
    uliAssemblySizeInKB {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a null-terminated string that contains the path to the manifest file.
     * @type {PWSTR}
     */
    pszCurrentAssemblyPathBuf{
        get {
            if(!this.HasProp("__pszCurrentAssemblyPathBuf"))
                this.__pszCurrentAssemblyPathBuf := PWSTR(this.ptr + 16)
            return this.__pszCurrentAssemblyPathBuf
        }
    }

    /**
     * The number  of characters, including the null terminator, in the string specified by <i>pszCurrentAssemblyPathBuf</i>.
     * @type {Integer}
     */
    cchBuf {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}

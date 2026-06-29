#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The ASSEMBLY_INFO structure contains information about an assembly in the side-by-side assembly store. The information is used by the QueryAssemblyInfo method.
 * @see https://learn.microsoft.com/windows/win32/api/winsxs/ns-winsxs-assembly_info
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct ASSEMBLY_INFO {
    #StructPack 8

    /**
     * The size of the structure in bytes.
     */
    cbAssemblyInfo : UInt32

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
     */
    dwAssemblyFlags : UInt32

    /**
     * The size of the files that comprise the assembly in kilobytes (KB).
     */
    uliAssemblySizeInKB : Int64

    /**
     * A pointer to a null-terminated string that contains the path to the manifest file.
     */
    pszCurrentAssemblyPathBuf : PWSTR

    /**
     * The number  of characters, including the null terminator, in the string specified by <i>pszCurrentAssemblyPathBuf</i>.
     */
    cchBuf : UInt32

}

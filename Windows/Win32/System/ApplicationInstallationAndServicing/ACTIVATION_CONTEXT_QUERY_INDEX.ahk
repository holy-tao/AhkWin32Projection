#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ACTIVATION_CONTEXT_QUERY_INDEX structure is used by QueryActCtxW function.
 * @remarks
 * 
  * Calling the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryactctxw">QueryActCtxW</a> function with the FileInformationInAssemblyOfAssemblyInActivationContext option requires that the <i>pvSubInstance</i> parameter point to an 
  * <b>ACTIVATION_CONTEXT_QUERY_INDEX</b> structure. See the sample for 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-assembly_file_detailed_information">ASSEMBLY_FILE_DETAILED_INFORMATION</a> for an example of its use.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-activation_context_query_index
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class ACTIVATION_CONTEXT_QUERY_INDEX extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * One-based index of the assembly whose file table is to be queried.
     * @type {Integer}
     */
    ulAssemblyIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Zero-based index of the file in the above assembly to be queried.
     * @type {Integer}
     */
    ulFileIndexInAssembly {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

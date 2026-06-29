#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ACTIVATION_CONTEXT_QUERY_INDEX structure is used by QueryActCtxW function.
 * @remarks
 * Calling the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryactctxw">QueryActCtxW</a> function with the FileInformationInAssemblyOfAssemblyInActivationContext option requires that the <i>pvSubInstance</i> parameter point to an 
 * <b>ACTIVATION_CONTEXT_QUERY_INDEX</b> structure. See the sample for 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-assembly_file_detailed_information">ASSEMBLY_FILE_DETAILED_INFORMATION</a> for an example of its use.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-activation_context_query_index
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct ACTIVATION_CONTEXT_QUERY_INDEX {
    #StructPack 4

    /**
     * One-based index of the assembly whose file table is to be queried.
     */
    ulAssemblyIndex : UInt32

    /**
     * Zero-based index of the file in the above assembly to be queried.
     */
    ulFileIndexInAssembly : UInt32

}

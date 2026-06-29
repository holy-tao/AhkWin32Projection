#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\WindowsProgramming\ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA.ahk" { ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA }

/**
 * The ACTCTX_SECTION_KEYED_DATA structure is used by the FindActCtxSectionString and FindActCtxSectionGuid functions to return the activation context information along with either the GUID or 32-bit integer-tagged activation context section.
 * @remarks
 * Callers should initialize the 
 * <b>ACTCTX_SECTION_KEYED_DATA</b> structure as such:
 * 
 * "ACTCTX_SECTION_KEYED_DATA askd = { sizeof(askd) };"
 * 
 * which  initializes all members to zero/null except the size field which is set correctly.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-actctx_section_keyed_data
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct ACTCTX_SECTION_KEYED_DATA {
    #StructPack 8

    /**
     * The size, in bytes, of the activation context keyed data structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Number that indicates the format of the data in the section where the key was found. Clients should verify that the data format version is as expected rather than trying to interpret the values of unfamiliar data formats. This number is only changed when major non-backward-compatible changes to the section data formats need to be made. The current format version is 1.
     */
    ulDataFormatVersion : UInt32

    /**
     * Pointer to the redirection data found associated with the section identifier and key.
     */
    lpData : IntPtr

    /**
     * Number of bytes in the structure referred to by <b>lpData</b>. Note that the data structures  grow over time; do not access members in the instance data that extend beyond <b>ulLength</b>.
     */
    ulLength : UInt32

    /**
     * Returned pointer to a section-specific data structure which is global to the activation context section where the key was found. Its interpretation depends on the section identifier requested.
     */
    lpSectionGlobalData : IntPtr

    /**
     * Number of bytes in the section global data block referred to by <b>lpSectionGlobalData</b>. 
     * 
     * 
     * 
     * 
     * Note that the data structures  grow over time and you may receive an old format activation context data block; do not access members in the section global data that extend beyond <b>ulSectionGlobalDataLength</b>.
     */
    ulSectionGlobalDataLength : UInt32

    /**
     * Pointer to the base of the section where the key was found. Some instance data contains offsets relative to the section base address, in which case this pointer value is used.
     */
    lpSectionBase : IntPtr

    /**
     * Number of bytes for the entire section starting at <b>lpSectionBase</b>. May be used to verify that offset/length pairs, which are specified as relative to the section base are wholly contained in the section.
     */
    ulSectionTotalLength : UInt32

    /**
     * Handle to the activation context where the key was found. First, the active activation context for the thread is searched, followed by the process-default activation context and then the system-compatible-default-activation context. This member indicates which activation context contained the section and key requested. This is only returned if the FIND_ACTCTX_SECTION_KEY_RETURN_HACTCTX flag is passed. 
     * 
     * 
     * 
     * 
     * Note that when this is returned, the caller must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-releaseactctx">ReleaseActCtx</a>() on the activation context handle returned to release system resources when all other references to the activation context have been released.
     */
    hActCtx : HANDLE

    /**
     * Cardinal number of the assembly in the activation context that provided the redirection information found. This value can be presented to <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryactctxw">QueryActCtxW</a> for more information about the contributing assembly.
     */
    ulAssemblyRosterIndex : UInt32

    ulFlags : UInt32

    AssemblyMetadata : ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA

}

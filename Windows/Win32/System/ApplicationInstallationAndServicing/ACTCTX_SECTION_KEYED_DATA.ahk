#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\WindowsProgramming\ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA.ahk

/**
 * The ACTCTX_SECTION_KEYED_DATA structure is used by the FindActCtxSectionString and FindActCtxSectionGuid functions to return the activation context information along with either the GUID or 32-bit integer-tagged activation context section.
 * @remarks
 * 
  * Callers should initialize the 
  * <b>ACTCTX_SECTION_KEYED_DATA</b> structure as such:
  * 
  * "ACTCTX_SECTION_KEYED_DATA askd = { sizeof(askd) };"
  * 
  * which  initializes all members to zero/null except the size field which is set correctly.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-actctx_section_keyed_data
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class ACTCTX_SECTION_KEYED_DATA extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * The size, in bytes, of the activation context keyed data structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number that indicates the format of the data in the section where the key was found. Clients should verify that the data format version is as expected rather than trying to interpret the values of unfamiliar data formats. This number is only changed when major non-backward-compatible changes to the section data formats need to be made. The current format version is 1.
     * @type {Integer}
     */
    ulDataFormatVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to the redirection data found associated with the section identifier and key.
     * @type {Pointer<Void>}
     */
    lpData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Number of bytes in the structure referred to by <b>lpData</b>. Note that the data structures  grow over time; do not access members in the instance data that extend beyond <b>ulLength</b>.
     * @type {Integer}
     */
    ulLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Returned pointer to a section-specific data structure which is global to the activation context section where the key was found. Its interpretation depends on the section identifier requested.
     * @type {Pointer<Void>}
     */
    lpSectionGlobalData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Number of bytes in the section global data block referred to by <b>lpSectionGlobalData</b>. 
     * 
     * 
     * 
     * 
     * Note that the data structures  grow over time and you may receive an old format activation context data block; do not access members in the section global data that extend beyond <b>ulSectionGlobalDataLength</b>.
     * @type {Integer}
     */
    ulSectionGlobalDataLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to the base of the section where the key was found. Some instance data contains offsets relative to the section base address, in which case this pointer value is used.
     * @type {Pointer<Void>}
     */
    lpSectionBase {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Number of bytes for the entire section starting at <b>lpSectionBase</b>. May be used to verify that offset/length pairs, which are specified as relative to the section base are wholly contained in the section.
     * @type {Integer}
     */
    ulSectionTotalLength {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Handle to the activation context where the key was found. First, the active activation context for the thread is searched, followed by the process-default activation context and then the system-compatible-default-activation context. This member indicates which activation context contained the section and key requested. This is only returned if the FIND_ACTCTX_SECTION_KEY_RETURN_HACTCTX flag is passed. 
     * 
     * 
     * 
     * 
     * Note that when this is returned, the caller must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-releaseactctx">ReleaseActCtx</a>() on the activation context handle returned to release system resources when all other references to the activation context have been released.
     * @type {HANDLE}
     */
    hActCtx{
        get {
            if(!this.HasProp("__hActCtx"))
                this.__hActCtx := HANDLE(56, this)
            return this.__hActCtx
        }
    }

    /**
     * Cardinal number of the assembly in the activation context that provided the redirection information found. This value can be presented to <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryactctxw">QueryActCtxW</a> for more information about the contributing assembly.
     * @type {Integer}
     */
    ulAssemblyRosterIndex {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * 
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * 
     * @type {ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA}
     */
    AssemblyMetadata{
        get {
            if(!this.HasProp("__AssemblyMetadata"))
                this.__AssemblyMetadata := ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA(72, this)
            return this.__AssemblyMetadata
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 112
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The TOC_DESCRIPTOR structure holds descriptive information for a table of contents.
 * @remarks
 * You might want to design several different type of tables of contents. In that case, you can distinguish between types by creating a <b>GUID</b> that represents each type. You can identify a table of contents as a particular type by setting the <b>guidType</b> member of a <b>TOC_DESCRIPTOR</b> structure and then passing the structure to <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nf-wmcodecdsp-itoc-setdescriptor">IToc::SetDescriptor</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/ns-wmcodecdsp-toc_descriptor
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct TOC_DESCRIPTOR {
    #StructPack 4

    /**
     * A globally unique identifier (<b>GUID</b>) that identifies an individual table of contents. This identifier has meaning only to the you, the developer. TOC Parser does not inspect or interpret this identifier.
     */
    guidID : Guid

    /**
     * Not used.
     */
    wStreamNumber : UInt16

    /**
     * A globally unique identifier (<b>GUID</b>) that identifies a table of contents as belonging to a particular type. This identifier has meaning only to you, the developer. TOC Parser does not inspect or interpret this identifier. See Remarks.
     */
    guidType : Guid

    /**
     * An integer that identifies the language of a table of contents. This index has meaning only to you, the developer. TOC Parser does not inspect or interpret this index.
     */
    wLanguageIndex : UInt16

}

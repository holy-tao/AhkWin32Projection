#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TOC_DESCRIPTOR structure holds descriptive information for a table of contents.
 * @remarks
 * You might want to design several different type of tables of contents. In that case, you can distinguish between types by creating a <b>GUID</b> that represents each type. You can identify a table of contents as a particular type by setting the <b>guidType</b> member of a <b>TOC_DESCRIPTOR</b> structure and then passing the structure to <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nf-wmcodecdsp-itoc-setdescriptor">IToc::SetDescriptor</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/ns-wmcodecdsp-toc_descriptor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class TOC_DESCRIPTOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A globally unique identifier (<b>GUID</b>) that identifies an individual table of contents. This identifier has meaning only to the you, the developer. TOC Parser does not inspect or interpret this identifier.
     * @type {Pointer<Guid>}
     */
    guidID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    wStreamNumber {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * A globally unique identifier (<b>GUID</b>) that identifies a table of contents as belonging to a particular type. This identifier has meaning only to you, the developer. TOC Parser does not inspect or interpret this identifier. See Remarks.
     * @type {Pointer<Guid>}
     */
    guidType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * An integer that identifies the language of a table of contents. This index has meaning only to you, the developer. TOC Parser does not inspect or interpret this index.
     * @type {Integer}
     */
    wLanguageIndex {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The TOC_DESCRIPTOR structure holds descriptive information for a table of contents.
 * @remarks
 * You might want to design several different type of tables of contents. In that case, you can distinguish between types by creating a <b>GUID</b> that represents each type. You can identify a table of contents as a particular type by setting the <b>guidType</b> member of a <b>TOC_DESCRIPTOR</b> structure and then passing the structure to <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nf-wmcodecdsp-itoc-setdescriptor">IToc::SetDescriptor</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/ns-wmcodecdsp-toc_descriptor
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class TOC_DESCRIPTOR extends Win32Struct {
    static sizeof => 40

    static packingSize => 4

    /**
     * A globally unique identifier (<b>GUID</b>) that identifies an individual table of contents. This identifier has meaning only to the you, the developer. TOC Parser does not inspect or interpret this identifier.
     * @type {Guid}
     */
    guidID {
        get {
            if(!this.HasProp("__guidID"))
                this.__guidID := Guid(0, this)
            return this.__guidID
        }
    }

    /**
     * Not used.
     * @type {Integer}
     */
    wStreamNumber {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * A globally unique identifier (<b>GUID</b>) that identifies a table of contents as belonging to a particular type. This identifier has meaning only to you, the developer. TOC Parser does not inspect or interpret this identifier. See Remarks.
     * @type {Guid}
     */
    guidType {
        get {
            if(!this.HasProp("__guidType"))
                this.__guidType := Guid(20, this)
            return this.__guidType
        }
    }

    /**
     * An integer that identifies the language of a table of contents. This index has meaning only to you, the developer. TOC Parser does not inspect or interpret this index.
     * @type {Integer}
     */
    wLanguageIndex {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }
}

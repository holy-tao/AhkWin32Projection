#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Information about a virtualization instance.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_virtualization_instance_info
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
class PRJ_VIRTUALIZATION_INSTANCE_INFO extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * An ID corresponding to a specific virtualization instance.
     * @type {Guid}
     */
    InstanceID {
        get {
            if(!this.HasProp("__InstanceID"))
                this.__InstanceID := Guid(0, this)
            return this.__InstanceID
        }
    }

    /**
     * The value used for the byteOffset and length parameters of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjwritefiledata">PrjWriteFileData</a>.
     * @type {Integer}
     */
    WriteAlignment {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}

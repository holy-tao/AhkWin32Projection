#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Information about a virtualization instance.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_virtualization_instance_info
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_VIRTUALIZATION_INSTANCE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An ID corresponding to a specific virtualization instance.
     * @type {Pointer<Guid>}
     */
    InstanceID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The value used for the byteOffset and length parameters of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjwritefiledata">PrjWriteFileData</a>.
     * @type {Integer}
     */
    WriteAlignment {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

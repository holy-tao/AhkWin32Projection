#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLS_CONTAINER_INFORMATION.ahk

/**
 * Used by the GetNextLogArchiveExtent function to return information about log archive extents.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_archive_descriptor
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLS_ARCHIVE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 592

    static packingSize => 8

    /**
     * The offset in the container  to the first byte of the archive extent.
     * @type {Integer}
     */
    coffLow {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The offset in the container to the last byte of the archive extent.
     * @type {Integer}
     */
    coffHigh {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The container information structure  that describes the container associated with the archive extent. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/clfs/ns-clfs-cls_container_information">CLFS_CONTAINER_INFORMATION</a>.
     * @type {CLS_CONTAINER_INFORMATION}
     */
    infoContainer{
        get {
            if(!this.HasProp("__infoContainer"))
                this.__infoContainer := CLS_CONTAINER_INFORMATION(16, this)
            return this.__infoContainer
        }
    }
}

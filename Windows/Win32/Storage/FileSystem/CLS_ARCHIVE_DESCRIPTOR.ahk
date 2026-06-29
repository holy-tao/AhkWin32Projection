#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLS_CONTAINER_INFORMATION.ahk" { CLS_CONTAINER_INFORMATION }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Used by the GetNextLogArchiveExtent function to return information about log archive extents.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_archive_descriptor
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLS_ARCHIVE_DESCRIPTOR {
    #StructPack 8

    /**
     * The offset in the container  to the first byte of the archive extent.
     */
    coffLow : Int64

    /**
     * The offset in the container to the last byte of the archive extent.
     */
    coffHigh : Int64

    /**
     * The container information structure  that describes the container associated with the archive extent. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/clfs/ns-clfs-cls_container_information">CLFS_CONTAINER_INFORMATION</a>.
     */
    infoContainer : CLS_CONTAINER_INFORMATION

}

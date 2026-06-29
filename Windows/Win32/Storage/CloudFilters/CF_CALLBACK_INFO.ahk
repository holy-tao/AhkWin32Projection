#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CF_CONNECTION_KEY.ahk" { CF_CONNECTION_KEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CF_PROCESS_INFO.ahk" { CF_PROCESS_INFO }
#Import "..\..\System\CorrelationVector\CORRELATION_VECTOR.ahk" { CORRELATION_VECTOR }

/**
 * Contains common callback information.
 * @remarks
 * A file name is considered normalized if all of the following are true:
 * 
 * - It contains the full directory path for the file, including the volume name, unless the user opened the file by file ID but does not have traverse privilege for the entire path. (For more information, see [FltGetFileNameInformation](/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltgetfilenameinformation).)
 * - The volume name is the volume's non-persistent device object name (for example, "\Device\HarddiskVolume1").
 * - All short names are expanded to the equivalent long names.
 * - Any trailing ":$DATA" or "::$DATA" strings are removed from the stream name.
 * - All mount points are resolved.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_callback_info
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CALLBACK_INFO {
    #StructPack 8

    /**
     * The size of **CF_CALLBACK_INFO**.
     */
    StructSize : UInt32

    /**
     * An opaque handle created by [CfConnectSyncRoot](nf-cfapi-cfconnectsyncroot.md) for a sync root managed by the sync provider. *ConnectionKey* is returned as a convenience so the sync provider doesn't need to manually track it.
     */
    ConnectionKey : CF_CONNECTION_KEY

    /**
     * Points to an opaque blob that the sync provider provides at the sync root connect time. *CallbackContext* is returned as a convenience so the sync provider doesn't need to manually track it.
     */
    CallbackContext : IntPtr

    /**
     * GUID name of the volume on which the placeholder file/directory to be serviced resides. It is in the form: “\\?\Volume{GUID}”.
     */
    VolumeGuidName : PWSTR

    /**
     * DOS drive letter of the volume in the form of "X:" where **X** is the drive letter.
     */
    VolumeDosName : PWSTR

    /**
     * The serial number of the volume.
     */
    VolumeSerialNumber : UInt32

    /**
     * A 64 bit file system maintained, volume-wide unique ID of the sync root under which the placeholder file or directory to be serviced resides.
     */
    SyncRootFileId : Int64

    /**
     * Points to the opaque blob provided by the sync provider at the sync root registration time.
     */
    SyncRootIdentity : IntPtr

    /**
     * The length, in bytes, of the *SyncRootIdentity*.
     */
    SyncRootIdentityLength : UInt32

    /**
     * A 64 bit file system maintained, volume-wide unique ID of the placeholder file or directory to be serviced.
     */
    FileId : Int64

    /**
     * The logical size of the placeholder file to be serviced. It is always `0` if the subject of the callback is a directory.
     */
    FileSize : Int64

    /**
     * Points to the opaque blob that the sync provider provides at the placeholder creation/conversion/update time.
     */
    FileIdentity : IntPtr

    /**
     * The length, in bytes, of *FileIdentity*.
     */
    FileIdentityLength : UInt32

    /**
     * The absolute path of the placeholder file or directory to be serviced on the volume identified by VolumeGuidName/VolumeDosName. It starts from the root directory of the volume. See the [Remarks](#-remarks) section for more details.
     */
    NormalizedPath : PWSTR

    /**
     * An opaque handle to the placeholder file/directory to be serviced. The sync provider must pass it back to the [CfExecute](nf-cfapi-cfexecute.md) call in order to perform the desired operation on the file/directory.
     */
    TransferKey : Int64

    /**
     * A numeric scale given to the sync provider to describe the relative priority of one fetch compared to another fetch, in order to provide the most responsive experience to the user. The values range from `0` (lowest possible priority) to `15` (highest possible priority), but otherwise the values have no specific meaning. The filter may adjust how it chooses priority hints according to conditions. The sync provider is free to use the hint however it chooses.
     */
    PriorityHint : Int8

    /**
     * An optional correlation vector.
     */
    CorrelationVector : CORRELATION_VECTOR.Ptr

    /**
     * Points to a [CF_PROCESS_INFO](ns-cfapi-cf_process_info.md) structure that contains the information about the user process that triggers this callback. It is present only if the sync provider specifies **CF_CONNECT_FLAG_REQUIRE_PROCESS_INFO** at the sync root connect time.
     */
    ProcessInfo : CF_PROCESS_INFO.Ptr

    /**
     * An opaque id that uniquely identifies a cloud file operation on a particular cloud file as indicated by *TransferKey*. Sync providers don’t need to interpret this field. The only requirement on a sync provider is to transfer it as-is to [CF_OPERATION_INFO](ns-cfapi-cf_operation_info.md).
     */
    RequestKey : Int64

}

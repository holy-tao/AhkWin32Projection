#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
 * @version v4.0.30319
 */
class CF_CALLBACK_INFO extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * The size of **CF_CALLBACK_INFO**.
     * @type {Integer}
     */
    StructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An opaque handle created by [CfConnectSyncRoot](nf-cfapi-cfconnectsyncroot.md) for a sync root managed by the sync provider. *ConnectionKey* is returned as a convenience so the sync provider doesn't need to manually track it.
     * @type {Integer}
     */
    ConnectionKey {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Points to an opaque blob that the sync provider provides at the sync root connect time. *CallbackContext* is returned as a convenience so the sync provider doesn't need to manually track it.
     * @type {Pointer<Void>}
     */
    CallbackContext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * GUID name of the volume on which the placeholder file/directory to be serviced resides. It is in the form: “\\?\Volume{GUID}”.
     * @type {PWSTR}
     */
    VolumeGuidName{
        get {
            if(!this.HasProp("__VolumeGuidName"))
                this.__VolumeGuidName := PWSTR(this.ptr + 24)
            return this.__VolumeGuidName
        }
    }

    /**
     * DOS drive letter of the volume in the form of "X:" where **X** is the drive letter.
     * @type {PWSTR}
     */
    VolumeDosName{
        get {
            if(!this.HasProp("__VolumeDosName"))
                this.__VolumeDosName := PWSTR(this.ptr + 32)
            return this.__VolumeDosName
        }
    }

    /**
     * The serial number of the volume.
     * @type {Integer}
     */
    VolumeSerialNumber {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A 64 bit file system maintained, volume-wide unique ID of the sync root under which the placeholder file or directory to be serviced resides.
     * @type {Integer}
     */
    SyncRootFileId {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * Points to the opaque blob provided by the sync provider at the sync root registration time.
     * @type {Pointer<Void>}
     */
    SyncRootIdentity {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The length, in bytes, of the *SyncRootIdentity*.
     * @type {Integer}
     */
    SyncRootIdentityLength {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * A 64 bit file system maintained, volume-wide unique ID of the placeholder file or directory to be serviced.
     * @type {Integer}
     */
    FileId {
        get => NumGet(this, 72, "int64")
        set => NumPut("int64", value, this, 72)
    }

    /**
     * The logical size of the placeholder file to be serviced. It is always `0` if the subject of the callback is a directory.
     * @type {Integer}
     */
    FileSize {
        get => NumGet(this, 80, "int64")
        set => NumPut("int64", value, this, 80)
    }

    /**
     * Points to the opaque blob that the sync provider provides at the placeholder creation/conversion/update time.
     * @type {Pointer<Void>}
     */
    FileIdentity {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * The length, in bytes, of *FileIdentity*.
     * @type {Integer}
     */
    FileIdentityLength {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * The absolute path of the placeholder file or directory to be serviced on the volume identified by VolumeGuidName/VolumeDosName. It starts from the root directory of the volume. See the [Remarks](#-remarks) section for more details.
     * @type {PWSTR}
     */
    NormalizedPath{
        get {
            if(!this.HasProp("__NormalizedPath"))
                this.__NormalizedPath := PWSTR(this.ptr + 104)
            return this.__NormalizedPath
        }
    }

    /**
     * An opaque handle to the placeholder file/directory to be serviced. The sync provider must pass it back to the [CfExecute](nf-cfapi-cfexecute.md) call in order to perform the desired operation on the file/directory.
     * @type {Integer}
     */
    TransferKey {
        get => NumGet(this, 112, "int64")
        set => NumPut("int64", value, this, 112)
    }

    /**
     * A numeric scale given to the sync provider to describe the relative priority of one fetch compared to another fetch, in order to provide the most responsive experience to the user. The values range from `0` (lowest possible priority) to `15` (highest possible priority), but otherwise the values have no specific meaning. The filter may adjust how it chooses priority hints according to conditions. The sync provider is free to use the hint however it chooses.
     * @type {Integer}
     */
    PriorityHint {
        get => NumGet(this, 120, "char")
        set => NumPut("char", value, this, 120)
    }

    /**
     * An optional correlation vector.
     * @type {Pointer<CORRELATION_VECTOR>}
     */
    CorrelationVector {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * Points to a [CF_PROCESS_INFO](ns-cfapi-cf_process_info.md) structure that contains the information about the user process that triggers this callback. It is present only if the sync provider specifies **CF_CONNECT_FLAG_REQUIRE_PROCESS_INFO** at the sync root connect time.
     * @type {Pointer<CF_PROCESS_INFO>}
     */
    ProcessInfo {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * An opaque id that uniquely identifies a cloud file operation on a particular cloud file as indicated by *TransferKey*. Sync providers don’t need to interpret this field. The only requirement on a sync provider is to transfer it as-is to [CF_OPERATION_INFO](ns-cfapi-cf_operation_info.md).
     * @type {Integer}
     */
    RequestKey {
        get => NumGet(this, 144, "int64")
        set => NumPut("int64", value, this, 144)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CF_CONNECTION_KEY.ahk

/**
 * Contains common callback information.
 * @remarks
 * 
  * A file name is considered normalized if all of the following are true:
  * 
  * <ul>
  * <li>It contains the full directory path for the file, including the volume name, unless the user opened the file by file ID but does not have traverse privilege for the entire path. (For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/fltkernel/nf-fltkernel-fltgetfilenameinformation">FltGetFileNameInformation</a>.)
  * </li>
  * <li>The volume name is the volume's non-persistent device object name (for example, "\Device\HarddiskVolume1").
  * </li>
  * <li>All short names are expanded to the equivalent long names.
  * </li>
  * <li>Any trailing ":$DATA" or "::$DATA" strings are removed from the stream name.
  * </li>
  * <li>	All mount points are resolved.
  * </li>
  * </ul>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ns-cfapi-cf_callback_info
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CALLBACK_INFO extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * The size of the structure.
     * @type {Integer}
     */
    StructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An opaque handle created by <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfconnectsyncroot">CfConnectSyncRoot</a> for a sync root managed by the sync provider.
     * @type {CF_CONNECTION_KEY}
     */
    ConnectionKey{
        get {
            if(!this.HasProp("__ConnectionKey"))
                this.__ConnectionKey := CF_CONNECTION_KEY(8, this)
            return this.__ConnectionKey
        }
    }

    /**
     * points to an opaque blob that the sync provider provides at the sync root connect time.
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
    VolumeGuidName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * DOS drive letter of the volume in the form of “X:” where X is the drive letter.
     * @type {PWSTR}
     */
    VolumeDosName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
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
     * A 64 bit file system maintained volume-wide unique ID of the sync root under which the placeholder file/directory to be serviced resides.
     * @type {Integer}
     */
    SyncRootFileId {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * Points to the opaque blob provided by the  sync provider at the sync root registration time.
     * @type {Pointer<Void>}
     */
    SyncRootIdentity {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The length, in bytes, of the <b>SyncRootIdentity</b>.
     * @type {Integer}
     */
    SyncRootIdentityLength {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * A 64 bit file system maintained, volume-wide unique ID of the placeholder file/directory to be serviced.
     * @type {Integer}
     */
    FileId {
        get => NumGet(this, 72, "int64")
        set => NumPut("int64", value, this, 72)
    }

    /**
     * The logical size of the placeholder file to be serviced. It is always 0 if the subject of the callback is a directory.
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
     * The length, in bytes, of <b>FileIdentity</b>.
     * @type {Integer}
     */
    FileIdentityLength {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * The absolute path of the placeholder file/directory to be serviced on the volume identified by VolumeGuidName/VolumeDosName. It starts from the root directory of the volume. See the Remarks section for more details.
     * @type {PWSTR}
     */
    NormalizedPath {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * An opaque handle to the placeholder file/directory to be serviced. The sync provider must pass it back to the <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfexecute">CfExecute</a> call in order to perform the desired operation on the file/directory.
     * @type {Integer}
     */
    TransferKey {
        get => NumGet(this, 112, "int64")
        set => NumPut("int64", value, this, 112)
    }

    /**
     * A numeric scale given to the sync provider to describe the relative priority of one fetch compared to another fetch, in order to provide the most responsive experience to the user.  The values range from 0 (lowest possible priority) to 15 (highest possible priority).
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
     * Points to a structure that contains the information about the user process that triggers this callback.
     * @type {Pointer<CF_PROCESS_INFO>}
     */
    ProcessInfo {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * 
     * @type {Integer}
     */
    RequestKey {
        get => NumGet(this, 144, "int64")
        set => NumPut("int64", value, this, 144)
    }
}

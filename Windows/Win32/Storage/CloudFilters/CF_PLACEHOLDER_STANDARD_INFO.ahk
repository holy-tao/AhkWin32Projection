#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Standard placeholder information.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ns-cfapi-cf_placeholder_standard_info
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_PLACEHOLDER_STANDARD_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Total number of bytes on disk.
     * @type {Integer}
     */
    OnDiskDataSize {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Total number of bytes in sync with the cloud.
     * @type {Integer}
     */
    ValidatedDataSize {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Total number of bytes that have been overwritten/appended locally that are not in sync with the cloud.
     * @type {Integer}
     */
    ModifiedDataSize {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Total number of bytes on disk that are used by all the property blobs.
     * @type {Integer}
     */
    PropertiesSize {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The pin state of the placeholder. See <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfsetpinstate">CfSetPinState</a> for more details.
     * @type {Integer}
     */
    PinState {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The in-sync state of the placeholder. see <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfsetinsyncstate">CfSetInSyncState</a> for more details.
     * @type {Integer}
     */
    InSyncState {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * A 64-bit volume wide non-volatile number that uniquely identifies a file or directory.
     * @type {Integer}
     */
    FileId {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * The file ID of the sync root directory that contains the file whose placeholder information is to be queried.
     * @type {Integer}
     */
    SyncRootFileId {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * Length, in bytes, of the FileIdentity.
     * @type {Integer}
     */
    FileIdentityLength {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * An opaque blob supplied by the sync provider to the platform when the placeholder was created. File identity is provided for all sync provider callbacks.
     * @type {Array<Byte>}
     */
    FileIdentity{
        get {
            if(!this.HasProp("__FileIdentityProxyArray"))
                this.__FileIdentityProxyArray := Win32FixedArray(this.ptr + 60, 1, Primitive, "char")
            return this.__FileIdentityProxyArray
        }
    }
}

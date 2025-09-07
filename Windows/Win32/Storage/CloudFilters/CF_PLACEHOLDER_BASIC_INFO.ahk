#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Basic placeholder information.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_placeholder_basic_info
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_PLACEHOLDER_BASIC_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The [CF_PIN_STATE](ne-cfapi-cf_pin_state.md) of the placeholder, which is used to represent a user’s intent. See [CfSetPinState](nf-cfapi-cfsetpinstate.md) for more details.
     * @type {Integer}
     */
    PinState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The [CF_IN_SYNC_STATE](ne-cfapi-cf_in_sync_state.md) of the placeholder. See [CfSetInSyncState](nf-cfapi-cfsetinsyncstate.md) for more details.
     * @type {Integer}
     */
    InSyncState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A 64-bit volume wide non-volatile number that uniquely identifies a file or directory.
     * @type {Integer}
     */
    FileId {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The file ID of the sync root directory that contains the file whose placeholder information is to be queried.
     * @type {Integer}
     */
    SyncRootFileId {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Length, in bytes, of the *FileIdentity*.
     * @type {Integer}
     */
    FileIdentityLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * An opaque blob supplied by the sync provider to the platform when the placeholder was created. File identity is provided for all sync provider callbacks.
     * @type {Array<Byte>}
     */
    FileIdentity{
        get {
            if(!this.HasProp("__FileIdentityProxyArray"))
                this.__FileIdentityProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__FileIdentityProxyArray
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The details of the sync provider and sync root to be registered.
 * @remarks
 * 
  * <b>SyncRootIdentity</b> and <b>SyncRootIdentityLength</b> are optional members. If not used, set <b>SyncRootIdentity</b> to <b>nullptr</b> and <b>SyncRootIdentityLength</b> to <b>0</b>. <b>FileIdentity</b> and <b>FileIdentityLength</b> are also optional and if not used should be set to <b>nullptr</b> and <b>0</b>, respectively.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ns-cfapi-cf_sync_registration
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_SYNC_REGISTRATION extends Win32Struct
{
    static sizeof => 64

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
     * The name of the sync provider. This is a user friendly string with a maximum length of 255 characters.
     * @type {Pointer<Char>}
     */
    ProviderName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The version of the sync provider. This is a user friendly string with a maximum length of 255 characters.
     * @type {Pointer<Char>}
     */
    ProviderVersion {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The sync root identity used by the provider. This member is optional with a maximum size of 64 KB.
     * @type {Pointer<Void>}
     */
    SyncRootIdentity {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The length of the <b>SyncRootIdentity</b>. This member is optional and is only used if a <b>SyncRootIdentity</b> is provided.
     * @type {Integer}
     */
    SyncRootIdentityLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An optional file identity. This member has a maximum size of 4 KB.
     * @type {Pointer<Void>}
     */
    FileIdentity {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The length of the file identity.
     * @type {Integer}
     */
    FileIdentityLength {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * 
     * @type {Pointer<Guid>}
     */
    ProviderId {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}

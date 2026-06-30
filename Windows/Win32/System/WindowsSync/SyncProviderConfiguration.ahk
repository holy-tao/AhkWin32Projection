#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the information for a synchronization provider configuration.
 * @see https://learn.microsoft.com/windows/win32/api/syncregistration/ns-syncregistration-syncproviderconfiguration
 * @namespace Windows.Win32.System.WindowsSync
 */
class SyncProviderConfiguration extends Win32Struct {
    static sizeof => 76

    static packingSize => 4

    /**
     * The version of the synchronization provider. The constant value <b>SYNC_PROVIDER_CONFIGURATION_VERSION.</b>
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The unique instance ID of the synchronization provider.
     * @type {Guid}
     */
    guidInstanceId {
        get {
            if(!this.HasProp("__guidInstanceId"))
                this.__guidInstanceId := Guid(4, this)
            return this.__guidInstanceId
        }
    }

    /**
     * The COM CLSID of the synchronization provider.
     * @type {Guid}
     */
    clsidProvider {
        get {
            if(!this.HasProp("__clsidProvider"))
                this.__clsidProvider := Guid(20, this)
            return this.__clsidProvider
        }
    }

    /**
     * The instance ID of the configuration UI used to create this synchronization provider, or <b>GUID_NULL</b> if no configuration UI was used.
     * @type {Guid}
     */
    guidConfigUIInstanceId {
        get {
            if(!this.HasProp("__guidConfigUIInstanceId"))
                this.__guidConfigUIInstanceId := Guid(36, this)
            return this.__guidConfigUIInstanceId
        }
    }

    /**
     * The GUID that identifies the content type.
     * @type {Guid}
     */
    guidContentType {
        get {
            if(!this.HasProp("__guidContentType"))
                this.__guidContentType := Guid(52, this)
            return this.__guidContentType
        }
    }

    /**
     * One of the following constants that represent the capabilities of the synchronization provider.
     * 
     * <ul>
     * <li><b>SPC_DEFAULT</b> ((DWORD)0x00000000)</li>
     * </ul>
     * @type {Integer}
     */
    dwCapabilities {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * One of the following constants that represent the architectures supported by the synchronization provider. This value corresponds to the architectures that the synchronization provider CLSID (<b>clsidProvider</b>) is registered for.   These values can be combined, and can be used as bitmasks.
     * 
     * <ul>
     * <li><b>SYNC_32_BIT_SUPPORTED</b> ((DWORD)0x00000001)</li>
     * <li><b>SYNC_64_BIT_SUPPORTED</b> ((DWORD)0x00000002)</li>
     * </ul>
     * @type {Integer}
     */
    dwSupportedArchitecture {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}

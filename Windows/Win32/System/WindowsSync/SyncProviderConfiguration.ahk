#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the information for a synchronization provider configuration.
 * @see https://docs.microsoft.com/windows/win32/api//syncregistration/ns-syncregistration-syncproviderconfiguration
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SyncProviderConfiguration extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The xersion of the synchronization provider. The constant value <b>SYNC_PROVIDER_CONFIGURATION_VERSION.</b>
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The unique instance ID of the synchronization provider.
     * @type {Pointer<Guid>}
     */
    guidInstanceId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The COM CLSID of the synchronization provider.
     * @type {Pointer<Guid>}
     */
    clsidProvider {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The instance ID of the configuration UI  used to create this synchronization provider, or <b>GUID_NULL</b> if no configuration UI was used.
     * @type {Pointer<Guid>}
     */
    guidConfigUIInstanceId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The GUID that identifies the content type.
     * @type {Pointer<Guid>}
     */
    guidContentType {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
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
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * One of the following constants that represent the architectures supported by the synchronization provider. This value corresponds to the architectures that the synchronization provider CLSID (<b>clsidProvider</b>) is registered for.   These values can be combined, and can be used as bitmasks.
     * 
     * <ul>
     * <li><b>SYNC_32_BIT_SUPPORTED</b> ((DWORD)0x00000001)</li>
     * <li><b>SYNC_64_BIT_SUPPORTED</b>  ((DWORD)0x00000002)</li>
     * </ul>
     * @type {Integer}
     */
    dwSupportedArchitecture {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}

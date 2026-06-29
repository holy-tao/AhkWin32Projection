#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Represents the information for a synchronization provider configuration.
 * @see https://learn.microsoft.com/windows/win32/api/syncregistration/ns-syncregistration-syncproviderconfiguration
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct SyncProviderConfiguration {
    #StructPack 4

    /**
     * The version of the synchronization provider. The constant value <b>SYNC_PROVIDER_CONFIGURATION_VERSION.</b>
     */
    dwVersion : UInt32

    /**
     * The unique instance ID of the synchronization provider.
     */
    guidInstanceId : Guid

    /**
     * The COM CLSID of the synchronization provider.
     */
    clsidProvider : Guid

    /**
     * The instance ID of the configuration UI used to create this synchronization provider, or <b>GUID_NULL</b> if no configuration UI was used.
     */
    guidConfigUIInstanceId : Guid

    /**
     * The GUID that identifies the content type.
     */
    guidContentType : Guid

    /**
     * One of the following constants that represent the capabilities of the synchronization provider.
     * 
     * <ul>
     * <li><b>SPC_DEFAULT</b> ((DWORD)0x00000000)</li>
     * </ul>
     */
    dwCapabilities : UInt32

    /**
     * One of the following constants that represent the architectures supported by the synchronization provider. This value corresponds to the architectures that the synchronization provider CLSID (<b>clsidProvider</b>) is registered for.   These values can be combined, and can be used as bitmasks.
     * 
     * <ul>
     * <li><b>SYNC_32_BIT_SUPPORTED</b> ((DWORD)0x00000001)</li>
     * <li><b>SYNC_64_BIT_SUPPORTED</b> ((DWORD)0x00000002)</li>
     * </ul>
     */
    dwSupportedArchitecture : UInt32

}

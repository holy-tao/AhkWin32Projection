#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Represents the information for a synchronization provider configuration UI.
 * @see https://learn.microsoft.com/windows/win32/api/syncregistration/ns-syncregistration-syncproviderconfiguiconfiguration
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct SyncProviderConfigUIConfiguration {
    #StructPack 4

    /**
     * The version of the configuration UI.
     */
    dwVersion : UInt32

    /**
     * The unique instance ID of the configuration UI.
     */
    guidInstanceId : Guid

    /**
     * The COM CLSID of the configuration UI.
     */
    clsidConfigUI : Guid

    /**
     * The GUID that identifies the content type supported by the synchronization provider that is created by the configuration UI.
     */
    guidContentType : Guid

    /**
     * One of the following constants that represent the capabilities of the synchronization provider configuration UI. These values are masks that can be combined.
     * 
     * <ul>
     * <li><b>SCC_DEFAULT</b> ((DWORD)0x00000000) The configuration UI supports the default capabilities of creating and modifying a synchronization provider with a UI displayed.
     * 
     * </li>
     * <li><b>SCC_CAN_CREATE_WITHOUT_UI</b>  ((DWORD)0x00000001) The configuration UI creates providers without displaying the UI.  This value is not compatible with <b>SCC_CREATE_NOT_SUPPORTED</b>.
     * 
     * </li>
     * <li><b>SCC_CAN_MODIFY_WITHOUT_UI</b>  ((DWORD)0x00000002) The configuration UI modifies providers without displaying the UI.  This value is not compatible with <b>SCC_MODIFY_NOT_SUPPORTED</b>.
     * 
     * </li>
     * <li><b>SCC_CREATE_NOT_SUPPORTED</b>  ((DWORD)0x00000004) The configuration UI cannot create new configured providers.  This value is not compatible with <b>SCC_CAN_CREATE_WITHOUT_UI</b>.
     * 
     * </li>
     * <li><b>SCC_MODIFY_NOT_SUPPORTED</b>  ((DWORD)0x00000008) The configuration UI cannot modify providers.  This value is not compatible with <b>SCC_CAN_MODIFY_WITHOUT_UI</b>.
     * 
     * </li>
     * </ul>
     */
    dwCapabilities : UInt32

    /**
     * One of the following constants that represent the architectures supported by the synchronization provider configuration UI. This value corresponds to the architectures that the synchronization provider configuration UI CLSID (<b>clsidConfigUI</b>) is registered for.   These values can be combined, and can be used as bitmasks.
     * 
     * <ul>
     * <li><b>SYNC_32_BIT_SUPPORTED</b> ((DWORD)0x00000001)</li>
     * <li><b>SYNC_64_BIT_SUPPORTED</b>  ((DWORD)0x00000002)</li>
     * </ul>
     */
    dwSupportedArchitecture : UInt32

    /**
     * Reserved for future use. At this time, the value should always be <b>FALSE</b>.
     */
    fIsGlobal : BOOL

}

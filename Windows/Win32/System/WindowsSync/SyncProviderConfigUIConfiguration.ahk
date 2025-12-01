#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the information for a synchronization provider configuration UI.
 * @see https://learn.microsoft.com/windows/win32/api/syncregistration/ns-syncregistration-syncproviderconfiguiconfiguration
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class SyncProviderConfigUIConfiguration extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The version of the configuration UI.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The unique instance ID of the configuration UI.
     * @type {Pointer<Guid>}
     */
    guidInstanceId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The COM CLSID of the configuration UI.
     * @type {Pointer<Guid>}
     */
    clsidConfigUI {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The GUID that identifies the content type supported by the synchronization provider that is created by the configuration UI.
     * @type {Pointer<Guid>}
     */
    guidContentType {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

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
     * @type {Integer}
     */
    dwCapabilities {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * One of the following constants that represent the architectures supported by the synchronization provider configuration UI. This value corresponds to the architectures that the synchronization provider configuration UI CLSID (<b>clsidConfigUI</b>) is registered for.   These values can be combined, and can be used as bitmasks.
     * 
     * <ul>
     * <li><b>SYNC_32_BIT_SUPPORTED</b> ((DWORD)0x00000001)</li>
     * <li><b>SYNC_64_BIT_SUPPORTED</b>  ((DWORD)0x00000002)</li>
     * </ul>
     * @type {Integer}
     */
    dwSupportedArchitecture {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Reserved for future use. At this time, the value should always be <b>FALSE</b>.
     * @type {BOOL}
     */
    fIsGlobal {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}

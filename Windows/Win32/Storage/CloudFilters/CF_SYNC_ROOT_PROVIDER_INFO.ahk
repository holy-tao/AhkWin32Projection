#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Sync root provider information.
 * @remarks
 * 
  * <b>CF_MAX_PROVIDER_NAME_LENGTH</b> and <b>CF_MAX_PROVIDER_VERSION_LENGTH</b> are set to 255.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ns-cfapi-cf_sync_root_provider_info
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_SYNC_ROOT_PROVIDER_INFO extends Win32Struct
{
    static sizeof => 1028

    static packingSize => 4

    /**
     * Status of the sync root provider.
     * @type {Integer}
     */
    ProviderStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Name of the sync root provider.
     * @type {String}
     */
    ProviderName {
        get => StrGet(this.ptr + 4, 255, "UTF-16")
        set => StrPut(value, this.ptr + 4, 255, "UTF-16")
    }

    /**
     * Version of the sync root provider.
     * @type {String}
     */
    ProviderVersion {
        get => StrGet(this.ptr + 516, 255, "UTF-16")
        set => StrPut(value, this.ptr + 516, 255, "UTF-16")
    }
}

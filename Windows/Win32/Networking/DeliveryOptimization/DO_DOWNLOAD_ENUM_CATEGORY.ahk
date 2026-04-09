#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DODownloadProperty.ahk

/**
 * Used by **IDOManager::EnumDownloads** to filter the downloads enumeration by the specific property's value.
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/ns-deliveryoptimization-do_download_enum_category
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 */
class DO_DOWNLOAD_ENUM_CATEGORY extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * The property name to be used for the download enumeration. These properties are supported for enumeration purposes.
     * 
     * - **DODownloadProperty_Id**
     * - **DODownloadProperty_Uri**
     * - **DODownloadProperty_ContentId**
     * - **DODownloadProperty_DisplayName**
     * - **DODownloadProperty_LocalPath**
     * @type {DODownloadProperty}
     */
    Property {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The property's value.
     * @type {PWSTR}
     */
    Value {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DODownloadProperty.ahk" { DODownloadProperty }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used by **IDOManager::EnumDownloads** to filter the downloads enumeration by the specific property's value.
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/ns-deliveryoptimization-do_download_enum_category
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 */
export default struct DO_DOWNLOAD_ENUM_CATEGORY {
    #StructPack 8

    /**
     * The property name to be used for the download enumeration. These properties are supported for enumeration purposes.
     * 
     * - **DODownloadProperty_Id**
     * - **DODownloadProperty_Uri**
     * - **DODownloadProperty_ContentId**
     * - **DODownloadProperty_DisplayName**
     * - **DODownloadProperty_LocalPath**
     */
    Property : DODownloadProperty

    /**
     * The property's value.
     */
    Value : PWSTR

}

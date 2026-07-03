#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_SERVICE_METADATA.ahk" { WSD_SERVICE_METADATA }
#Import ".\WSD_SERVICE_METADATA_LIST.ahk" { WSD_SERVICE_METADATA_LIST }

/**
 * Provides metadata for all services hosted by a device.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_host_metadata
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_HOST_METADATA {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_service_metadata">WSD_SERVICE_METADATA</a> structure that describes the parent service or the device.
     */
    Host : WSD_SERVICE_METADATA.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_service_metadata_list">WSD_SERVICE_METADATA_LIST</a> structure that represents the singly linked list of services hosted by the parent service.
     */
    Hosted : WSD_SERVICE_METADATA_LIST.Ptr

}

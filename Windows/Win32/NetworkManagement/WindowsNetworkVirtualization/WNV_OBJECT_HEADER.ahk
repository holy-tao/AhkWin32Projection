#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the major version, minor version, and buffer size of the WNV_NOTIFICATION_PARAM structure that is passed to the WnvRequestNotification function.
 * @remarks
 * There is currently only one version number: "1.0".
 * @see https://learn.microsoft.com/windows/win32/api/wnvapi/ns-wnvapi-wnv_object_header
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 */
export default struct WNV_OBJECT_HEADER {
    #StructPack 4

    /**
     * Type: <b>UCHAR</b>
     * 
     * The major version number. This value must be <b>WNV_API_MAJOR_VERSION_1</b>.
     */
    MajorVersion : Int8

    /**
     * Type: <b>UCHAR</b>
     * 
     * The minor version number. This value must be <b>WNV_API_MINOR_VERSION_0</b>.
     */
    MinorVersion : Int8

    /**
     * Type: <b>ULONG</b>
     * 
     * The size of the <b>Buffer</b> field in the <a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ns-wnvapi-wnv_notification_param">WNV_NOTIFICATION_PARAM</a> structure that is passed to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wnvapi/nf-wnvapi-wnvrequestnotification">WnvRequestNotification</a> function.
     */
    Size : UInt32

}

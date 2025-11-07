#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the major version, minor version, and buffer size of the WNV_NOTIFICATION_PARAM structure that is passed to the WnvRequestNotification function.
 * @remarks
 * 
 * There is currently only one version number: "1.0".
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wnvapi/ns-wnvapi-wnv_object_header
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 * @version v4.0.30319
 */
class WNV_OBJECT_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>UCHAR</b>
     * 
     * The major version number. This value must be <b>WNV_API_MAJOR_VERSION_1</b>.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Type: <b>UCHAR</b>
     * 
     * The minor version number. This value must be <b>WNV_API_MINOR_VERSION_0</b>.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The size of the <b>Buffer</b> field in the <a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ns-wnvapi-wnv_notification_param">WNV_NOTIFICATION_PARAM</a> structure that is passed to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wnvapi/nf-wnvapi-wnvrequestnotification">WnvRequestNotification</a> function.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

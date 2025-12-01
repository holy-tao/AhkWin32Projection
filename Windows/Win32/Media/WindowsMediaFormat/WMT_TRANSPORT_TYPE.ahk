#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMT_TRANSPORT_TYPE enumeration type defines the transport types supported by this SDK.
 * @remarks
 * This enumeration indicates the type of data communication protocol (reliable or unreliable).
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_transport_type
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_TRANSPORT_TYPE extends Win32Enum{

    /**
     * The transport type is not reliable.
     * @type {Integer (Int32)}
     */
    static WMT_Transport_Type_Unreliable => 0

    /**
     * The transport type is reliable.
     * @type {Integer (Int32)}
     */
    static WMT_Transport_Type_Reliable => 1
}

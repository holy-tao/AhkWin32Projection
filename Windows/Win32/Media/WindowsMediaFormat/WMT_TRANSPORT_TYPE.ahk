#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMT_TRANSPORT_TYPE enumeration type defines the transport types supported by this SDK.
 * @remarks
 * This enumeration indicates the type of data communication protocol (reliable or unreliable).
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_transport_type
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_TRANSPORT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

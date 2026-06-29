#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_CONTEXT_TYPE enumerated type specifies the represented context type.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_context_type
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_CONTEXT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Context has not yet provisioned for this ID.
     * @type {Integer (Int32)}
     */
    static MBN_CONTEXT_TYPE_NONE => 0

    /**
     * Context represents a connection to the internet.
     * @type {Integer (Int32)}
     */
    static MBN_CONTEXT_TYPE_INTERNET => 1

    /**
     * Context represents a connection to a VPN or corporate network.
     * @type {Integer (Int32)}
     */
    static MBN_CONTEXT_TYPE_VPN => 2

    /**
     * Context represents a connection to VoIP service.
     * @type {Integer (Int32)}
     */
    static MBN_CONTEXT_TYPE_VOICE => 3

    /**
     * Context represents a connection to a video share service.
     * @type {Integer (Int32)}
     */
    static MBN_CONTEXT_TYPE_VIDEO_SHARE => 4

    /**
     * Context represents a connection to a custom service.
     * @type {Integer (Int32)}
     */
    static MBN_CONTEXT_TYPE_CUSTOM => 5

    /**
     * Windows 8 or later: Context represents a purchase connection such as a walled garden, hot-lining, or captive portal.
     * @type {Integer (Int32)}
     */
    static MBN_CONTEXT_TYPE_PURCHASE => 6
}

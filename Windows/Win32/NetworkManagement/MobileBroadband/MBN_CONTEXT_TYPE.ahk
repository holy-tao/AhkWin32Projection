#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_CONTEXT_TYPE enumerated type specifies the represented context type.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_context_type
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_CONTEXT_TYPE extends Win32Enum{

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

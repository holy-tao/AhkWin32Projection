#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_CONTEXT_TYPE enumerated type specifies the represented context type.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_context_type
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_CONTEXT_TYPE extends Win32Enum {

    /**
     * Context has not yet provisioned for this ID.
     * Native name: MBN_CONTEXT_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Context represents a connection to the internet.
     * Native name: MBN_CONTEXT_TYPE_INTERNET
     * @type {Integer (Int32)}
     */
    static INTERNET => 1

    /**
     * Context represents a connection to a VPN or corporate network.
     * Native name: MBN_CONTEXT_TYPE_VPN
     * @type {Integer (Int32)}
     */
    static VPN => 2

    /**
     * Context represents a connection to VoIP service.
     * Native name: MBN_CONTEXT_TYPE_VOICE
     * @type {Integer (Int32)}
     */
    static VOICE => 3

    /**
     * Context represents a connection to a video share service.
     * Native name: MBN_CONTEXT_TYPE_VIDEO_SHARE
     * @type {Integer (Int32)}
     */
    static VIDEO_SHARE => 4

    /**
     * Context represents a connection to a custom service.
     * Native name: MBN_CONTEXT_TYPE_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => 5

    /**
     * Windows 8 or later: Context represents a purchase connection such as a walled garden, hot-lining, or captive portal.
     * Native name: MBN_CONTEXT_TYPE_PURCHASE
     * @type {Integer (Int32)}
     */
    static PURCHASE => 6
}

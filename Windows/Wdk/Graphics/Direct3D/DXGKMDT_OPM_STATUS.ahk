#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_STATUS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_STATUS_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_STATUS_LINK_LOST => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_STATUS_RENEGOTIATION_REQUIRED => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_STATUS_TAMPERING_DETECTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_STATUS_REVOKED_HDCP_DEVICE_ATTACHED => 8
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_STATUS extends Win32Enum {

    /**
     * Native name: DXGKMDT_OPM_STATUS_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Native name: DXGKMDT_OPM_STATUS_LINK_LOST
     * @type {Integer (Int32)}
     */
    static LINK_LOST => 1

    /**
     * Native name: DXGKMDT_OPM_STATUS_RENEGOTIATION_REQUIRED
     * @type {Integer (Int32)}
     */
    static RENEGOTIATION_REQUIRED => 2

    /**
     * Native name: DXGKMDT_OPM_STATUS_TAMPERING_DETECTED
     * @type {Integer (Int32)}
     */
    static TAMPERING_DETECTED => 4

    /**
     * Native name: DXGKMDT_OPM_STATUS_REVOKED_HDCP_DEVICE_ATTACHED
     * @type {Integer (Int32)}
     */
    static REVOKED_HDCP_DEVICE_ATTACHED => 8
}

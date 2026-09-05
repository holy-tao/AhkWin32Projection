#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_CERTIFICATE_TYPE extends Win32Enum {

    /**
     * Native name: DXGKMDT_OPM_CERTIFICATE
     * @type {Integer (Int32)}
     */
    static OPM_CERTIFICATE => 0

    /**
     * Native name: DXGKMDT_COPP_CERTIFICATE
     * @type {Integer (Int32)}
     */
    static COPP_CERTIFICATE => 1

    /**
     * Native name: DXGKMDT_UAB_CERTIFICATE
     * @type {Integer (Int32)}
     */
    static UAB_CERTIFICATE => 2

    /**
     * Native name: DXGKMDT_INDIRECT_DISPLAY_CERTIFICATE
     * @type {Integer (Int32)}
     */
    static INDIRECT_DISPLAY_CERTIFICATE => 3
}

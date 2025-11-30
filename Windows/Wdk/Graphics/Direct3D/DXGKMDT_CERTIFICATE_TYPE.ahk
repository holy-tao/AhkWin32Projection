#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_CERTIFICATE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_CERTIFICATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_COPP_CERTIFICATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_UAB_CERTIFICATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_INDIRECT_DISPLAY_CERTIFICATE => 3
}

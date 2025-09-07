#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DXVA2_DestinationFlags{

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestinationFlag_Background_Changed => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestinationFlag_TargetRect_Changed => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestinationFlag_ColorData_Changed => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestinationFlag_Alpha_Changed => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestinationFlag_RFF => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestinationFlag_TFF => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestinationFlag_RFF_TFF_Present => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_DestinationFlagMask => -65521
}

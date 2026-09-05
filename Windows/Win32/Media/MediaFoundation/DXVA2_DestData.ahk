#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA2_DestData extends Win32Enum {

    /**
     * Native name: DXVA2_DestData_RFF
     * @type {Integer (Int32)}
     */
    static RFF => 1

    /**
     * Native name: DXVA2_DestData_TFF
     * @type {Integer (Int32)}
     */
    static TFF => 2

    /**
     * Native name: DXVA2_DestData_RFF_TFF_Present
     * @type {Integer (Int32)}
     */
    static RFF_TFF_Present => 4

    /**
     * Native name: DXVA2_DestData_Mask
     * @type {Integer (Int32)}
     */
    static Mask => 65535
}

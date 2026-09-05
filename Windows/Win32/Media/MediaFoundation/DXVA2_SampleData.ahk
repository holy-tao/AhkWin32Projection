#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA2_SampleData extends Win32Enum {

    /**
     * Native name: DXVA2_SampleData_RFF
     * @type {Integer (Int32)}
     */
    static RFF => 1

    /**
     * Native name: DXVA2_SampleData_TFF
     * @type {Integer (Int32)}
     */
    static TFF => 2

    /**
     * Native name: DXVA2_SampleData_RFF_TFF_Present
     * @type {Integer (Int32)}
     */
    static RFF_TFF_Present => 4

    /**
     * Native name: DXVA2_SampleData_Mask
     * @type {Integer (Int32)}
     */
    static Mask => 65535
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_SampleData extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleData_RFF => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleData_TFF => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleData_RFF_TFF_Present => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleData_Mask => 65535
}

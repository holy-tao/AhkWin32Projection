#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_PROCESSOR_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorX86 => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorMips => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorAlpha => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorPpc => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorAmd64 => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorIA64 => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorArm => 6

    /**
     * @type {Integer (Int32)}
     */
    static NdisProcessorArm64 => 7
}

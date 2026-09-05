#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_PROCESSOR_TYPE extends Win32Enum {

    /**
     * Native name: NdisProcessorX86
     * @type {Integer (Int32)}
     */
    static ProcessorX86 => 0

    /**
     * Native name: NdisProcessorMips
     * @type {Integer (Int32)}
     */
    static Mips => 1

    /**
     * Native name: NdisProcessorAlpha
     * @type {Integer (Int32)}
     */
    static Alpha => 2

    /**
     * Native name: NdisProcessorPpc
     * @type {Integer (Int32)}
     */
    static Ppc => 3

    /**
     * Native name: NdisProcessorAmd64
     * @type {Integer (Int32)}
     */
    static Amd64 => 4

    /**
     * Native name: NdisProcessorIA64
     * @type {Integer (Int32)}
     */
    static ProcessorIA64 => 5

    /**
     * Native name: NdisProcessorArm
     * @type {Integer (Int32)}
     */
    static Arm => 6

    /**
     * Native name: NdisProcessorArm64
     * @type {Integer (Int32)}
     */
    static Arm64 => 7
}

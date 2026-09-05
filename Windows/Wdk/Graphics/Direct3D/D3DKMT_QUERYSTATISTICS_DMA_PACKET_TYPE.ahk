#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_QUERYSTATISTICS_DMA_PACKET_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_ClientRenderBuffer
     * @type {Integer (Int32)}
     */
    static ClientRenderBuffer => 0

    /**
     * Native name: D3DKMT_ClientPagingBuffer
     * @type {Integer (Int32)}
     */
    static ClientPagingBuffer => 1

    /**
     * Native name: D3DKMT_SystemPagingBuffer
     * @type {Integer (Int32)}
     */
    static SystemPagingBuffer => 2

    /**
     * Native name: D3DKMT_SystemPreemptionBuffer
     * @type {Integer (Int32)}
     */
    static SystemPreemptionBuffer => 3

    /**
     * Native name: D3DKMT_DmaPacketTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 4
}

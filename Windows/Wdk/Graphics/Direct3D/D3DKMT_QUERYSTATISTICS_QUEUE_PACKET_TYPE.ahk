#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_QUERYSTATISTICS_QUEUE_PACKET_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_RenderCommandBuffer
     * @type {Integer (Int32)}
     */
    static RenderCommandBuffer => 0

    /**
     * Native name: D3DKMT_DeferredCommandBuffer
     * @type {Integer (Int32)}
     */
    static DeferredCommandBuffer => 1

    /**
     * Native name: D3DKMT_SystemCommandBuffer
     * @type {Integer (Int32)}
     */
    static SystemCommandBuffer => 2

    /**
     * Native name: D3DKMT_MmIoFlipCommandBuffer
     * @type {Integer (Int32)}
     */
    static MmIoFlipCommandBuffer => 3

    /**
     * Native name: D3DKMT_WaitCommandBuffer
     * @type {Integer (Int32)}
     */
    static WaitCommandBuffer => 4

    /**
     * Native name: D3DKMT_SignalCommandBuffer
     * @type {Integer (Int32)}
     */
    static SignalCommandBuffer => 5

    /**
     * Native name: D3DKMT_DeviceCommandBuffer
     * @type {Integer (Int32)}
     */
    static DeviceCommandBuffer => 6

    /**
     * Native name: D3DKMT_SoftwareCommandBuffer
     * @type {Integer (Int32)}
     */
    static SoftwareCommandBuffer => 7

    /**
     * Native name: D3DKMT_QueuePacketTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 8
}

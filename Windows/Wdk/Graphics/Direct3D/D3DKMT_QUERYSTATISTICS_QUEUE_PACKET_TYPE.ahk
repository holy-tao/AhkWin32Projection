#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERYSTATISTICS_QUEUE_PACKET_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_RenderCommandBuffer => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DeferredCommandBuffer => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_SystemCommandBuffer => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MmIoFlipCommandBuffer => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_WaitCommandBuffer => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_SignalCommandBuffer => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DeviceCommandBuffer => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_SoftwareCommandBuffer => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_QueuePacketTypeMax => 8
}

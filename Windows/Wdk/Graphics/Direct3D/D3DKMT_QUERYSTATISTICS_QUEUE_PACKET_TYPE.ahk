#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_QUEUE_PACKET_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

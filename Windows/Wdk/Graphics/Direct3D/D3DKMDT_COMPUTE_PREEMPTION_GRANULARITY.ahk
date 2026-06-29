#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_COMPUTE_PREEMPTION_GRANULARITY {
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
    static D3DKMDT_COMPUTE_PREEMPTION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_COMPUTE_PREEMPTION_DMA_BUFFER_BOUNDARY => 100

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_COMPUTE_PREEMPTION_DISPATCH_BOUNDARY => 200

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_COMPUTE_PREEMPTION_THREAD_GROUP_BOUNDARY => 300

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_COMPUTE_PREEMPTION_THREAD_BOUNDARY => 400

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_COMPUTE_PREEMPTION_SHADER_BOUNDARY => 500
}

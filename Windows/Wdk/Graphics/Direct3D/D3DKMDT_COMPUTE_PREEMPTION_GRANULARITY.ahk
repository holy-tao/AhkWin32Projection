#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_COMPUTE_PREEMPTION_GRANULARITY extends Win32Enum {

    /**
     * Native name: D3DKMDT_COMPUTE_PREEMPTION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: D3DKMDT_COMPUTE_PREEMPTION_DMA_BUFFER_BOUNDARY
     * @type {Integer (Int32)}
     */
    static DMA_BUFFER_BOUNDARY => 100

    /**
     * Native name: D3DKMDT_COMPUTE_PREEMPTION_DISPATCH_BOUNDARY
     * @type {Integer (Int32)}
     */
    static DISPATCH_BOUNDARY => 200

    /**
     * Native name: D3DKMDT_COMPUTE_PREEMPTION_THREAD_GROUP_BOUNDARY
     * @type {Integer (Int32)}
     */
    static THREAD_GROUP_BOUNDARY => 300

    /**
     * Native name: D3DKMDT_COMPUTE_PREEMPTION_THREAD_BOUNDARY
     * @type {Integer (Int32)}
     */
    static THREAD_BOUNDARY => 400

    /**
     * Native name: D3DKMDT_COMPUTE_PREEMPTION_SHADER_BOUNDARY
     * @type {Integer (Int32)}
     */
    static SHADER_BOUNDARY => 500
}

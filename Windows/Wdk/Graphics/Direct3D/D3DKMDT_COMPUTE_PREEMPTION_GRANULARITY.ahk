#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_COMPUTE_PREEMPTION_GRANULARITY extends Win32Enum{

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

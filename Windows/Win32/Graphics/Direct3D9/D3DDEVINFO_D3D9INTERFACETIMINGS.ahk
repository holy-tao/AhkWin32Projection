#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Percent of time processing data in the driver. These statistics may help identify cases when the driver is waiting for other resources.
 * @remarks
 * These metrics help identify when a driver is waiting and what it is waiting for. High percentages are not necessarily a problem.
 * 
 * These system-global metrics may or may not be implemented. Depending on the specific hardware, these metrics may not support multiple queries simultaneously.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddevinfo-d3d9interfacetimings
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DDEVINFO_D3D9INTERFACETIMINGS {
    #StructPack 4

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percentage of time the driver spent waiting for the GPU to finish using a locked resource (and [D3DLOCK\_DONOTWAIT](d3dlock.md) wasn't specified).
     */
    WaitingForGPUToUseApplicationResourceTimePercent : Float32

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percentage of time the driver spent waiting for the GPU to finish processing some commands before the driver could send more. This indicates the driver has run out of room to send commands to the GPU.
     */
    WaitingForGPUToAcceptMoreCommandsTimePercent : Float32

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percentage of time the driver spent waiting for the GPU latency to reduce to less than three rendering frames.
     * 
     * If an application is GPU-limited, the driver must stall the CPU until the GPU gets within three frames. This prevents an application from queuing up many seconds' worth of rendering calls which may dramatically increase the latency between when the user inputs new data and when the user sees the results of that input. In general, the driver can track the number of times [**Present**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-present) is called to prevent queuing up more than three frames of rendering work.
     */
    WaitingForGPUToStayWithinLatencyTimePercent : Float32

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percentage of time the driver spent waiting for a resource that cannot be pipelined (that is operated in parallel). An application may want to avoid using a non-pipelined resource for performance reasons.
     */
    WaitingForGPUExclusiveResourceTimePercent : Float32

    /**
     * Type: **[**FLOAT**](../winprog/windows-data-types.md)**
     * 
     * 
     * Percentage of time the driver spent waiting for other GPU processing.
     */
    WaitingForGPUOtherTimePercent : Float32

}

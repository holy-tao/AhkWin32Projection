#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the granularity at which the graphics processing unit (GPU) can be preempted from performing its current compute task.
 * @remarks
 * You call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiadapter2-getdesc2">IDXGIAdapter2::GetDesc2</a> method to retrieve the granularity level at which the GPU can be preempted from performing its current compute task. The operating system specifies the compute granularity level in the  <b>ComputePreemptionGranularity</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_adapter_desc2">DXGI_ADAPTER_DESC2</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/ne-dxgi1_2-dxgi_compute_preemption_granularity
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_COMPUTE_PREEMPTION_GRANULARITY extends Win32Enum{

    /**
     * Indicates the preemption granularity as a compute packet.
     * @type {Integer (Int32)}
     */
    static DXGI_COMPUTE_PREEMPTION_DMA_BUFFER_BOUNDARY => 0

    /**
     * Indicates the preemption granularity as a dispatch (for example, a call to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dispatch">ID3D11DeviceContext::Dispatch</a> method). A dispatch is a part of a compute packet.
     * @type {Integer (Int32)}
     */
    static DXGI_COMPUTE_PREEMPTION_DISPATCH_BOUNDARY => 1

    /**
     * Indicates the preemption granularity as a thread group. A thread group is a part of a dispatch.
     * @type {Integer (Int32)}
     */
    static DXGI_COMPUTE_PREEMPTION_THREAD_GROUP_BOUNDARY => 2

    /**
     * Indicates the preemption granularity as a thread in a thread group. A thread is a part of a thread group.
     * @type {Integer (Int32)}
     */
    static DXGI_COMPUTE_PREEMPTION_THREAD_BOUNDARY => 3

    /**
     * Indicates the preemption granularity as a compute instruction in a thread.
     * @type {Integer (Int32)}
     */
    static DXGI_COMPUTE_PREEMPTION_INSTRUCTION_BOUNDARY => 4
}

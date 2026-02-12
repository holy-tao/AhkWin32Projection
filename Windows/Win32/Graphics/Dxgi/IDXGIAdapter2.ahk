#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_ADAPTER_DESC2.ahk
#Include .\IDXGIAdapter1.ahk

/**
 * The IDXGIAdapter2 interface represents a display subsystem, which includes one or more GPUs, DACs, and video memory.
 * @remarks
 * A display subsystem is often referred to as a video card; however, on some computers, the display subsystem is part of the motherboard.
 *         
 * 
 * To enumerate the display subsystems, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory1-enumadapters1">IDXGIFactory1::EnumAdapters1</a>.
 *         
 * 
 * To get an interface to the adapter for a particular device, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgidevice-getadapter">IDXGIDevice::GetAdapter</a>.
 *         
 * 
 * To create a software adapter, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-createsoftwareadapter">IDXGIFactory::CreateSoftwareAdapter</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nn-dxgi1_2-idxgiadapter2
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIAdapter2 extends IDXGIAdapter1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIAdapter2
     * @type {Guid}
     */
    static IID => Guid("{0aa1ae0a-fa0e-4b84-8644-e05ff8e5acb5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc2"]

    /**
     * Gets a Microsoft DirectX Graphics Infrastructure (DXGI) 1.2 description of an adapter or video card.
     * @remarks
     * Use the <b>GetDesc2</b> method to get a DXGI 1.2 description of an adapter.  To get a DXGI 1.1 description, use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter1-getdesc1">IDXGIAdapter1::GetDesc1</a> method. To get a DXGI 1.0 description, use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter-getdesc">IDXGIAdapter::GetDesc</a> method.
     * 
     * The Windows Display Driver Model (WDDM) scheduler can preempt the GPU's execution of application tasks. The granularity at which the GPU can be preempted from performing its current task in the WDDM 1.1 or earlier driver model is a direct memory access (DMA) buffer for graphics tasks or a compute packet for compute tasks. The GPU can switch between tasks only after it completes the currently executing unit of work, a DMA buffer or a compute packet. 
     * 
     * A DMA buffer is the largest independent unit of graphics work that the WDDM scheduler can submit to the GPU. This buffer contains a set of GPU instructions that the WDDM driver and GPU use. A compute packet is the largest independent unit of compute work that the WDDM scheduler can submit to the GPU. A compute packet contains dispatches (for example, calls to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dispatch">ID3D11DeviceContext::Dispatch</a> method), which contain thread groups. The WDDM 1.2 or later driver model allows the GPU to be preempted at finer granularity levels than a DMA buffer or compute packet. You can use the <b>GetDesc2</b> method to retrieve the granularity levels for graphics and compute tasks.
     * @returns {DXGI_ADAPTER_DESC2} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_adapter_desc2">DXGI_ADAPTER_DESC2</a> structure that describes the adapter.  
     *       This parameter must not be <b>NULL</b>. On <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9 graphics hardware, earlier versions of  <b>GetDesc2</b> (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter-getdesc">GetDesc</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter1-getdesc1">GetDesc1</a>) return zeros for the PCI ID in the <b>VendorId</b>, <b>DeviceId</b>, <b>SubSysId</b>, and <b>Revision</b> members of the adapter description structure and “Software Adapter” for the description string in the <b>Description</b> member. <b>GetDesc2</b> returns the actual feature level 9 hardware values in these members.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgiadapter2-getdesc2
     */
    GetDesc2() {
        pDesc := DXGI_ADAPTER_DESC2()
        result := ComCall(11, this, "ptr", pDesc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDesc
    }
}

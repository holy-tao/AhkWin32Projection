#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_ADAPTER_DESC2.ahk
#Include .\IDXGIAdapter1.ahk

/**
 * The IDXGIAdapter2 interface represents a display subsystem, which includes one or more GPUs, DACs, and video memory.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nn-dxgi1_2-idxgiadapter2
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
     * 
     * @returns {DXGI_ADAPTER_DESC2} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiadapter2-getdesc2
     */
    GetDesc2() {
        pDesc := DXGI_ADAPTER_DESC2()
        result := ComCall(11, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }
}

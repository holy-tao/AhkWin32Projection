#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIFactory5.ahk

/**
 * This interface enables a single method that enumerates graphics adapters based on a given GPU preference.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_6/nn-dxgi1_6-idxgifactory6
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIFactory6 extends IDXGIFactory5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIFactory6
     * @type {Guid}
     */
    static IID => Guid("{c1b6694f-ff09-44a9-b03c-77900a0a1d17}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumAdapterByGpuPreference"]

    /**
     * Enumerates graphics adapters based on a given GPU preference.
     * @param {Integer} Adapter Type: <b>UINT</b>
     * 
     * The index of the adapter to enumerate. The indices are in order of the preference specified in <i>GpuPreference</i>—for example, if <b>DXGI_GPU_PREFERENCE_HIGH_PERFORMANCE</b> is specified, then the highest-performing adapter is at index 0, the second-highest is at index 1, and so on.
     * @param {Integer} GpuPreference Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dxgi1_6/ne-dxgi1_6-dxgi_gpu_preference">DXGI_GPU_PREFERENCE</a></b>
     * 
     * The GPU preference for the app.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (GUID) of the <a href="https://docs.microsoft.com/windows/win32/api/dxgi1_6/nn-dxgi1_6-idxgifactory6">IDXGIAdapter</a> object referenced by the <i>ppvAdapter</i> parameter.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> interface pointer to the adapter.
     * 
     * This parameter must not be NULL.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_6/nf-dxgi1_6-idxgifactory6-enumadapterbygpupreference
     */
    EnumAdapterByGpuPreference(Adapter, GpuPreference, riid) {
        result := ComCall(29, this, "uint", Adapter, "int", GpuPreference, "ptr", riid, "ptr*", &ppvAdapter := 0, "HRESULT")
        return ppvAdapter
    }
}

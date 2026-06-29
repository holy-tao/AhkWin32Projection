#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDXGIFactory5.ahk" { IDXGIFactory5 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DXGI_GPU_PREFERENCE.ahk" { DXGI_GPU_PREFERENCE }

/**
 * This interface enables a single method that enumerates graphics adapters based on a given GPU preference.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/nn-dxgi1_6-idxgifactory6
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIFactory6 extends IDXGIFactory5 {
    /**
     * The interface identifier for IDXGIFactory6
     * @type {Guid}
     */
    static IID := Guid("{c1b6694f-ff09-44a9-b03c-77900a0a1d17}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIFactory6 interfaces
    */
    struct Vtbl extends IDXGIFactory5.Vtbl {
        EnumAdapterByGpuPreference : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIFactory6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enumerates graphics adapters based on a given GPU preference.
     * @remarks
     * This method allows developers to select which GPU they think is most appropriate for each device their app creates and utilizes.
     * 
     * This method is similar to <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgifactory1-enumadapters1">IDXGIFactory1::EnumAdapters1</a>, but it accepts a GPU preference to reorder the adapter enumeration. It returns the appropriate <b>IDXGIAdapter</b> for the given GPU preference. It is meant to be used in conjunction with the <b>D3D*CreateDevice</b> functions, which take in an <b>IDXGIAdapter*</b>.
     * 
     * When <b>DXGI_GPU_PREFERENCE_UNSPECIFIED</b> is specified for the <i>GpuPreference</i> parameter, this method is equivalent to calling <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgifactory1-enumadapters1">IDXGIFactory1::EnumAdapters1</a>.
     * 
     * When <b>DXGI_GPU_PREFERENCE_MINIMUM_POWER</b> is specified for the <i>GpuPreference</i> parameter, the order of preference for the adapter returned in <i>ppvAdapter</i> will be:<dl>
     * <dd>1. iGPUs (integrated GPUs)</dd>
     * <dd>2. dGPUs (discrete GPUs)</dd>
     * <dd>3. xGPUs (external GPUs)</dd>
     * </dl>
     * 
     * 
     * When <b>DXGI_GPU_PREFERENCE_HIGH_PERFORMANCE</b> is specified for the <i>GpuPreference</i> parameter, the order of preference for the adapter returned in <i>ppvAdapter</i> will be:<dl>
     * <dd>1. xGPUs</dd>
     * <dd>2. dGPUs</dd>
     * <dd>3. iGPUs</dd>
     * </dl>
     * @param {Integer} _Adapter Type: <b>UINT</b>
     * 
     * The index of the adapter to enumerate. The indices are in order of the preference specified in <i>GpuPreference</i>—for example, if <b>DXGI_GPU_PREFERENCE_HIGH_PERFORMANCE</b> is specified, then the highest-performing adapter is at index 0, the second-highest is at index 1, and so on.
     * @param {DXGI_GPU_PREFERENCE} GpuPreference Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dxgi1_6/ne-dxgi1_6-dxgi_gpu_preference">DXGI_GPU_PREFERENCE</a></b>
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
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/nf-dxgi1_6-idxgifactory6-enumadapterbygpupreference
     */
    EnumAdapterByGpuPreference(_Adapter, GpuPreference, riid) {
        result := ComCall(29, this, "uint", _Adapter, DXGI_GPU_PREFERENCE, GpuPreference, Guid.Ptr, riid, "ptr*", &ppvAdapter := 0, "HRESULT")
        return ppvAdapter
    }

    Query(iid) {
        if (IDXGIFactory6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumAdapterByGpuPreference := CallbackCreate(GetMethod(implObj, "EnumAdapterByGpuPreference"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumAdapterByGpuPreference)
    }
}

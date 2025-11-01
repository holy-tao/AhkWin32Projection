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
     * 
     * @param {Integer} Adapter 
     * @param {Integer} GpuPreference 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvAdapter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/nf-dxgi1_6-idxgifactory6-enumadapterbygpupreference
     */
    EnumAdapterByGpuPreference(Adapter, GpuPreference, riid, ppvAdapter) {
        result := ComCall(29, this, "uint", Adapter, "int", GpuPreference, "ptr", riid, "ptr*", ppvAdapter, "HRESULT")
        return result
    }
}

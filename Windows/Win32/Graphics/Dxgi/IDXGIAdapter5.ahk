#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include .\DXGI_ADAPTER_DESC4.ahk
#Include .\DXGI_SINGLE_ADAPTER_HYBRID_MODE.ahk
#Include .\IDXGIAdapter4.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class IDXGIAdapter5 extends IDXGIAdapter4 {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIAdapter5
     * @type {Guid}
     */
    static IID => Guid("{9464643c-c95b-4674-8a7d-ee0548e8c022}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc4", "GetSingleAdapterHybridMode", "SetSingleAdapterHybridMode"]

    /**
     * @returns {DXGI_ADAPTER_DESC4} 
     */
    GetDesc4() {
        pDesc := DXGI_ADAPTER_DESC4()
        result := ComCall(19, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * @returns {DXGI_SINGLE_ADAPTER_HYBRID_MODE} 
     */
    GetSingleAdapterHybridMode() {
        result := ComCall(20, this, "int*", &pSingleAdapterHybridMode := 0, "HRESULT")
        return pSingleAdapterHybridMode
    }

    /**
     * @param {DXGI_SINGLE_ADAPTER_HYBRID_MODE} SingleAdapterHybridMode 
     * @returns {HRESULT} 
     */
    SetSingleAdapterHybridMode(SingleAdapterHybridMode) {
        result := ComCall(21, this, "int", SingleAdapterHybridMode, "HRESULT")
        return result
    }
}

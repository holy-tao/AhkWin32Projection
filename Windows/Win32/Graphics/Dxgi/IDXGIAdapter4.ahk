#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIAdapter3.ahk

/**
 * This interface represents a display subsystem, and extends this family of interfaces to expose a method to check for an adapter's compatibility with Arbitrary Code Guard (ACG).
 * @remarks
 * 
  * For more details, refer to the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/residency">Residency</a> section of the D3D12 documentation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_6/nn-dxgi1_6-idxgiadapter4
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIAdapter4 extends IDXGIAdapter3{
    /**
     * The interface identifier for IDXGIAdapter4
     * @type {Guid}
     */
    static IID => Guid("{3c8d99d1-4fbf-4181-a82c-af66bf7bd24e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * 
     * @param {Pointer<DXGI_ADAPTER_DESC3>} pDesc 
     * @returns {HRESULT} 
     */
    GetDesc3(pDesc) {
        result := ComCall(18, this, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

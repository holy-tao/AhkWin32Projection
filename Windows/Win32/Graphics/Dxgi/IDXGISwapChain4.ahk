#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGISwapChain3.ahk

/**
 * This interface exposes a single method for setting video metadata.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_5/nn-dxgi1_5-idxgiswapchain4
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGISwapChain4 extends IDXGISwapChain3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGISwapChain4
     * @type {Guid}
     */
    static IID => Guid("{3d585d5a-bd4a-489e-b1f4-3dbcb6452ffb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 40

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHDRMetaData"]

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} Size 
     * @param {Pointer<Void>} pMetaData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_5/nf-dxgi1_5-idxgiswapchain4-sethdrmetadata
     */
    SetHDRMetaData(Type, Size, pMetaData) {
        pMetaDataMarshal := pMetaData is VarRef ? "ptr" : "ptr"

        result := ComCall(40, this, "int", Type, "uint", Size, pMetaDataMarshal, pMetaData, "HRESULT")
        return result
    }
}

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
     * This method sets High Dynamic Range (HDR) and Wide Color Gamut (WCG) header metadata.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ne-dxgi1_5-dxgi_hdr_metadata_type">DXGI_HDR_METADATA_TYPE</a></b>
     * 
     * Specifies one member of the  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ne-dxgi1_5-dxgi_hdr_metadata_type">DXGI_HDR_METADATA_TYPE</a> enum.
     * @param {Integer} Size Type: <b>UINT</b>
     * 
     * Specifies the size of <i>pMetaData</i>, in bytes.
     * @param {Pointer<Void>} pMetaData Type: <b>void*</b>
     * 
     * Specifies a void pointer that references the metadata, if it exists. Refer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ns-dxgi1_5-dxgi_hdr_metadata_hdr10">DXGI_HDR_METADATA_HDR10</a> structure.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_5/nf-dxgi1_5-idxgiswapchain4-sethdrmetadata
     */
    SetHDRMetaData(Type, Size, pMetaData) {
        pMetaDataMarshal := pMetaData is VarRef ? "ptr" : "ptr"

        result := ComCall(40, this, "int", Type, "uint", Size, pMetaDataMarshal, pMetaData, "HRESULT")
        return result
    }
}

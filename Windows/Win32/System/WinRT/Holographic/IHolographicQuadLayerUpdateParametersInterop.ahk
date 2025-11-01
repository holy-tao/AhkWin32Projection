#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.holographic.interop/nn-windows-graphics-holographic-interop-iholographicquadlayerupdateparametersinterop
 * @namespace Windows.Win32.System.WinRT.Holographic
 * @version v4.0.30319
 */
class IHolographicQuadLayerUpdateParametersInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicQuadLayerUpdateParametersInterop
     * @type {Guid}
     */
    static IID => Guid("{e5f549cd-c909-444f-8809-7cc18a9c8920}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CommitDirect3D12Resource"]

    /**
     * 
     * @param {ID3D12Resource} pColorResourceToCommit 
     * @param {ID3D12Fence} pColorResourceFence 
     * @param {Integer} colorResourceFenceSignalValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographicquadlayerupdateparametersinterop-commitdirect3d12resource
     */
    CommitDirect3D12Resource(pColorResourceToCommit, pColorResourceFence, colorResourceFenceSignalValue) {
        result := ComCall(6, this, "ptr", pColorResourceToCommit, "ptr", pColorResourceFence, "uint", colorResourceFenceSignalValue, "HRESULT")
        return result
    }
}

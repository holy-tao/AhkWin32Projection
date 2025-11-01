#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.holographic.interop/nn-windows-graphics-holographic-interop-iholographiccamerarenderingparametersinterop
 * @namespace Windows.Win32.System.WinRT.Holographic
 * @version v4.0.30319
 */
class IHolographicCameraRenderingParametersInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicCameraRenderingParametersInterop
     * @type {Guid}
     */
    static IID => Guid("{f75b68d6-d1fd-4707-aafd-fa6f4c0e3bf4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CommitDirect3D12Resource", "CommitDirect3D12ResourceWithDepthData"]

    /**
     * 
     * @param {ID3D12Resource} pColorResourceToCommit 
     * @param {ID3D12Fence} pColorResourceFence 
     * @param {Integer} colorResourceFenceSignalValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographiccamerarenderingparametersinterop-commitdirect3d12resource
     */
    CommitDirect3D12Resource(pColorResourceToCommit, pColorResourceFence, colorResourceFenceSignalValue) {
        result := ComCall(6, this, "ptr", pColorResourceToCommit, "ptr", pColorResourceFence, "uint", colorResourceFenceSignalValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Resource} pColorResourceToCommit 
     * @param {ID3D12Fence} pColorResourceFence 
     * @param {Integer} colorResourceFenceSignalValue 
     * @param {ID3D12Resource} pDepthResourceToCommit 
     * @param {ID3D12Fence} pDepthResourceFence 
     * @param {Integer} depthResourceFenceSignalValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographiccamerarenderingparametersinterop-commitdirect3d12resourcewithdepthdata
     */
    CommitDirect3D12ResourceWithDepthData(pColorResourceToCommit, pColorResourceFence, colorResourceFenceSignalValue, pDepthResourceToCommit, pDepthResourceFence, depthResourceFenceSignalValue) {
        result := ComCall(7, this, "ptr", pColorResourceToCommit, "ptr", pColorResourceFence, "uint", colorResourceFenceSignalValue, "ptr", pDepthResourceToCommit, "ptr", pDepthResourceFence, "uint", depthResourceFenceSignalValue, "HRESULT")
        return result
    }
}

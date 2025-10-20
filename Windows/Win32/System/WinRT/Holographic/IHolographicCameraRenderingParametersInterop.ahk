#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Holographic
 * @version v4.0.30319
 */
class IHolographicCameraRenderingParametersInterop extends IInspectable{
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
     * 
     * @param {Pointer<ID3D12Resource>} pColorResourceToCommit 
     * @param {Pointer<ID3D12Fence>} pColorResourceFence 
     * @param {Integer} colorResourceFenceSignalValue 
     * @returns {HRESULT} 
     */
    CommitDirect3D12Resource(pColorResourceToCommit, pColorResourceFence, colorResourceFenceSignalValue) {
        result := ComCall(6, this, "ptr", pColorResourceToCommit, "ptr", pColorResourceFence, "uint", colorResourceFenceSignalValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pColorResourceToCommit 
     * @param {Pointer<ID3D12Fence>} pColorResourceFence 
     * @param {Integer} colorResourceFenceSignalValue 
     * @param {Pointer<ID3D12Resource>} pDepthResourceToCommit 
     * @param {Pointer<ID3D12Fence>} pDepthResourceFence 
     * @param {Integer} depthResourceFenceSignalValue 
     * @returns {HRESULT} 
     */
    CommitDirect3D12ResourceWithDepthData(pColorResourceToCommit, pColorResourceFence, colorResourceFenceSignalValue, pDepthResourceToCommit, pDepthResourceFence, depthResourceFenceSignalValue) {
        result := ComCall(7, this, "ptr", pColorResourceToCommit, "ptr", pColorResourceFence, "uint", colorResourceFenceSignalValue, "ptr", pDepthResourceToCommit, "ptr", pDepthResourceFence, "uint", depthResourceFenceSignalValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

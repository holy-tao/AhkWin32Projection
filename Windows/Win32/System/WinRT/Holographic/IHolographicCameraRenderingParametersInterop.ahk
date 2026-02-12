#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * A nano-COM interface that allows COM interop with the [HolographicCameraRenderingParameters](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters) class for applications that use Direct3D 12 for holographic rendering.
 * @remarks
 * To use this interface in [C++/WinRT](/windows/uwp/cpp-and-winrt-apis/), retrieve the [HolographicCameraRenderingParameters](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters) object from the [HolographicFrame](/uwp/api/windows.graphics.holographic.holographicframe), and then **QueryInterface** for the **IHolographicCameraRenderingParametersInterop** interface.
 * 
 * ```cppwinrt
 * auto holographicCameraRenderingParameters { holographicFrame.GetRenderingParameters(m_cameraPose) };
 * winrt::com_ptr<IHolographicCameraRenderingParametersInterop> holographicCameraRenderingParametersInterop
 * {
 *     holographicCameraRenderingParameters.as<IHolographicCameraRenderingParametersInterop>();
 * };
 * ```
 * 
 * To use this interface in C++/CX, first cast the [HolographicCameraRenderingParameters](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters) object (after retrieving it from the [HolographicFrame](/uwp/api/windows.graphics.holographic.holographicframe)) to [IInspectable](../inspectable/nn-inspectable-iinspectable.md)\*. Then **QueryInterface** for the **IHolographicCameraRenderingParametersInterop** interface from the **IInspectable** pointer.
 * 
 * ```cppcx
 * auto holographicCameraRenderingParameters = 
 *     holographicFrame->GetRenderingParameters(m_cameraPose);
 * Microsoft::WRL::ComPtr<IHolographicCameraRenderingParametersInterop> 
 *     holographicCameraRenderingParametersInterop;
 * {
 *     Microsoft::WRL::ComPtr<IInspectable> iInspectable = reinterpret_cast<IInspectable*>(holographicCameraRenderingParameters);
 *     DX::ThrowIfFailed(iInspectable.As(&holographicCameraRenderingParametersInterop));
 * }
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nn-windows-graphics-holographic-interop-iholographiccamerarenderingparametersinterop
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
     * The IHolographicCameraRenderingParametersInterop::CommitDirect3D12Resource function commits a Direct3D 12 buffer for presentation on HolographicCamera outputs.
     * @param {ID3D12Resource} pColorResourceToCommit Type: **[ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md)\***
     * 
     * The Direct3D 12 texture resource with content to display when presenting the [HolographicFrame](/uwp/api/windows.graphics.holographic.holographicframe) used to retrieve this rendering parameters object.
     * @param {ID3D12Fence} pColorResourceFence Type: **[ID3D12Fence](../d3d12/nn-d3d12-id3d12fence.md)\***
     * 
     * A fence used to signal app work completion on the color buffer resource indicated by *pColorResourceToCommit*. Completion of this fence at the value indicated by *colorResourceFenceSignalValue* signals transfer of control of the color resource from your application to the platform in the GPU work queue. The platform relies upon this fence, and the value indicated in *colorResourceFenceSignalValue*, to queue work on the GPU that reads from the color buffer.
     * @param {Integer} colorResourceFenceSignalValue Type: **[UINT64](/windows/win32/winprog/windows-data-types)**
     * 
     * The value used to signal work completion on *pColorResourceFence*. The platform relies upon this fence value to queue work on the GPU that reads from the color buffer.
     * @returns {HRESULT} **S_OK** if successful, otherwise returns an [HRESULT](/windows/win32/com/structure-of-com-error-codes) error code indicating the  reason for failure. Also see [COM Error Codes (UI, Audio, DirectX, Codec)](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographiccamerarenderingparametersinterop-commitdirect3d12resource
     */
    CommitDirect3D12Resource(pColorResourceToCommit, pColorResourceFence, colorResourceFenceSignalValue) {
        result := ComCall(6, this, "ptr", pColorResourceToCommit, "ptr", pColorResourceFence, "uint", colorResourceFenceSignalValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IHolographicCameraRenderingParametersInterop::CommitDirect3D12ResourceWithDepthData function commits a Direct3D 12 buffer for HolographicCamera outputs.
     * @param {ID3D12Resource} pColorResourceToCommit Type: **[ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md)\***
     * 
     * The Direct3D 12 texture resource with content to display when presenting the [HolographicFrame](/uwp/api/windows.graphics.holographic.holographicframe) used to retrieve this rendering parameters object.
     * @param {ID3D12Fence} pColorResourceFence Type: **[ID3D12Fence](../d3d12/nn-d3d12-id3d12fence.md)\***
     * 
     * A fence used to signal app work completion on the color buffer resource indicated by *pColorResourceToCommit*. Completion of this fence at the value indicated by *colorResourceFenceSignalValue* signals transfer of control of the color resource from your application to the platform in the GPU work queue. The platform relies upon this fence, and the value indicated in *colorResourceFenceSignalValue*, to queue work on the GPU that reads from the color buffer.
     * @param {Integer} colorResourceFenceSignalValue Type: **[UINT64](/windows/win32/winprog/windows-data-types)**
     * 
     * The value used to signal work completion on *pColorResourceFence*. The platform relies upon this fence value to queue work on the GPU that reads from the color buffer.
     * @param {ID3D12Resource} pDepthResourceToCommit Type: **[ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md)\***
     * 
     * The Direct3D 12 depth buffer with depth data to use for image stabilization when presenting the [HolographicFrame](/uwp/api/windows.graphics.holographic.holographicframe) used to retrieve this rendering parameters object. Applications typically submit the depth stencil used when rendering to *pColorResourceToCommit*, or a depth buffer that is derived from the same rendering pass. The depth buffer should only include data corresponding to geometry used to render holograms in the color buffer; for example, occlusion data shouldn't be included, and may be ignored by the platform.
     * @param {ID3D12Fence} pDepthResourceFence Type: **[ID3D12Fence](../d3d12/nn-d3d12-id3d12fence.md)\***
     * 
     * A fence used to signal work completion on the depth buffer resource indicated by *pDepthResourceToCommit*. Completion of this fence at the value indicated by *depthResourceFenceSignalValue* signals transfer of control of the depth resource from your application to the platform in the GPU work queue. The platform relies upon this fence, and the value indicated in *colorResourceFenceSignalValue*, to queue work on the GPU that reads from the depth buffer.
     * @param {Integer} depthResourceFenceSignalValue Type: **[UINT64](/windows/win32/winprog/windows-data-types)**
     * 
     * The value used to signal work completion on *pDepthResourceFence*. The platform relies upon this fence value to queue work on the GPU that reads from the depth buffer.
     * @returns {HRESULT} **S_OK** if successful, otherwise returns an [HRESULT](/windows/win32/com/structure-of-com-error-codes) error code indicating the reason for failure. Also see [COM Error Codes (UI, Audio, DirectX, Codec)](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographiccamerarenderingparametersinterop-commitdirect3d12resourcewithdepthdata
     */
    CommitDirect3D12ResourceWithDepthData(pColorResourceToCommit, pColorResourceFence, colorResourceFenceSignalValue, pDepthResourceToCommit, pDepthResourceFence, depthResourceFenceSignalValue) {
        result := ComCall(7, this, "ptr", pColorResourceToCommit, "ptr", pColorResourceFence, "uint", colorResourceFenceSignalValue, "ptr", pDepthResourceToCommit, "ptr", pDepthResourceFence, "uint", depthResourceFenceSignalValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

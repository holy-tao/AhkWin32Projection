#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * A nano-COM interface that allows COM interop with the [HolographicQuadLayerUpdateParameters](/uwp/api/windows.graphics.holographic.holographicquadlayerupdateparameters) class for applications that use Direct3D 12 for holographic rendering.
 * @remarks
 * To use this interface in [C++/WinRT](/windows/uwp/cpp-and-winrt-apis/), retrieve the [HolographicQuadLayerUpdateParameters](/uwp/api/windows.graphics.holographic.holographicquadlayerupdateparameters) object from the [HolographicFrame](/uwp/api/windows.graphics.holographic.holographicframe), and then QueryInterface for the **IHolographicQuadLayerUpdateParametersInterop** interface.
 * 
 * ```cppwinrt
 * auto quadLayerParameters{ holographicFrame.GetQuadLayerUpdateParameters(m_quadLayer) };
 * winrt::com_ptr<IHolographicQuadLayerUpdateParametersInterop> quadLayerParametersInterop{
 *     quadLayerParameters.as<IHolographicQuadLayerUpdateParametersInterop>() };
 * ```
 * 
 * To use this interface in C++/CX, first cast the [HolographicQuadLayerUpdateParameters](/uwp/api/windows.graphics.holographic.holographicquadlayerupdateparameters) object (after retrieving it from the [HolographicFrame](/uwp/api/windows.graphics.holographic.holographicframe)) to [IInspectable](../inspectable/nn-inspectable-iinspectable.md)\*. Then QueryInterface for the **IHolographicQuadLayerUpdateParametersInterop** interface from the **IInspectable** pointer.
 * 
 * ```cppcx
 * auto quadLayerParameters = holographicFrame->GetQuadLayerUpdateParameters(m_quadLayer);
 * Microsoft::WRL::ComPtr<IHolographicQuadLayerUpdateParametersInterop> quadLayerParametersInterop;
 * {
 *     Microsoft::WRL::ComPtr<IInspectable> iInspectable = reinterpret_cast<IInspectable*>(quadLayerParameters);
 *     DX::ThrowIfFailed(iInspectable.As(&quadLayerParamsInterop));
 * }
 * ```
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
     * Commits a Direct3D 12 buffer for presentation on outputs associated with any [HolographicCamera](/uwp/api/windows.graphics.holographic.holographiccamera) to which the quad layer is attached.
     * @param {ID3D12Resource} pColorResourceToCommit Type: **[ID3D12Resource](../d3d12/nn-d3d12-id3d12resource.md)\***
     * 
     * The Direct3D 12 texture resource with content to display when rendering the [HolographicQuadLayer](/uwp/api/windows.graphics.holographic.holographicquadlayer) corresponding to this update parameters object. The content will also be displayed during any subsequent frames, until another content buffer update is provided for this [HolographicQuadLayer](/uwp/api/windows.graphics.holographic.holographicquadlayer).
     * @param {ID3D12Fence} pColorResourceFence Type: **[ID3D12Fence](../d3d12/nn-d3d12-id3d12fence.md)\***
     * 
     * A fence used to signal app work completion on the content buffer resource indicated by *pColorResourceToCommit*. Completion of this fence at the value indicated by *colorResourceFenceSignalValue* signals transfer of control of the content buffer resource from your application to the platform in the GPU work queue. The platform relies upon this fence, and the value indicated in *colorResourceFenceSignalValue*, to queue work on the GPU that reads from the content buffer.
     * @param {Integer} colorResourceFenceSignalValue Type: **[UINT64](/windows/win32/winprog/windows-data-types)**
     * 
     * The value used to signal work completion on *pColorResourceFence*. The platform relies upon this fence value to queue work on the GPU that reads from the content buffer.
     * @returns {HRESULT} **S_OK** if successful, otherwise returns an [HRESULT](/windows/win32/com/structure-of-com-error-codes) error code indicating the reason for failure. Also see [COM Error Codes (UI, Audio, DirectX, Codec)](/windows/win32/com/com-error-codes-10).
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.holographic.interop/nf-windows-graphics-holographic-interop-iholographicquadlayerupdateparametersinterop-commitdirect3d12resource
     */
    CommitDirect3D12Resource(pColorResourceToCommit, pColorResourceFence, colorResourceFenceSignalValue) {
        result := ComCall(6, this, "ptr", pColorResourceToCommit, "ptr", pColorResourceFence, "uint", colorResourceFenceSignalValue, "HRESULT")
        return result
    }
}

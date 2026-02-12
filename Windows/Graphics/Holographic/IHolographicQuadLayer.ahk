#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * A nano-COM interface that allows COM interop with the [HolographicQuadLayer](/uwp/api/windows.graphics.holographic.holographicquadlayer) Windows Runtime class for apps that use Direct3D 12 for holographic rendering.
 * @remarks
 * To use this interface in [C++/WinRT](/windows/uwp/cpp-and-winrt-apis/), QueryInterface for the **IHolographicQuadLayerInterop** interface from the [HolographicQuadLayer](/uwp/api/windows.graphics.holographic.holographicquadlayer) object.
 * 
 * Note that you can use the [HolographicViewConfiguration](/uwp/api/windows.graphics.holographic.holographicviewconfiguration) API to determine the available options for buffer format.
 * 
 * ```cppwinrt
 * m_quadLayer = HolographicQuadLayer{ {1024, 1024} };
 * winrt::com_ptr<IHolographicQuadLayerInterop> quadLayerInterop{
 *     m_quadLayer.as<IHolographicQuadLayerInterop>() };
 * 
 * // Create/acquire buffer.
 * if (!m_D3D12ContentBuffer[m_contentBufferIndex])
 * {
 *     D3D12_RESOURCE_DESC bufferDesc{ sourceDesc };
 *     bufferDesc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
 *     bufferDesc.SampleDesc.Count = 1;
 *     bufferDesc.SampleDesc.Quality = 0;
 *     bufferDesc.MipLevels = 1;
 * 
 *     winrt::check_hresult(
 *         quadLayerInterop->CreateDirect3D12ContentBufferResource(
 *             m_deviceResources->GetD3D12Device(),
 *             &bufferDesc,
 *             &m_D3D12ContentBuffer[m_contentBufferIndex]));
 * }
 * ```
 * 
 * To use this interface in C++/CX, cast the [HolographicQuadLayer](/uwp/api/windows.graphics.holographic.holographicquadlayer) object to [IInspectable](../inspectable/nn-inspectable-iinspectable.md)\*. Then QueryInterface for the **IHolographicQuadLayerInterop** interface from the **IInspectable** pointer.
 * 
 * ```cppcx
 * m_quadLayer = ref new HolographicQuadLayer();
 * Microsoft::WRL::ComPtr<IHolographicQuadLayerInterop> quadLayerInterop;
 * {
 *     Microsoft::WRL::ComPtr<IInspectable> iInspectable = reinterpret_cast<IInspectable*>(m_quadLayer);
 *     DX::ThrowIfFailed(iInspectable.As(&quadLayerInterop));
 * }
 * 
 * // Create/acquire buffer.
 * if (!m_D3D12ContentBuffer[m_contentBufferIndex])
 * {
 *     D3D12_RESOURCE_DESC bufferDesc = sourceDesc;
 *     bufferDesc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
 *     bufferDesc.SampleDesc.Count = 1;
 *     bufferDesc.SampleDesc.Quality = 0;
 *     bufferDesc.MipLevels = 1;
 * 
 *     DX::ThrowIfFailed(quadLayerInterop->CreateDirect3D12ContentBufferResource(
 *         m_deviceResources->GetD3D12Device(),
 *         &bufferDesc,
 *         &m_D3D12ContentBuffer[m_contentBufferIndex]));
 * }
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nn-windows-graphics-holographic-interop-iholographicquadlayerinterop
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicQuadLayer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicQuadLayer
     * @type {Guid}
     */
    static IID => Guid("{903460c9-c9d9-5d5c-41ac-a2d5ab0fd331}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PixelFormat", "get_Size"]

    /**
     * @type {Integer} 
     */
    PixelFormat {
        get => this.get_PixelFormat()
    }

    /**
     * @type {SIZE} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelFormat() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_Size() {
        value := SIZE()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

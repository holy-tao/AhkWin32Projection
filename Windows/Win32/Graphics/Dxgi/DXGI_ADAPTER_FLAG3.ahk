#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of DXGI adapter.
 * @remarks
 * 
 * The <b>DXGI_ADAPTER_FLAG3</b> enumerated type is used by the <b>Flags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_6/ns-dxgi1_6-dxgi_adapter_desc3">DXGI_ADAPTER_DESC3</a> structure to ientify the type of DXGI adapter.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_6/ne-dxgi1_6-dxgi_adapter_flag3
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_ADAPTER_FLAG3 extends Win32BitflagEnum{

    /**
     * Specifies no flags.
     * @type {Integer (Int32)}
     */
    static DXGI_ADAPTER_FLAG3_NONE => 0

    /**
     * Value always set to 0. This flag is reserved.
     * @type {Integer (Int32)}
     */
    static DXGI_ADAPTER_FLAG3_REMOTE => 1

    /**
     * Specifies a software adapter. For more info about this flag, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/d3d10-graphics-programming-guide-dxgi">new info in Windows 8 about enumerating adapters</a>.
     * 
     * <b>Direct3D 11:  </b>This enumeration value is supported starting with Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_ADAPTER_FLAG3_SOFTWARE => 2

    /**
     * Specifies that the adapter's driver has been confirmed to work in an OS process where Arbitrary Code Guard (ACG) is enabled (i.e. dynamic code generation is disallowed).
     * @type {Integer (Int32)}
     */
    static DXGI_ADAPTER_FLAG3_ACG_COMPATIBLE => 4

    /**
     * Specifies that the adapter supports monitored fences. These adapters support the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12device">ID3D12Device::CreateFence</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nn-d3d11_4-id3d11device5">ID3D11Device5::CreateFence</a> functions.
     * @type {Integer (Int32)}
     */
    static DXGI_ADAPTER_FLAG3_SUPPORT_MONITORED_FENCES => 8

    /**
     * Specifies that the adapter supports non-monitored fences. These adapters support the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12device">ID3D12Device::CreateFence</a> function together with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_fence_flags">D3D12_FENCE_FLAG_NON_MONITORED</a> flag.
     * 
     * <div class="alert"><b>Note</b>  For adapters that support both monitored and non-monitored fences, non-monitored fences are only supported when created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_fence_flags">D3D12_FENCE_FLAG_SHARED</a> and <b>D3D12_FENCE_FLAG_SHARED_CROSS_ADAPTER</b> flags. Monitored fences should always be used by supporting adapters unless communicating with an adapter that only supports non-monitored fences.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static DXGI_ADAPTER_FLAG3_SUPPORT_NON_MONITORED_FENCES => 16

    /**
     * Specifies that the adapter claims keyed mutex conformance. This signals a stronger guarantee that the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgikeyedmutex">IDXGIKeyedMutex</a> interface behaves correctly.
     * @type {Integer (Int32)}
     */
    static DXGI_ADAPTER_FLAG3_KEYED_MUTEX_CONFORMANCE => 32
}

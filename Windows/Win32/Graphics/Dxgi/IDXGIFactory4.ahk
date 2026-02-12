#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIFactory3.ahk

/**
 * Enables creating Microsoft DirectX Graphics Infrastructure (DXGI) objects. (IDXGIFactory4)
 * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_4/nn-dxgi1_4-idxgifactory4
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIFactory4 extends IDXGIFactory3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIFactory4
     * @type {Guid}
     */
    static IID => Guid("{1bc6ea02-ef36-464f-bf0c-21ca39e5168a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumAdapterByLuid", "EnumWarpAdapter"]

    /**
     * Outputs the IDXGIAdapter for the specified LUID.
     * @remarks
     * For Direct3D 12, it's no longer possible to backtrack from a device to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> that was used to create it.
     *           <b>IDXGIFactory4::EnumAdapterByLuid</b> enables an app to retrieve information about the adapter where a D3D12 device was created.
     *           <b>IDXGIFactory4::EnumAdapterByLuid</b> is designed to be paired with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-getadapterluid">ID3D12Device::GetAdapterLuid</a>.
     *           For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-1-4-improvements">DXGI 1.4 Improvements</a>.
     * @param {LUID} AdapterLuid Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549708(v=vs.85)">LUID</a></b>
     * 
     * A unique value that identifies the adapter.
     *             See <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549708(v=vs.85)">LUID</a> for a definition of the structure.
     *             <b>LUID</b> is defined in dxgi.h.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (GUID) of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> object referenced by the <i>ppvAdapter</i> parameter.
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> interface pointer to the adapter.
     *             This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_4/nf-dxgi1_4-idxgifactory4-enumadapterbyluid
     */
    EnumAdapterByLuid(AdapterLuid, riid) {
        result := ComCall(26, this, "ptr", AdapterLuid, "ptr", riid, "ptr*", &ppvAdapter := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvAdapter
    }

    /**
     * Provides an adapter which can be provided to D3D12CreateDevice to use the WARP renderer.
     * @remarks
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-1-4-improvements">DXGI 1.4 Improvements</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (GUID) of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> object referenced by the <i>ppvAdapter</i> parameter.
     * @returns {Pointer<Pointer<Void>>} Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> interface pointer to the adapter.
     *             This parameter must not be NULL.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_4/nf-dxgi1_4-idxgifactory4-enumwarpadapter
     */
    EnumWarpAdapter(riid) {
        result := ComCall(27, this, "ptr", riid, "ptr*", &ppvAdapter := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvAdapter
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIFactory3.ahk

/**
 * Enables creating Microsoft DirectX Graphics Infrastructure (DXGI) objects.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nn-dxgi1_4-idxgifactory4
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
     * 
     * @param {LUID} AdapterLuid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvAdapter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgifactory4-enumadapterbyluid
     */
    EnumAdapterByLuid(AdapterLuid, riid, ppvAdapter) {
        result := ComCall(26, this, "ptr", AdapterLuid, "ptr", riid, "ptr*", ppvAdapter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvAdapter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgifactory4-enumwarpadapter
     */
    EnumWarpAdapter(riid, ppvAdapter) {
        result := ComCall(27, this, "ptr", riid, "ptr*", ppvAdapter, "HRESULT")
        return result
    }
}

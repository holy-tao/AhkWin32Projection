#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9on12
 * @version v4.0.30319
 */
class IDirect3DDevice9On12 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DDevice9On12
     * @type {Guid}
     */
    static IID => Guid("{e7fda234-b589-4049-940d-8878977531c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetD3D12Device", "UnwrapUnderlyingResource", "ReturnUnderlyingResource"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvDevice 
     * @returns {HRESULT} 
     */
    GetD3D12Device(riid, ppvDevice) {
        result := ComCall(3, this, "ptr", riid, "ptr*", ppvDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DResource9} pResource 
     * @param {ID3D12CommandQueue} pCommandQueue 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvResource12 
     * @returns {HRESULT} 
     */
    UnwrapUnderlyingResource(pResource, pCommandQueue, riid, ppvResource12) {
        result := ComCall(4, this, "ptr", pResource, "ptr", pCommandQueue, "ptr", riid, "ptr*", ppvResource12, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DResource9} pResource 
     * @param {Integer} NumSync 
     * @param {Pointer<Integer>} pSignalValues 
     * @param {Pointer<ID3D12Fence>} ppFences 
     * @returns {HRESULT} 
     */
    ReturnUnderlyingResource(pResource, NumSync, pSignalValues, ppFences) {
        pSignalValuesMarshal := pSignalValues is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pResource, "uint", NumSync, pSignalValuesMarshal, pSignalValues, "ptr*", ppFences, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9on12
 * @version v4.0.30319
 */
class IDirect3DDevice9On12 extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvDevice 
     * @returns {HRESULT} 
     */
    GetD3D12Device(riid, ppvDevice) {
        result := ComCall(3, this, "ptr", riid, "ptr", ppvDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DResource9>} pResource 
     * @param {Pointer<ID3D12CommandQueue>} pCommandQueue 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvResource12 
     * @returns {HRESULT} 
     */
    UnwrapUnderlyingResource(pResource, pCommandQueue, riid, ppvResource12) {
        result := ComCall(4, this, "ptr", pResource, "ptr", pCommandQueue, "ptr", riid, "ptr", ppvResource12, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DResource9>} pResource 
     * @param {Integer} NumSync 
     * @param {Pointer<UInt64>} pSignalValues 
     * @param {Pointer<ID3D12Fence>} ppFences 
     * @returns {HRESULT} 
     */
    ReturnUnderlyingResource(pResource, NumSync, pSignalValues, ppFences) {
        result := ComCall(5, this, "ptr", pResource, "uint", NumSync, "uint*", pSignalValues, "ptr", ppFences, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

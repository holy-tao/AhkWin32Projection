#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11On12Device1.ahk

/**
 * Enables you to take resources created through the Direct3D 11 APIs, and use them in Direct3D 12.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11on12/nn-d3d11on12-id3d11on12device2
 * @namespace Windows.Win32.Graphics.Direct3D11on12
 * @version v4.0.30319
 */
class ID3D11On12Device2 extends ID3D11On12Device1{
    /**
     * The interface identifier for ID3D11On12Device2
     * @type {Guid}
     */
    static IID => Guid("{dc90f331-4740-43fa-866e-67f12cb58223}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pResource11 
     * @param {Pointer<ID3D12CommandQueue>} pCommandQueue 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvResource12 
     * @returns {HRESULT} 
     */
    UnwrapUnderlyingResource(pResource11, pCommandQueue, riid, ppvResource12) {
        result := ComCall(7, this, "ptr", pResource11, "ptr", pCommandQueue, "ptr", riid, "ptr", ppvResource12, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pResource11 
     * @param {Integer} NumSync 
     * @param {Pointer<UInt64>} pSignalValues 
     * @param {Pointer<ID3D12Fence>} ppFences 
     * @returns {HRESULT} 
     */
    ReturnUnderlyingResource(pResource11, NumSync, pSignalValues, ppFences) {
        result := ComCall(8, this, "ptr", pResource11, "uint", NumSync, "uint*", pSignalValues, "ptr", ppFences, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

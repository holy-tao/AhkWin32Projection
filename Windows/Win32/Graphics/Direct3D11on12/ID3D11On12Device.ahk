#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Handles the creation, wrapping, and releasing of D3D11 resources for Direct3D11on12.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11on12/nn-d3d11on12-id3d11on12device
 * @namespace Windows.Win32.Graphics.Direct3D11on12
 * @version v4.0.30319
 */
class ID3D11On12Device extends IUnknown{
    /**
     * The interface identifier for ID3D11On12Device
     * @type {Guid}
     */
    static IID => Guid("{85611e73-70a9-490e-9614-a9e302777904}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pResource12 
     * @param {Pointer<D3D11_RESOURCE_FLAGS>} pFlags11 
     * @param {Integer} InState 
     * @param {Integer} OutState 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppResource11 
     * @returns {HRESULT} 
     */
    CreateWrappedResource(pResource12, pFlags11, InState, OutState, riid, ppResource11) {
        result := ComCall(3, this, "ptr", pResource12, "ptr", pFlags11, "int", InState, "int", OutState, "ptr", riid, "ptr", ppResource11, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} ppResources 
     * @param {Integer} NumResources 
     * @returns {String} Nothing - always returns an empty string
     */
    ReleaseWrappedResources(ppResources, NumResources) {
        ComCall(4, this, "ptr", ppResources, "uint", NumResources)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} ppResources 
     * @param {Integer} NumResources 
     * @returns {String} Nothing - always returns an empty string
     */
    AcquireWrappedResources(ppResources, NumResources) {
        ComCall(5, this, "ptr", ppResources, "uint", NumResources)
        return result
    }
}

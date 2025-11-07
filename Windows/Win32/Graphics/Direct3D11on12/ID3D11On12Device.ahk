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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWrappedResource", "ReleaseWrappedResources", "AcquireWrappedResources"]

    /**
     * 
     * @param {IUnknown} pResource12 
     * @param {Pointer<D3D11_RESOURCE_FLAGS>} pFlags11 
     * @param {Integer} InState 
     * @param {Integer} OutState 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nf-d3d11on12-id3d11on12device-createwrappedresource
     */
    CreateWrappedResource(pResource12, pFlags11, InState, OutState, riid) {
        result := ComCall(3, this, "ptr", pResource12, "ptr", pFlags11, "int", InState, "int", OutState, "ptr", riid, "ptr*", &ppResource11 := 0, "HRESULT")
        return ppResource11
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} ppResources 
     * @param {Integer} NumResources 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nf-d3d11on12-id3d11on12device-releasewrappedresources
     */
    ReleaseWrappedResources(ppResources, NumResources) {
        ComCall(4, this, "ptr*", ppResources, "uint", NumResources)
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} ppResources 
     * @param {Integer} NumResources 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nf-d3d11on12-id3d11on12device-acquirewrappedresources
     */
    AcquireWrappedResources(ppResources, NumResources) {
        ComCall(5, this, "ptr*", ppResources, "uint", NumResources)
    }
}

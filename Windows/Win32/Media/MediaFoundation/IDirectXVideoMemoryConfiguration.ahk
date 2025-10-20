#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sets the type of video memory for uncompressed video surfaces.
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nn-dxva2api-idirectxvideomemoryconfiguration
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDirectXVideoMemoryConfiguration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectXVideoMemoryConfiguration
     * @type {Guid}
     */
    static IID => Guid("{b7f916dd-db3b-49c1-84d7-e45ef99ec726}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAvailableSurfaceTypeByIndex", "SetSurfaceType"]

    /**
     * 
     * @param {Integer} dwTypeIndex 
     * @param {Pointer<Integer>} pdwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideomemoryconfiguration-getavailablesurfacetypebyindex
     */
    GetAvailableSurfaceTypeByIndex(dwTypeIndex, pdwType) {
        result := ComCall(3, this, "uint", dwTypeIndex, "int*", pdwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideomemoryconfiguration-setsurfacetype
     */
    SetSurfaceType(dwType) {
        result := ComCall(4, this, "int", dwType, "HRESULT")
        return result
    }
}

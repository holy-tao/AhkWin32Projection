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
     * 
     * @param {Integer} dwTypeIndex 
     * @param {Pointer<Int32>} pdwType 
     * @returns {HRESULT} 
     */
    GetAvailableSurfaceTypeByIndex(dwTypeIndex, pdwType) {
        result := ComCall(3, this, "uint", dwTypeIndex, "int*", pdwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwType 
     * @returns {HRESULT} 
     */
    SetSurfaceType(dwType) {
        result := ComCall(4, this, "int", dwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

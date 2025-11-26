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
     * Retrieves a supported video surface type.
     * @param {Integer} dwTypeIndex Zero-based index of the surface type to retrieve. Surface types are indexed in order of preference, starting with the most preferred type.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/win32/api/dxva2api/ne-dxva2api-dxva2_surfacetype">DXVA2_SurfaceType</a> enumeration that specifies the surface type.
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideomemoryconfiguration-getavailablesurfacetypebyindex
     */
    GetAvailableSurfaceTypeByIndex(dwTypeIndex) {
        result := ComCall(3, this, "uint", dwTypeIndex, "int*", &pdwType := 0, "HRESULT")
        return pdwType
    }

    /**
     * Sets the video surface type that a decoder will use for DirectX Video Acceleration (DVXA) 2.0.
     * @param {Integer} dwType Member of the <a href="https://docs.microsoft.com/windows/win32/api/dxva2api/ne-dxva2api-dxva2_surfacetype">DXVA2_SurfaceType</a> enumeration specifying the surface type. Currently, the only supported value is DXVA2_SurfaceType_DecoderRenderTarget.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_UNSUPPORTED_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The renderer does not support the specified surface type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nf-dxva2api-idirectxvideomemoryconfiguration-setsurfacetype
     */
    SetSurfaceType(dwType) {
        result := ComCall(4, this, "int", dwType, "HRESULT")
        return result
    }
}

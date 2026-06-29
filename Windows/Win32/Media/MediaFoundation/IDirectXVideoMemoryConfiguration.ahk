#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DXVA2_SurfaceType.ahk" { DXVA2_SurfaceType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Sets the type of video memory for uncompressed video surfaces.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nn-dxva2api-idirectxvideomemoryconfiguration
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IDirectXVideoMemoryConfiguration extends IUnknown {
    /**
     * The interface identifier for IDirectXVideoMemoryConfiguration
     * @type {Guid}
     */
    static IID := Guid("{b7f916dd-db3b-49c1-84d7-e45ef99ec726}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectXVideoMemoryConfiguration interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAvailableSurfaceTypeByIndex : IntPtr
        SetSurfaceType                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectXVideoMemoryConfiguration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a supported video surface type.
     * @param {Integer} dwTypeIndex Zero-based index of the surface type to retrieve. Surface types are indexed in order of preference, starting with the most preferred type.
     * @returns {DXVA2_SurfaceType} Receives a member of the <a href="https://docs.microsoft.com/windows/win32/api/dxva2api/ne-dxva2api-dxva2_surfacetype">DXVA2_SurfaceType</a> enumeration that specifies the surface type.
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideomemoryconfiguration-getavailablesurfacetypebyindex
     */
    GetAvailableSurfaceTypeByIndex(dwTypeIndex) {
        result := ComCall(3, this, "uint", dwTypeIndex, "int*", &pdwType := 0, "HRESULT")
        return pdwType
    }

    /**
     * Sets the video surface type that a decoder will use for DirectX Video Acceleration (DVXA) 2.0.
     * @remarks
     * By calling this method, the caller agrees to create surfaces of the type specified in the <i>dwType</i> parameter.
     * 
     * In DirectShow, during pin connection, a video decoder that supports DVXA 2.0 should call <b>SetSurface</b> with the value DXVA2_SurfaceType_DecoderRenderTarget. This notifies the video renderer that the decoder will provide the allocator and will create the Direct3D surfaces for decoding. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/supporting-dxva-2-0-in-directshow">Supporting DXVA 2.0 in DirectShow</a>.
     * 
     * The only way to undo the setting is to break the pin connection.
     * @param {DXVA2_SurfaceType} dwType Member of the <a href="https://docs.microsoft.com/windows/win32/api/dxva2api/ne-dxva2api-dxva2_surfacetype">DXVA2_SurfaceType</a> enumeration specifying the surface type. Currently, the only supported value is DXVA2_SurfaceType_DecoderRenderTarget.
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
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideomemoryconfiguration-setsurfacetype
     */
    SetSurfaceType(dwType) {
        result := ComCall(4, this, DXVA2_SurfaceType, dwType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectXVideoMemoryConfiguration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAvailableSurfaceTypeByIndex := CallbackCreate(GetMethod(implObj, "GetAvailableSurfaceTypeByIndex"), flags, 3)
        this.vtbl.SetSurfaceType := CallbackCreate(GetMethod(implObj, "SetSurfaceType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAvailableSurfaceTypeByIndex)
        CallbackFree(this.vtbl.SetSurfaceType)
    }
}

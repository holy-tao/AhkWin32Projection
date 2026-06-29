#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\Direct3D9\D3DDEVTYPE.ahk" { D3DDEVTYPE }
#Import "..\..\Graphics\Direct3D9\D3DDISPLAYMODEEX.ahk" { D3DDISPLAYMODEEX }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Direct3D9\D3DDISPLAYROTATION.ahk" { D3DDISPLAYROTATION }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\D3DOVERLAYCAPS.ahk" { D3DOVERLAYCAPS }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * Queries the overlay hardware capabilities of a Direct3D device. (IDirect3D9ExOverlayExtension)
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nn-d3d9-idirect3d9exoverlayextension
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IDirect3D9ExOverlayExtension extends IUnknown {
    /**
     * The interface identifier for IDirect3D9ExOverlayExtension
     * @type {Guid}
     */
    static IID := Guid("{187aeb13-aaf5-4c59-876d-e059088c0df8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirect3D9ExOverlayExtension interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CheckDeviceOverlayType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirect3D9ExOverlayExtension.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queries the overlay hardware capabilities of a Direct3D device. (IDirect3D9ExOverlayExtension.CheckDeviceOverlayType)
     * @param {Integer} _Adapter An ordinal number that denotes the display adapter. <b>D3DADAPTER_DEFAULT</b> is always the primary display adapter.
     * @param {D3DDEVTYPE} DevType Specifies the Direct3D device type as a member of the <b>D3DDEVTYPE</b> enumerated type.
     * @param {Integer} OverlayWidth The width of the overlay to create, in pixels.
     * @param {Integer} OverlayHeight The height of the overlay to create, in pixels.
     * @param {D3DFORMAT} OverlayFormat The surface format of the overlay.
     * @param {Pointer<D3DDISPLAYMODEEX>} pDisplayMode A pointer to a <b>D3DDISPLAYMODEEX</b> structure that specifies the display mode that will be used. If this parameter is <b>NULL</b>, the current display mode is assumed.
     * @param {D3DDISPLAYROTATION} DisplayRotation Specifies the display rotation mode as a member of the <b>D3DDISPLAYROTATION</b> enumerated type.
     * @param {Pointer<D3DOVERLAYCAPS>} pOverlayCaps A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3doverlaycaps">D3DOVERLAYCAPS</a> structure. If the driver supports the overlay settings specified in the input parameters, the method fills this structure with the capabilities of the overlay hardware.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>D3DERR_INVALIDCALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid parameter, or the device does not support hardware overlay.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>D3DERR_UNSUPPORTEDOVERLAY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not support overlay for the specified size or display mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>D3DERR_UNSUPPORTEDOVERLAYFORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device does not support overlay for the specified surface format.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3d9exoverlayextension-checkdeviceoverlaytype
     */
    CheckDeviceOverlayType(_Adapter, DevType, OverlayWidth, OverlayHeight, OverlayFormat, pDisplayMode, DisplayRotation, pOverlayCaps) {
        result := ComCall(3, this, "uint", _Adapter, D3DDEVTYPE, DevType, "uint", OverlayWidth, "uint", OverlayHeight, D3DFORMAT, OverlayFormat, D3DDISPLAYMODEEX.Ptr, pDisplayMode, D3DDISPLAYROTATION, DisplayRotation, D3DOVERLAYCAPS.Ptr, pOverlayCaps, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirect3D9ExOverlayExtension.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CheckDeviceOverlayType := CallbackCreate(GetMethod(implObj, "CheckDeviceOverlayType"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CheckDeviceOverlayType)
    }
}

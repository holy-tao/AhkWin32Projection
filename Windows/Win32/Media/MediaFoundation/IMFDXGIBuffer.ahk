#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a buffer that contains a Microsoft DirectX Graphics Infrastructure (DXGI)surface.
 * @remarks
 * To create a DXGImedia buffer, first create the DXGIsurface. Then call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxgisurfacebuffer">MFCreateDXGISurfaceBuffer</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfdxgibuffer
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFDXGIBuffer extends IUnknown {
    /**
     * The interface identifier for IMFDXGIBuffer
     * @type {Guid}
     */
    static IID := Guid("{e7174cfa-1c9e-48b1-8866-626226bfc258}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFDXGIBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetResource         : IntPtr
        GetSubresourceIndex : IntPtr
        GetUnknown          : IntPtr
        SetUnknown          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFDXGIBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queries the Microsoft DirectX Graphics Infrastructure (DXGI)surface for an interface.
     * @remarks
     * You can use this method to get a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11texture2d">ID3D11Texture2D</a> interface of the surface. If the buffer is locked, the method returns <b>MF_E_INVALIDREQUEST</b>.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested.
     * @returns {Pointer<Void>} Receives a pointer to the interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgibuffer-getresource
     */
    GetResource(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * Gets the index of the subresource that is associated with this media buffer.
     * @remarks
     * The subresource index is specified when you create the media buffer object. See <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxgisurfacebuffer">MFCreateDXGISurfaceBuffer</a>.
     * 
     * For more information about texture subresources, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a>.
     * @returns {Integer} Receives the zero-based index of the subresource.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgibuffer-getsubresourceindex
     */
    GetSubresourceIndex() {
        result := ComCall(4, this, "uint*", &puSubresource := 0, "HRESULT")
        return puSubresource
    }

    /**
     * Gets an IUnknown pointer that was previously stored in the media buffer object.
     * @param {Pointer<Guid>} guid The identifier of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested.
     * @returns {Pointer<Void>} Receives a pointer to the interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgibuffer-getunknown
     */
    GetUnknown(guid, riid) {
        result := ComCall(5, this, Guid.Ptr, guid, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * Stores an arbitrary IUnknown pointer in the media buffer object.
     * @remarks
     * To retrieve the pointer from the object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfdxgibuffer-getunknown">IMFDXGIBuffer::GetUnknown</a>.
     * @param {Pointer<Guid>} guid The identifier for the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer. This identifier is used as a key to retrieve the value. It can be any <b>GUID</b> value.
     * @param {IUnknown} pUnkData A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. Set this parameter to <b>NULL</b> to clear a pointer that was previously set.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OBJECT_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An item already exists with this key.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgibuffer-setunknown
     */
    SetUnknown(guid, pUnkData) {
        result := ComCall(6, this, Guid.Ptr, guid, "ptr", pUnkData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFDXGIBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetResource := CallbackCreate(GetMethod(implObj, "GetResource"), flags, 3)
        this.vtbl.GetSubresourceIndex := CallbackCreate(GetMethod(implObj, "GetSubresourceIndex"), flags, 2)
        this.vtbl.GetUnknown := CallbackCreate(GetMethod(implObj, "GetUnknown"), flags, 4)
        this.vtbl.SetUnknown := CallbackCreate(GetMethod(implObj, "SetUnknown"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetResource)
        CallbackFree(this.vtbl.GetSubresourceIndex)
        CallbackFree(this.vtbl.GetUnknown)
        CallbackFree(this.vtbl.SetUnknown)
    }
}

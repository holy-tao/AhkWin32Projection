#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\DirectDraw\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import ".\IStreamSample.ahk" { IStreamSample }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Note  This interface is deprecated.
 * @see https://learn.microsoft.com/windows/win32/api/ddstream/nn-ddstream-idirectdrawstreamsample
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IDirectDrawStreamSample extends IStreamSample {
    /**
     * The interface identifier for IDirectDrawStreamSample
     * @type {Guid}
     */
    static IID := Guid("{f4104fcf-9a70-11d0-8fde-00c04fd9189d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectDrawStreamSample interfaces
    */
    struct Vtbl extends IStreamSample.Vtbl {
        GetSurface : IntPtr
        SetRect    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectDrawStreamSample.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves pointers to the current sample's DirectDraw surface and associated clipping rectangle.
     * @remarks
     * Both parameters are optional. All implementations of this interface must support <b>NULL</b> values as valid parameters. If you retrieve a surface pointer, this method increments its reference count, so you must release the reference.
     * @param {Pointer<IDirectDrawSurface>} ppDirectDrawSurface Address of a pointer to an <b>IDirectDrawSurface</b> interface that specifies the sample's new surface. Set this parameter to <b>NULL</b> if you don't want to specify a new surface.
     * @param {Pointer<RECT>} pRect Pointer to a <b>RECT</b> structure that will contain the current sample's clipping rectangle. Set this parameter to <b>NULL</b> if you don't want to retrieve the clipping rectangle.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/ddstream/nf-ddstream-idirectdrawstreamsample-getsurface
     */
    GetSurface(ppDirectDrawSurface, pRect) {
        result := ComCall(8, this, IDirectDrawSurface.Ptr, ppDirectDrawSurface, RECT.Ptr, pRect, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Changes the clipping rectangle for a sample.
     * @remarks
     * Both parameters are optional; set either to <b>NULL</b> to avoid changing that value. If the surface format doesn't match the stream format, this method fails.
     * 
     * If the new rectangle's size isn't the same as the current rectangle, a call to this method will fail.
     * @param {Pointer<RECT>} pRect Pointer to a <b>RECT</b> structure that specifies the stream's new clipping rectangle.
     * @returns {HRESULT} Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DDERR_INVALIDPIXELFORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream isn't compatible with the pixel format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DDERR_INVALIDRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified rectangle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DDERR_INVALIDSURFACETYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream isn't compatible with the surface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the pointers is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MS_E_SAMPLEALLOC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream format doesn't match the surface and samples are currently allocated to the stream.
     * 
     * </td>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ddstream/nf-ddstream-idirectdrawstreamsample-setrect
     */
    SetRect(pRect) {
        result := ComCall(9, this, RECT.Ptr, pRect, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectDrawStreamSample.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSurface := CallbackCreate(GetMethod(implObj, "GetSurface"), flags, 3)
        this.vtbl.SetRect := CallbackCreate(GetMethod(implObj, "SetRect"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSurface)
        CallbackFree(this.vtbl.SetRect)
    }
}

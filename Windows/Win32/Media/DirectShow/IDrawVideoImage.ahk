#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Note  This interface has been deprecated. (IDrawVideoImage)
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-idrawvideoimage
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IDrawVideoImage extends IUnknown {
    /**
     * The interface identifier for IDrawVideoImage
     * @type {Guid}
     */
    static IID := Guid("{48efb120-ab49-11d2-aed2-00a0c995e8d5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDrawVideoImage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DrawVideoImageBegin : IntPtr
        DrawVideoImageEnd   : IntPtr
        DrawVideoImageDraw  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDrawVideoImage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  This interface has been deprecated. New applications should not use it. The DrawVideoImageBegin method turns off DirectDraw in preparation for a call to the DrawVideoImageDraw method.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idrawvideoimage-drawvideoimagebegin
     */
    DrawVideoImageBegin() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Note  This interface has been deprecated. New applications should not use it. The DrawVideoImageEnd method turns DirectDraw back on after drawing has been performed.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idrawvideoimage-drawvideoimageend
     */
    DrawVideoImageEnd() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Note  This interface has been deprecated. New applications should not use it. The DrawVideoImageDraw method draws the specified source rectangle to the specified destination rectangle in the specified GDI device context.
     * @param {HDC} _hdc Specifies the device context.
     * @param {Pointer<RECT>} lprcSrc Pointer to a <b>RECT</b> structure that specifies the source rectangle, as a subrectangle of the current video frame.
     * @param {Pointer<RECT>} lprcDst Pointer to a <b>RECT</b> structure that specifies the destination rectangle in the device context.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idrawvideoimage-drawvideoimagedraw
     */
    DrawVideoImageDraw(_hdc, lprcSrc, lprcDst) {
        result := ComCall(5, this, HDC, _hdc, RECT.Ptr, lprcSrc, RECT.Ptr, lprcDst, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDrawVideoImage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DrawVideoImageBegin := CallbackCreate(GetMethod(implObj, "DrawVideoImageBegin"), flags, 1)
        this.vtbl.DrawVideoImageEnd := CallbackCreate(GetMethod(implObj, "DrawVideoImageEnd"), flags, 1)
        this.vtbl.DrawVideoImageDraw := CallbackCreate(GetMethod(implObj, "DrawVideoImageDraw"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DrawVideoImageBegin)
        CallbackFree(this.vtbl.DrawVideoImageEnd)
        CallbackFree(this.vtbl.DrawVideoImageDraw)
    }
}

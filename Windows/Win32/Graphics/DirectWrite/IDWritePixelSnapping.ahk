#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_MATRIX.ahk" { DWRITE_MATRIX }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines the pixel snapping properties such as pixels per DIP(device-independent pixel) and the current transform matrix of a text renderer.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritepixelsnapping
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWritePixelSnapping extends IUnknown {
    /**
     * The interface identifier for IDWritePixelSnapping
     * @type {Guid}
     */
    static IID := Guid("{eaf3a2da-ecf4-4d24-b644-b34f6842024b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWritePixelSnapping interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsPixelSnappingDisabled : IntPtr
        GetCurrentTransform     : IntPtr
        GetPixelsPerDip         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWritePixelSnapping.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Void>} clientDrawingContext 
     * @returns {BOOL} 
     */
    IsPixelSnappingDisabled(clientDrawingContext) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, clientDrawingContextMarshal, clientDrawingContext, BOOL.Ptr, &isDisabled := 0, "HRESULT")
        return isDisabled
    }

    /**
     * Gets a transform that maps abstract coordinates to DIPs.
     * @param {Pointer<Void>} clientDrawingContext Type: <b>void*</b>
     * 
     * The drawing context passed to <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-draw">IDWriteTextLayout::Draw</a>.
     * @returns {DWRITE_MATRIX} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * When this method returns, contains a structure which has transform information for  pixel snapping.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritepixelsnapping-getcurrenttransform
     */
    GetCurrentTransform(clientDrawingContext) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        transform := DWRITE_MATRIX()
        result := ComCall(4, this, clientDrawingContextMarshal, clientDrawingContext, DWRITE_MATRIX.Ptr, transform, "HRESULT")
        return transform
    }

    /**
     * Gets the number of physical pixels per DIP.
     * @remarks
     * Because a DIP (device-independent pixel) is 1/96 inch, 
     *       the <i>pixelsPerDip</i> value is the number of logical pixels per inch divided by 96.
     * @param {Pointer<Void>} clientDrawingContext Type: <b>void*</b>
     * 
     * The drawing context passed to <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetextlayout-draw">IDWriteTextLayout::Draw</a>.
     * @returns {Float} Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the number of physical pixels per DIP.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritepixelsnapping-getpixelsperdip
     */
    GetPixelsPerDip(clientDrawingContext) {
        clientDrawingContextMarshal := clientDrawingContext is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, clientDrawingContextMarshal, clientDrawingContext, "float*", &pixelsPerDip := 0, "HRESULT")
        return pixelsPerDip
    }

    Query(iid) {
        if (IDWritePixelSnapping.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsPixelSnappingDisabled := CallbackCreate(GetMethod(implObj, "IsPixelSnappingDisabled"), flags, 3)
        this.vtbl.GetCurrentTransform := CallbackCreate(GetMethod(implObj, "GetCurrentTransform"), flags, 3)
        this.vtbl.GetPixelsPerDip := CallbackCreate(GetMethod(implObj, "GetPixelsPerDip"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsPixelSnappingDisabled)
        CallbackFree(this.vtbl.GetCurrentTransform)
        CallbackFree(this.vtbl.GetPixelsPerDip)
    }
}

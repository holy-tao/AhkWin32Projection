#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * Native interoperation interface that allows drawing on a surface object using a RECT to define the area to draw into. This interface is available in C++ only.
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositiondrawingsurfaceinterop
 * @namespace Windows.Win32.System.WinRT.Composition
 */
export default struct ICompositionDrawingSurfaceInterop extends IUnknown {
    /**
     * The interface identifier for ICompositionDrawingSurfaceInterop
     * @type {Guid}
     */
    static IID := Guid("{fd04e6e3-fe0c-4c3c-ab19-a07601a576ee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICompositionDrawingSurfaceInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BeginDraw   : IntPtr
        EndDraw     : IntPtr
        Resize      : IntPtr
        Scroll      : IntPtr
        ResumeDraw  : IntPtr
        SuspendDraw : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICompositionDrawingSurfaceInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initiates drawing on the surface.
     * @param {Pointer<RECT>} updateRect Type: <b>const RECT*</b>
     * 
     * The section of the surface to update. The update rectangle must be within the boundaries of the surface. Specifying nullptr indicates the entire surface should be updated.
     * @param {Pointer<Guid>} iid Type: <b>REFIID</b>
     * 
     * The identifier of the interface to retrieve.
     * @param {Pointer<Pointer<Void>>} updateObject Type: <b>void**</b>
     * 
     * Receives an interface pointer of the type specified in the iid parameter. This parameter must not be NULL.
     * @param {Pointer<POINT>} updateOffset Type: <b>POINT*</b>
     * 
     * The offset into the surface where the application should draw updated content. This offset will reference the upper left corner of the update rectangle.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-begindraw
     */
    BeginDraw(updateRect, iid, updateObject, updateOffset) {
        updateObjectMarshal := updateObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, RECT.Ptr, updateRect, Guid.Ptr, iid, updateObjectMarshal, updateObject, POINT.Ptr, updateOffset, "HRESULT")
        return result
    }

    /**
     * Marks the end of drawing on the surface object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-enddraw
     */
    EndDraw() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Changes the size of the surface.
     * @param {SIZE} sizePixels Type: <b>SIZE</b>
     * 
     * Width and height of the surface in pixels.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-resize
     */
    Resize(sizePixels) {
        result := ComCall(5, this, SIZE, sizePixels, "HRESULT")
        return result
    }

    /**
     * Scrolls a rectangular area of the logical surface.
     * @param {Pointer<RECT>} scrollRect Type: <b>const RECT*</b>
     * 
     * The rectangular area of the surface to be scrolled, relative to the upper-left corner of the surface. If this parameter is NULL, the entire surface is scrolled.
     * @param {Pointer<RECT>} clipRect Type: <b>const RECT*</b>
     * 
     * The clipRect clips the destination (scrollRect after offset) of the scroll. The only bitmap content that will be scrolled are those that remain inside the clip rectangle after the scroll is completed.
     * @param {Integer} offsetX Type: <b>int</b>
     * 
     * The amount of horizontal scrolling, in pixels. Use positive values to scroll right, and negative values to scroll left.
     * @param {Integer} offsetY Type: <b>int</b>
     * 
     * The amount of vertical scrolling, in pixels. Use positive values to scroll down, and negative values to scroll up.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-scroll
     */
    Scroll(scrollRect, clipRect, offsetX, offsetY) {
        result := ComCall(6, this, RECT.Ptr, scrollRect, RECT.Ptr, clipRect, "int", offsetX, "int", offsetY, "HRESULT")
        return result
    }

    /**
     * Resumes drawing on the surface object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-resumedraw
     */
    ResumeDraw() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Suspends drawing on the surface object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-suspenddraw
     */
    SuspendDraw() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICompositionDrawingSurfaceInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginDraw := CallbackCreate(GetMethod(implObj, "BeginDraw"), flags, 5)
        this.vtbl.EndDraw := CallbackCreate(GetMethod(implObj, "EndDraw"), flags, 1)
        this.vtbl.Resize := CallbackCreate(GetMethod(implObj, "Resize"), flags, 2)
        this.vtbl.Scroll := CallbackCreate(GetMethod(implObj, "Scroll"), flags, 5)
        this.vtbl.ResumeDraw := CallbackCreate(GetMethod(implObj, "ResumeDraw"), flags, 1)
        this.vtbl.SuspendDraw := CallbackCreate(GetMethod(implObj, "SuspendDraw"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginDraw)
        CallbackFree(this.vtbl.EndDraw)
        CallbackFree(this.vtbl.Resize)
        CallbackFree(this.vtbl.Scroll)
        CallbackFree(this.vtbl.ResumeDraw)
        CallbackFree(this.vtbl.SuspendDraw)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1Bitmap1.ahk" { ID2D1Bitmap1 }
#Import ".\ID2D1RenderInfo.ahk" { ID2D1RenderInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1Transform.ahk" { ID2D1Transform }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "Common\D2D_POINT_2U.ahk" { D2D_POINT_2U }

/**
 * Represents a CPU-based rasterization stage in the transform pipeline graph.
 * @remarks
 * <b>ID2D1SourceTransform</b> specializes an implementation of the Shantzis calculations to a transform implemented as the source of an effect graph with the data being provided from sytem memory.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1sourcetransform
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1SourceTransform extends ID2D1Transform {
    /**
     * The interface identifier for ID2D1SourceTransform
     * @type {Guid}
     */
    static IID := Guid("{db1800dd-0c34-4cf9-be90-31cc0a5653e1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1SourceTransform interfaces
    */
    struct Vtbl extends ID2D1Transform.Vtbl {
        SetRenderInfo : IntPtr
        Draw          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1SourceTransform.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the render information for the transform.
     * @remarks
     * Provides a render information interface to the source transform to allow it to specify state to the rendering system.
     * @param {ID2D1RenderInfo} renderInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1renderinfo">ID2D1RenderInfo</a>*</b>
     * 
     * The interface supplied to the transform to allow specifying the CPU based transform pass.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1sourcetransform-setrenderinfo
     */
    SetRenderInfo(renderInfo) {
        result := ComCall(7, this, "ptr", renderInfo, "HRESULT")
        return result
    }

    /**
     * Draws the transform to the graphics processing unit (GPU)–based Direct2D pipeline.
     * @remarks
     * The implementation of the rasterizer guarantees that adding the <i>renderRect</i> to the <i>targetOrigin</i> does not exceed the bounds of the bitmap.
     * 
     * When implementing this method you must update the bitmap in this way: 
     * 
     * <ol>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1bitmap1-map">ID2D1Bitmap::Map</a> method with the  D2D1_MAP_OPTIONS_DISCARD and D2D1_MAP_OPTIONS_WRITE
     * flags.</li>
     * <li>Update the buffer this method returns.</li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1bitmap1-unmap">ID2D1Bitmap::Unmap</a> method.</li>
     * </ol>
     * If you  set the buffer precision manually on the associated <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1renderinfo">ID2D1RenderInfo</a> object, it must handle different pixel formats in this method by calling <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1bitmap-getpixelformat">ID2D1Bitmap::GetPixelFormat</a>.  If you set the buffer precision manually, then you can rely on that format always being the one you provided.
     * @param {ID2D1Bitmap1} target Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1bitmap1">ID2D1Bitmap1</a>*</b>
     * 
     * The target to which the transform should be written.
     * @param {Pointer<RECT>} drawRect Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh847950(v=vs.85)">D2D1_RECT_L</a>*</b>
     * 
     * The area within the source from which the image should be drawn.
     * @param {D2D_POINT_2U} targetOrigin Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2u">D2D1_POINT_2U</a></b>
     * 
     * The origin within the target bitmap to which the source data should be drawn.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1sourcetransform-draw
     */
    Draw(target, drawRect, targetOrigin) {
        result := ComCall(8, this, "ptr", target, RECT.Ptr, drawRect, D2D_POINT_2U, targetOrigin, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1SourceTransform.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetRenderInfo := CallbackCreate(GetMethod(implObj, "SetRenderInfo"), flags, 2)
        this.vtbl.Draw := CallbackCreate(GetMethod(implObj, "Draw"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetRenderInfo)
        CallbackFree(this.vtbl.Draw)
    }
}

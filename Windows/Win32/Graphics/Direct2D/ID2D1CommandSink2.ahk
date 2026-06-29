#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1CommandSink1.ahk" { ID2D1CommandSink1 }
#Import ".\ID2D1GradientMesh.ahk" { ID2D1GradientMesh }
#Import ".\ID2D1InkStyle.ahk" { ID2D1InkStyle }
#Import "Common\D2D_RECT_F.ahk" { D2D_RECT_F }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1Brush.ahk" { ID2D1Brush }
#Import ".\ID2D1Ink.ahk" { ID2D1Ink }
#Import ".\ID2D1GdiMetafile.ahk" { ID2D1GdiMetafile }

/**
 * This interface performs all the same functions as the existing ID2D1CommandSink1 interface. It also enables access to ink rendering and gradient mesh rendering.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1commandsink2
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1CommandSink2 extends ID2D1CommandSink1 {
    /**
     * The interface identifier for ID2D1CommandSink2
     * @type {Guid}
     */
    static IID := Guid("{3bab440e-417e-47df-a2e2-bc0be6a00916}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1CommandSink2 interfaces
    */
    struct Vtbl extends ID2D1CommandSink1.Vtbl {
        DrawInk          : IntPtr
        DrawGradientMesh : IntPtr
        DrawGdiMetafile  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1CommandSink2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Renders the given ink object using the given brush and ink style. (ID2D1CommandSink2.DrawInk)
     * @param {ID2D1Ink} _ink Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1ink">ID2D1Ink</a>*</b>
     * 
     * The ink object to be rendered.
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush with which to render the ink object.
     * @param {ID2D1InkStyle} inkStyle Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1inkstyle">ID2D1InkStyle</a>*</b>
     * 
     * The ink style to use when rendering the ink object.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1commandsink2-drawink
     */
    DrawInk(_ink, brush, inkStyle) {
        result := ComCall(29, this, "ptr", _ink, "ptr", brush, "ptr", inkStyle, "HRESULT")
        return result
    }

    /**
     * Renders a given gradient mesh to the target. (ID2D1CommandSink2.DrawGradientMesh)
     * @param {ID2D1GradientMesh} gradientMesh Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1gradientmesh">ID2D1GradientMesh</a>*</b>
     * 
     * The gradient mesh to be rendered.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1commandsink2-drawgradientmesh
     */
    DrawGradientMesh(gradientMesh) {
        result := ComCall(30, this, "ptr", gradientMesh, "HRESULT")
        return result
    }

    /**
     * Draws a metafile to the command sink using the given source and destination rectangles.
     * @param {ID2D1GdiMetafile} gdiMetafile Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1gdimetafile">ID2D1GdiMetafile</a>*</b>
     * 
     * The metafile to draw.
     * @param {Pointer<D2D_RECT_F>} destinationRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The rectangle in the target where the metafile will be drawn, relative to the upper left corner (defined in DIPs). If NULL is specified, the destination rectangle is the size of the target.
     * @param {Pointer<D2D_RECT_F>} sourceRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The rectangle of the source metafile that will be drawn, relative to the upper left corner (defined in DIPs). 
     *      If NULL is specified, the source rectangle is the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nf-d2d1_3-id2d1gdimetafile1-getsourcebounds">ID2D1GdiMetafile1::GetSourceBounds</a>.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1commandsink2-drawgdimetafile
     */
    DrawGdiMetafile(gdiMetafile, destinationRectangle, sourceRectangle) {
        result := ComCall(31, this, "ptr", gdiMetafile, D2D_RECT_F.Ptr, destinationRectangle, D2D_RECT_F.Ptr, sourceRectangle, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1CommandSink2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DrawInk := CallbackCreate(GetMethod(implObj, "DrawInk"), flags, 4)
        this.vtbl.DrawGradientMesh := CallbackCreate(GetMethod(implObj, "DrawGradientMesh"), flags, 2)
        this.vtbl.DrawGdiMetafile := CallbackCreate(GetMethod(implObj, "DrawGdiMetafile"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DrawInk)
        CallbackFree(this.vtbl.DrawGradientMesh)
        CallbackFree(this.vtbl.DrawGdiMetafile)
    }
}

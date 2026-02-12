#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Native interoperation interface that allows drawing on a surface object using a RECT to define the area to draw into. This interface is available in C++ only.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositiondrawingsurfaceinterop
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class ICompositionDrawingSurfaceInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionDrawingSurfaceInterop
     * @type {Guid}
     */
    static IID => Guid("{fd04e6e3-fe0c-4c3c-ab19-a07601a576ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginDraw", "EndDraw", "Resize", "Scroll", "ResumeDraw", "SuspendDraw"]

    /**
     * Initiates drawing on the surface.
     * @param {Pointer<RECT>} updateRect Type: <b>const RECT*</b>
     * 
     * The section of the surface to update. The update rectangle must be within the boundaries of the surface. Specifying nullptr indicates the entire surface should be updated.
     * @param {Pointer<Guid>} iid Type: <b>REFIID</b>
     * 
     * The identifier of the interface to retrieve.
     * @param {Pointer<Pointer<Pointer<Void>>>} updateObject Type: <b>void**</b>
     * 
     * Receives an interface pointer of the type specified in the iid parameter. This parameter must not be NULL.
     * @param {Pointer<POINT>} updateOffset Type: <b>POINT*</b>
     * 
     * The offset into the surface where the application should draw updated content. This offset will reference the upper left corner of the update rectangle.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-begindraw
     */
    BeginDraw(updateRect, iid, updateObject, updateOffset) {
        updateObjectMarshal := updateObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", updateRect, "ptr", iid, updateObjectMarshal, updateObject, "ptr", updateOffset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Marks the end of drawing on the surface object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-enddraw
     */
    EndDraw() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-resize
     */
    Resize(sizePixels) {
        result := ComCall(5, this, "ptr", sizePixels, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-scroll
     */
    Scroll(scrollRect, clipRect, offsetX, offsetY) {
        result := ComCall(6, this, "ptr", scrollRect, "ptr", clipRect, "int", offsetX, "int", offsetY, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Resumes drawing on the surface object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-resumedraw
     */
    ResumeDraw() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Suspends drawing on the surface object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-suspenddraw
     */
    SuspendDraw() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

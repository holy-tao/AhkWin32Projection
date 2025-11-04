#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositiondrawingsurfaceinterop
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
     * 
     * @param {Pointer<RECT>} updateRect 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} updateObject 
     * @param {Pointer<POINT>} updateOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-begindraw
     */
    BeginDraw(updateRect, iid, updateObject, updateOffset) {
        updateObjectMarshal := updateObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", updateRect, "ptr", iid, updateObjectMarshal, updateObject, "ptr", updateOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-enddraw
     */
    EndDraw() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {SIZE} sizePixels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-resize
     */
    Resize(sizePixels) {
        result := ComCall(5, this, "ptr", sizePixels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} scrollRect 
     * @param {Pointer<RECT>} clipRect 
     * @param {Integer} offsetX 
     * @param {Integer} offsetY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-scroll
     */
    Scroll(scrollRect, clipRect, offsetX, offsetY) {
        result := ComCall(6, this, "ptr", scrollRect, "ptr", clipRect, "int", offsetX, "int", offsetY, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-resumedraw
     */
    ResumeDraw() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop-suspenddraw
     */
    SuspendDraw() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}

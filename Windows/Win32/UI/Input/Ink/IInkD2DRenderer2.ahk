#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\INK_HIGH_CONTRAST_ADJUSTMENT.ahk" { INK_HIGH_CONTRAST_ADJUSTMENT }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * An IInkD2DRenderer2 object enables the rendering of ink strokes onto the designated Direct2D device context of a Universal Windows app, instead of the default InkCanvas control.
 * @remarks
 * This interface provides an overload of the [IInkD2DRenderer::Draw](nf-inkrenderer-iinkd2drenderer-draw.md) method to support contrast theme settings in Windows 11 and newer.
 * @see https://learn.microsoft.com/windows/win32/api/inkrenderer/nn-inkrenderer-iinkd2drenderer2
 * @namespace Windows.Win32.UI.Input.Ink
 */
export default struct IInkD2DRenderer2 extends IUnknown {
    /**
     * The interface identifier for IInkD2DRenderer2
     * @type {Guid}
     */
    static IID := Guid("{0a95dcd9-4578-4b71-b20b-bf664d4bfeee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkD2DRenderer2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Draw : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkD2DRenderer2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Renders the ink stroke to the designated Direct2D device context of the app.
     * @param {IUnknown} pD2D1DeviceContext Pointer to the designated Direct2D device context of the app.
     * @param {IUnknown} pInkStrokeIterable Pointer to the collection of ink strokes to render.
     * @param {INK_HIGH_CONTRAST_ADJUSTMENT} highContrastAdjustment One of the values from the [INK_HIGH_CONTRAST_ADJUSTMENT enum](ne-inkrenderer-ink_high_contrast_adjustment.md).
     * @returns {HRESULT} If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/inkrenderer/nf-inkrenderer-iinkd2drenderer2-draw
     */
    Draw(pD2D1DeviceContext, pInkStrokeIterable, highContrastAdjustment) {
        result := ComCall(3, this, "ptr", pD2D1DeviceContext, "ptr", pInkStrokeIterable, INK_HIGH_CONTRAST_ADJUSTMENT, highContrastAdjustment, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInkD2DRenderer2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Draw := CallbackCreate(GetMethod(implObj, "Draw"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Draw)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * An IInkD2DRenderer object enables the rendering of ink strokes onto the designated Direct2D device context of a Universal Windows app, instead of the default InkCanvas control.
 * @remarks
 * See the [IInkD2DRenderer::Draw](nf-inkrenderer-iinkd2drenderer-draw.md) method if you need to support Windows 11 contrast theme settings.
 * @see https://learn.microsoft.com/windows/win32/api/inkrenderer/nn-inkrenderer-iinkd2drenderer
 * @namespace Windows.Win32.UI.Input.Ink
 */
export default struct IInkD2DRenderer extends IUnknown {
    /**
     * The interface identifier for IInkD2DRenderer
     * @type {Guid}
     */
    static IID := Guid("{407fb1de-f85a-4150-97cf-b7fb274fb4f8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkD2DRenderer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Draw : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkD2DRenderer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Renders the ink stroke to the designated Direct2D device context of the app.
     * @param {IUnknown} pD2D1DeviceContext Pointer to the designated Direct2D device context of the app.
     * @param {IUnknown} pInkStrokeIterable Pointer to the collection of ink strokes to render.
     * @param {BOOL} fHighContrast True, if the high-contrast accessibility option, in Windows 10 and earlier, is currently selected (Settings -> Ease of Access -> High Contrast -> Use high contrast). Otherwise, false.
     * 
     * Listen for the [HighContrastChanged](/uwp/api/windows.ui.viewmanagement.accessibilitysettings.highcontrastchanged) event to set this value appropriately.
     * @returns {HRESULT} If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/inkrenderer/nf-inkrenderer-iinkd2drenderer-draw
     */
    Draw(pD2D1DeviceContext, pInkStrokeIterable, fHighContrast) {
        result := ComCall(3, this, "ptr", pD2D1DeviceContext, "ptr", pInkStrokeIterable, BOOL, fHighContrast, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInkD2DRenderer.IID.Equals(iid)) {
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

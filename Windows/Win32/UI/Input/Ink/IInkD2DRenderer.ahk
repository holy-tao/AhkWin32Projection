#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An IInkD2DRenderer object enables the rendering of ink strokes onto the designated Direct2D device context of a Universal Windows app, instead of the default InkCanvas control.
 * @remarks
 * See the [IInkD2DRenderer::Draw](nf-inkrenderer-iinkd2drenderer-draw.md) method if you need to support Windows 11 contrast theme settings.
 * @see https://learn.microsoft.com/windows/win32/api/inkrenderer/nn-inkrenderer-iinkd2drenderer
 * @namespace Windows.Win32.UI.Input.Ink
 * @version v4.0.30319
 */
class IInkD2DRenderer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkD2DRenderer
     * @type {Guid}
     */
    static IID => Guid("{407fb1de-f85a-4150-97cf-b7fb274fb4f8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Draw"]

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
        result := ComCall(3, this, "ptr", pD2D1DeviceContext, "ptr", pInkStrokeIterable, "int", fHighContrast, "HRESULT")
        return result
    }
}

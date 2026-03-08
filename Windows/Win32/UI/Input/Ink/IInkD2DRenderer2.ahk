#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An IInkD2DRenderer2 object enables the rendering of ink strokes onto the designated Direct2D device context of a Universal Windows app, instead of the default InkCanvas control.
 * @remarks
 * This interface provides an overload of the [IInkD2DRenderer::Draw](nf-inkrenderer-iinkd2drenderer-draw.md) method to support contrast theme settings in Windows 11 and newer.
 * @see https://learn.microsoft.com/windows/win32/api/inkrenderer/nn-inkrenderer-iinkd2drenderer2
 * @namespace Windows.Win32.UI.Input.Ink
 * @version v4.0.30319
 */
class IInkD2DRenderer2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkD2DRenderer2
     * @type {Guid}
     */
    static IID => Guid("{0a95dcd9-4578-4b71-b20b-bf664d4bfeee}")

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
     * @param {Integer} highContrastAdjustment One of the values from the [INK_HIGH_CONTRAST_ADJUSTMENT enum](ne-inkrenderer-ink_high_contrast_adjustment.md).
     * @returns {HRESULT} If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/inkrenderer/nf-inkrenderer-iinkd2drenderer2-draw
     */
    Draw(pD2D1DeviceContext, pInkStrokeIterable, highContrastAdjustment) {
        result := ComCall(3, this, "ptr", pD2D1DeviceContext, "ptr", pInkStrokeIterable, "int", highContrastAdjustment, "HRESULT")
        return result
    }
}

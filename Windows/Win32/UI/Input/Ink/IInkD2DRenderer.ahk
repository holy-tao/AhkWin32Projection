#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An IInkD2DRenderer object enables the rendering of ink strokes onto the designated Direct2D device context of a Universal Windows app, instead of the default InkCanvas control.
 * @see https://docs.microsoft.com/windows/win32/api//inkrenderer/nn-inkrenderer-iinkd2drenderer
 * @namespace Windows.Win32.UI.Input.Ink
 * @version v4.0.30319
 */
class IInkD2DRenderer extends IUnknown{
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
     * 
     * @param {Pointer<IUnknown>} pD2D1DeviceContext 
     * @param {Pointer<IUnknown>} pInkStrokeIterable 
     * @param {BOOL} fHighContrast 
     * @returns {HRESULT} 
     */
    Draw(pD2D1DeviceContext, pInkStrokeIterable, fHighContrast) {
        result := ComCall(3, this, "ptr", pD2D1DeviceContext, "ptr", pInkStrokeIterable, "int", fHighContrast, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Imaging\IWICBitmapSource.ahk
#Include .\IMILBitmapEffectGroup.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that define a Windows Presentation Foundation (WPF) bitmap effect.
 * @remarks
 * 
 * <b>IMILBitmapEffect</b> is a wrapper for a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectprimitive">IMILBitmapEffectPrimitive</a>. A <b>IMILBitmapEffectPrimitive</b> is wrapped by a <b>IMILBitmapEffect</b> through Component Object Model (COM) aggregation.
 *             Therefore, independent software vendor (ISV) effect writers do not need to implement the <b>IMILBitmapEffect</b>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectimpl">IMILBitmapEffectImpl</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectconnections">IMILBitmapEffectConnections</a> interfaces.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffect
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffect extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMILBitmapEffect
     * @type {Guid}
     */
    static IID => Guid("{8a6ff321-c944-4a1b-9944-9954af301258}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOutput", "GetParentEffect", "SetInputSource"]

    /**
     * Gets the output of the effect.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * The output index.
     * @param {IMILBitmapEffectRenderContext} pContext Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext">IMILBitmapEffectRenderContext</a>*</b>
     * 
     * A pointer to the render context of the effect.
     * @returns {IWICBitmapSource} Type: <b>IWICBitmapSource**</b>
     * 
     * A pointer that receives a pointer to the effect's output.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffect-getoutput
     */
    GetOutput(uiIndex, pContext) {
        result := ComCall(3, this, "uint", uiIndex, "ptr", pContext, "ptr*", &ppBitmapSource := 0, "HRESULT")
        return IWICBitmapSource(ppBitmapSource)
    }

    /**
     * Gets a parent of the effect.
     * @returns {IMILBitmapEffectGroup} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectgroup">IMILBitmapEffectGroup</a>**</b>
     * 
     * A pointer that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectgroup">IMILBitmapEffectGroup</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffect-getparenteffect
     */
    GetParentEffect() {
        result := ComCall(4, this, "ptr*", &ppParentEffect := 0, "HRESULT")
        return IMILBitmapEffectGroup(ppParentEffect)
    }

    /**
     * Sets the effect input source.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * The input index.
     * @param {IWICBitmapSource} pBitmapSource Type: <b>IWICBitmapSource*</b>
     * 
     * A pointer to the effect's bitmap source.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffect-setinputsource
     */
    SetInputSource(uiIndex, pBitmapSource) {
        result := ComCall(5, this, "uint", uiIndex, "ptr", pBitmapSource, "HRESULT")
        return result
    }
}

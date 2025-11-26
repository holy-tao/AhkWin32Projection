#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMILBitmapEffects.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that define an effect group.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectgroupimpl
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectGroupImpl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMILBitmapEffectGroupImpl
     * @type {Guid}
     */
    static IID => Guid("{78fed518-1cfc-4807-8b85-6b6e51398f62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Preprocess", "GetNumberChildren", "GetChildren"]

    /**
     * Pre-process the given render context.
     * @param {IMILBitmapEffectRenderContext} pContext Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext">IMILBitmapEffectRenderContext</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext">IMILBitmapEffectRenderContext</a> to process.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectgroupimpl-preprocess
     */
    Preprocess(pContext) {
        result := ComCall(3, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of children in an effect group.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * A pointer that receives the number of effects in the group.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectgroupimpl-getnumberchildren
     */
    GetNumberChildren() {
        result := ComCall(4, this, "uint*", &puiNumberChildren := 0, "HRESULT")
        return puiNumberChildren
    }

    /**
     * Gets the children of the effect group.
     * @returns {IMILBitmapEffects} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffects">IMILBitmapEffects</a>**</b>
     * 
     * A pointer that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffects">IMILBitmapEffects</a> group.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectgroupimpl-getchildren
     */
    GetChildren() {
        result := ComCall(5, this, "ptr*", &pChildren := 0, "HRESULT")
        return IMILBitmapEffects(pChildren)
    }
}

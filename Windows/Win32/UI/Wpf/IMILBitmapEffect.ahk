#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IMILBitmapEffectRenderContext>} pContext 
     * @param {Pointer<IWICBitmapSource>} ppBitmapSource 
     * @returns {HRESULT} 
     */
    GetOutput(uiIndex, pContext, ppBitmapSource) {
        result := ComCall(3, this, "uint", uiIndex, "ptr", pContext, "ptr", ppBitmapSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMILBitmapEffectGroup>} ppParentEffect 
     * @returns {HRESULT} 
     */
    GetParentEffect(ppParentEffect) {
        result := ComCall(4, this, "ptr", ppParentEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IWICBitmapSource>} pBitmapSource 
     * @returns {HRESULT} 
     */
    SetInputSource(uiIndex, pBitmapSource) {
        result := ComCall(5, this, "uint", uiIndex, "ptr", pBitmapSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

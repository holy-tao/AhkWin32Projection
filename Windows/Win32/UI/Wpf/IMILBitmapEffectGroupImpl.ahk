#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that define an effect group.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectgroupimpl
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectGroupImpl extends IUnknown{
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
     * 
     * @param {Pointer<IMILBitmapEffectRenderContext>} pContext 
     * @returns {HRESULT} 
     */
    Preprocess(pContext) {
        result := ComCall(3, this, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puiNumberChildren 
     * @returns {HRESULT} 
     */
    GetNumberChildren(puiNumberChildren) {
        result := ComCall(4, this, "uint*", puiNumberChildren, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMILBitmapEffects>} pChildren 
     * @returns {HRESULT} 
     */
    GetChildren(pChildren) {
        result := ComCall(5, this, "ptr", pChildren, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

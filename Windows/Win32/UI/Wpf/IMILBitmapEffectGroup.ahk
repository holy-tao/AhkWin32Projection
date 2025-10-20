#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods used to access a group of effects.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectgroup
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectGroup extends IUnknown{
    /**
     * The interface identifier for IMILBitmapEffectGroup
     * @type {Guid}
     */
    static IID => Guid("{2f952360-698a-4ac6-81a1-bcfdf08eb8e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IMILBitmapEffectOutputConnector>} ppConnector 
     * @returns {HRESULT} 
     */
    GetInteriorInputConnector(uiIndex, ppConnector) {
        result := ComCall(3, this, "uint", uiIndex, "ptr", ppConnector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IMILBitmapEffectInputConnector>} ppConnector 
     * @returns {HRESULT} 
     */
    GetInteriorOutputConnector(uiIndex, ppConnector) {
        result := ComCall(4, this, "uint", uiIndex, "ptr", ppConnector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMILBitmapEffect>} pEffect 
     * @returns {HRESULT} 
     */
    Add(pEffect) {
        result := ComCall(5, this, "ptr", pEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

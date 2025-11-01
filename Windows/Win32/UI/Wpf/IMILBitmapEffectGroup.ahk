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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInteriorInputConnector", "GetInteriorOutputConnector", "Add"]

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IMILBitmapEffectOutputConnector>} ppConnector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectgroup-getinteriorinputconnector
     */
    GetInteriorInputConnector(uiIndex, ppConnector) {
        result := ComCall(3, this, "uint", uiIndex, "ptr*", ppConnector, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IMILBitmapEffectInputConnector>} ppConnector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectgroup-getinterioroutputconnector
     */
    GetInteriorOutputConnector(uiIndex, ppConnector) {
        result := ComCall(4, this, "uint", uiIndex, "ptr*", ppConnector, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMILBitmapEffect} pEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectgroup-add
     */
    Add(pEffect) {
        result := ComCall(5, this, "ptr", pEffect, "HRESULT")
        return result
    }
}

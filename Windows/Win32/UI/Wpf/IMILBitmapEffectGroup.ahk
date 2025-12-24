#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMILBitmapEffectOutputConnector.ahk
#Include .\IMILBitmapEffectInputConnector.ahk
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
     * Retrieves the input connector for an effect at the given index.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * The index of the effect to retrieve the connector.
     * @returns {IMILBitmapEffectOutputConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnector">IMILBitmapEffectOutputConnector</a>**</b>
     * 
     * A pointer that receives a pointer to the desired effects input connector.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectgroup-getinteriorinputconnector
     */
    GetInteriorInputConnector(uiIndex) {
        result := ComCall(3, this, "uint", uiIndex, "ptr*", &ppConnector := 0, "HRESULT")
        return IMILBitmapEffectOutputConnector(ppConnector)
    }

    /**
     * Retrieves the output connector for an effect at the given index.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * The index of the effect to retrieve the connector.
     * @returns {IMILBitmapEffectInputConnector} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectinputconnector">IMILBitmapEffectInputConnector</a>**</b>
     * 
     * A pointer that receives a pointer to the desired effects output connector.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectgroup-getinterioroutputconnector
     */
    GetInteriorOutputConnector(uiIndex) {
        result := ComCall(4, this, "uint", uiIndex, "ptr*", &ppConnector := 0, "HRESULT")
        return IMILBitmapEffectInputConnector(ppConnector)
    }

    /**
     * Adds an effect to the IMILBitmapEffectGroup.
     * @param {IMILBitmapEffect} pEffect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffect">IMILBitmapEffect</a>*</b>
     * 
     * A pointer to the effect to add to the group.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectgroup-add
     */
    Add(pEffect) {
        result := ComCall(5, this, "ptr", pEffect, "HRESULT")
        return result
    }
}

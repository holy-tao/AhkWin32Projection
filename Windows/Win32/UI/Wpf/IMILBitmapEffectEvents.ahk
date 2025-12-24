#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that define an effect event.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectevents
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMILBitmapEffectEvents
     * @type {Guid}
     */
    static IID => Guid("{2e880dd8-f8ce-457b-8199-d60bb3d7ef98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PropertyChange", "DirtyRegion"]

    /**
     * Notifies an IMILBitmapEffectPrimitive of a property change.
     * @param {IMILBitmapEffect} pEffect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffect">IMILBitmapEffect</a>*</b>
     * 
     * The effect primitive to notify.
     * @param {BSTR} bstrPropertyName Type: <b>BSTR</b>
     * 
     * The property that has changed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectevents-propertychange
     */
    PropertyChange(pEffect, bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(3, this, "ptr", pEffect, "ptr", bstrPropertyName, "HRESULT")
        return result
    }

    /**
     * Invalidates the specified region of the given IMILBitmapEffectPrimitive.
     * @param {IMILBitmapEffect} pEffect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffect">IMILBitmapEffect</a>*</b>
     * 
     * A pointer to the primitive to dirty.
     * @param {Pointer<MilRectD>} pRect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milrectd">MIL_RECTD</a>*</b>
     * 
     * A pointer to the rectangle to dirty.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectevents-dirtyregion
     */
    DirtyRegion(pEffect, pRect) {
        result := ComCall(4, this, "ptr", pEffect, "ptr", pRect, "HRESULT")
        return result
    }
}

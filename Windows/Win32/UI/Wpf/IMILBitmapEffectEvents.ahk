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
     * 
     * @param {IMILBitmapEffect} pEffect 
     * @param {BSTR} bstrPropertyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectevents-propertychange
     */
    PropertyChange(pEffect, bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(3, this, "ptr", pEffect, "ptr", bstrPropertyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMILBitmapEffect} pEffect 
     * @param {Pointer<MilRectD>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectevents-dirtyregion
     */
    DirtyRegion(pEffect, pRect) {
        result := ComCall(4, this, "ptr", pEffect, "ptr", pRect, "HRESULT")
        return result
    }
}

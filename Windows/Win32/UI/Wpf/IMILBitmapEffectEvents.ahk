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
     * 
     * @param {Pointer<IMILBitmapEffect>} pEffect 
     * @param {BSTR} bstrPropertyName 
     * @returns {HRESULT} 
     */
    PropertyChange(pEffect, bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(3, this, "ptr", pEffect, "ptr", bstrPropertyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMILBitmapEffect>} pEffect 
     * @param {Pointer<MilRectD>} pRect 
     * @returns {HRESULT} 
     */
    DirtyRegion(pEffect, pRect) {
        result := ComCall(4, this, "ptr", pEffect, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

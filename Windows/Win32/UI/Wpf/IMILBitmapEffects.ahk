#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that define an enumeration of effects.
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffects
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffects extends IUnknown{
    /**
     * The interface identifier for IMILBitmapEffects
     * @type {Guid}
     */
    static IID => Guid("{51ac3dce-67c5-448b-9180-ad3eabddd5dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} ppiuReturn 
     * @returns {HRESULT} 
     */
    _NewEnum(ppiuReturn) {
        result := ComCall(3, this, "ptr", ppiuReturn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMILBitmapEffectGroup>} ppEffect 
     * @returns {HRESULT} 
     */
    get_Parent(ppEffect) {
        result := ComCall(4, this, "ptr", ppEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uindex 
     * @param {Pointer<IMILBitmapEffect>} ppEffect 
     * @returns {HRESULT} 
     */
    Item(uindex, ppEffect) {
        result := ComCall(5, this, "uint", uindex, "ptr", ppEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puiCount 
     * @returns {HRESULT} 
     */
    get_Count(puiCount) {
        result := ComCall(6, this, "uint*", puiCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

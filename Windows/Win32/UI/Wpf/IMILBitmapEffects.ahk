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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["_NewEnum", "get_Parent", "Item", "get_Count"]

    /**
     * 
     * @param {Pointer<IUnknown>} ppiuReturn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffects-_newenum
     */
    _NewEnum(ppiuReturn) {
        result := ComCall(3, this, "ptr*", ppiuReturn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMILBitmapEffectGroup>} ppEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffects-get_parent
     */
    get_Parent(ppEffect) {
        result := ComCall(4, this, "ptr*", ppEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uindex 
     * @param {Pointer<IMILBitmapEffect>} ppEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffects-item
     */
    Item(uindex, ppEffect) {
        result := ComCall(5, this, "uint", uindex, "ptr*", ppEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puiCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffects-get_count
     */
    get_Count(puiCount) {
        result := ComCall(6, this, "uint*", puiCount, "HRESULT")
        return result
    }
}

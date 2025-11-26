#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IMILBitmapEffectGroup.ahk
#Include .\IMILBitmapEffect.ahk

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
     * @type {IMILBitmapEffectGroup} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffects-_newenum
     */
    _NewEnum() {
        result := ComCall(3, this, "ptr*", &ppiuReturn := 0, "HRESULT")
        return IUnknown(ppiuReturn)
    }

    /**
     * 
     * @returns {IMILBitmapEffectGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffects-get_parent
     */
    get_Parent() {
        result := ComCall(4, this, "ptr*", &ppEffect := 0, "HRESULT")
        return IMILBitmapEffectGroup(ppEffect)
    }

    /**
     * 
     * @param {Integer} uindex 
     * @returns {IMILBitmapEffect} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffects-item
     */
    Item(uindex) {
        result := ComCall(5, this, "uint", uindex, "ptr*", &ppEffect := 0, "HRESULT")
        return IMILBitmapEffect(ppEffect)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffects-get_count
     */
    get_Count() {
        result := ComCall(6, this, "uint*", &puiCount := 0, "HRESULT")
        return puiCount
    }
}

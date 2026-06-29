#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMILBitmapEffect.ahk" { IMILBitmapEffect }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMILBitmapEffectGroup.ahk" { IMILBitmapEffectGroup }

/**
 * Exposes methods that define an enumeration of effects.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffects
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffects extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffects
     * @type {Guid}
     */
    static IID := Guid("{51ac3dce-67c5-448b-9180-ad3eabddd5dd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffects interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        _NewEnum   : IntPtr
        get_Parent : IntPtr
        Item       : IntPtr
        get_Count  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffects.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Retrieves a new enumeration.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * A pointer that receives a pointer to the new enumeration item.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffects-_newenum
     */
    _NewEnum() {
        result := ComCall(3, this, "ptr*", &ppiuReturn := 0, "HRESULT")
        return IUnknown(ppiuReturn)
    }

    /**
     * Retrieves the parent effect group of enumeration.
     * @returns {IMILBitmapEffectGroup} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectgroup">IMILBitmapEffectGroup</a>**</b>
     * 
     * A pointer that receives a pointer to the parent group.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffects-get_parent
     */
    get_Parent() {
        result := ComCall(4, this, "ptr*", &ppEffect := 0, "HRESULT")
        return IMILBitmapEffectGroup(ppEffect)
    }

    /**
     * Retrieves the effect at the given index.
     * @param {Integer} uindex Type: <b>ULONG</b>
     * 
     * The index of the effect.
     * @returns {IMILBitmapEffect} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffect">IMILBitmapEffect</a>**</b>
     * 
     * A pointer that receives a pointer to the bitmap effect.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffects-item
     */
    Item(uindex) {
        result := ComCall(5, this, "uint", uindex, "ptr*", &ppEffect := 0, "HRESULT")
        return IMILBitmapEffect(ppEffect)
    }

    /**
     * Retrieves the number of items in the enumeration.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * A pointer that receives the number of items in the enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffects-get_count
     */
    get_Count() {
        result := ComCall(6, this, "uint*", &puiCount := 0, "HRESULT")
        return puiCount
    }

    Query(iid) {
        if (IMILBitmapEffects.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl._NewEnum := CallbackCreate(GetMethod(implObj, "_NewEnum"), flags, 2)
        this.vtbl.get_Parent := CallbackCreate(GetMethod(implObj, "get_Parent"), flags, 2)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl._NewEnum)
        CallbackFree(this.vtbl.get_Parent)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.get_Count)
    }
}

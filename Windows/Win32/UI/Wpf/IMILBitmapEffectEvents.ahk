#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IMILBitmapEffect.ahk" { IMILBitmapEffect }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MilRectD.ahk" { MilRectD }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that define an effect event.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectevents
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectEvents extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffectEvents
     * @type {Guid}
     */
    static IID := Guid("{2e880dd8-f8ce-457b-8199-d60bb3d7ef98}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PropertyChange : IntPtr
        DirtyRegion    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectevents-propertychange
     */
    PropertyChange(pEffect, bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(3, this, "ptr", pEffect, BSTR, bstrPropertyName, "HRESULT")
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectevents-dirtyregion
     */
    DirtyRegion(pEffect, pRect) {
        result := ComCall(4, this, "ptr", pEffect, MilRectD.Ptr, pRect, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMILBitmapEffectEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PropertyChange := CallbackCreate(GetMethod(implObj, "PropertyChange"), flags, 3)
        this.vtbl.DirtyRegion := CallbackCreate(GetMethod(implObj, "DirtyRegion"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PropertyChange)
        CallbackFree(this.vtbl.DirtyRegion)
    }
}

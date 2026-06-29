#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that report the state of a bitmap effect. This interface must be implemented to create third party Windows Presentation Foundation (WPF) bitmap effects.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectprimitiveimpl
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectPrimitiveImpl extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffectPrimitiveImpl
     * @type {Guid}
     */
    static IID := Guid("{ce41e00b-efa6-44e7-b007-dd042e3ae126}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectPrimitiveImpl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsDirty    : IntPtr
        IsVolatile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectPrimitiveImpl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether the effect needs to be updated.
     * @param {Integer} uiOutputIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating the output pin to query.
     * @returns {VARIANT_BOOL} Type: <b>VARIANT_BOOL*</b>
     * 
     * When this method returns, contains a value indicating whether the effect needs to be updated.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectprimitiveimpl-isdirty
     */
    IsDirty(uiOutputIndex) {
        result := ComCall(3, this, "uint", uiOutputIndex, VARIANT_BOOL.Ptr, &pfDirty := 0, Int32)
        return pfDirty
    }

    /**
     * Determines whether the current effect is considered volatile. If an effect is volatile, the effects framework will not attempt to cache the effect's output.
     * @param {Integer} uiOutputIndex Type: <b>ULONG</b>
     * 
     * A zero based index value indicating the output pin to query.
     * @returns {VARIANT_BOOL} Type: <b>VARIANT_BOOL*</b>
     * 
     * When this method returns, contains a value indicating whether the effect is considered volatile.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectprimitiveimpl-isvolatile
     */
    IsVolatile(uiOutputIndex) {
        result := ComCall(4, this, "uint", uiOutputIndex, VARIANT_BOOL.Ptr, &pfVolatile := 0, "HRESULT")
        return pfVolatile
    }

    Query(iid) {
        if (IMILBitmapEffectPrimitiveImpl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsDirty := CallbackCreate(GetMethod(implObj, "IsDirty"), flags, 3)
        this.vtbl.IsVolatile := CallbackCreate(GetMethod(implObj, "IsVolatile"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsDirty)
        CallbackFree(this.vtbl.IsVolatile)
    }
}

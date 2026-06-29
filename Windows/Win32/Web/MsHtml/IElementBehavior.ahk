#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IElementBehaviorSite.ahk" { IElementBehaviorSite }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IElementBehavior extends IUnknown {
    /**
     * The interface identifier for IElementBehavior
     * @type {Guid}
     */
    static IID := Guid("{3050f425-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IElementBehavior interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Init   : IntPtr
        Notify : IntPtr
        Detach : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IElementBehavior.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IElementBehaviorSite} pBehaviorSite 
     * @returns {HRESULT} 
     */
    Init(pBehaviorSite) {
        result := ComCall(3, this, "ptr", pBehaviorSite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lEvent 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     */
    Notify(lEvent, pVar) {
        result := ComCall(4, this, "int", lEvent, VARIANT.Ptr, pVar, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Detach() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IElementBehavior.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 2)
        this.vtbl.Notify := CallbackCreate(GetMethod(implObj, "Notify"), flags, 3)
        this.vtbl.Detach := CallbackCreate(GetMethod(implObj, "Detach"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Init)
        CallbackFree(this.vtbl.Notify)
        CallbackFree(this.vtbl.Detach)
    }
}

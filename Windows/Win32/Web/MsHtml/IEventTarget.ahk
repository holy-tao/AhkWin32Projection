#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDOMEvent.ahk" { IDOMEvent }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IEventTarget extends IDispatch {
    /**
     * The interface identifier for IEventTarget
     * @type {Guid}
     */
    static IID := Guid("{305104b9-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEventTarget interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        addEventListener    : IntPtr
        removeEventListener : IntPtr
        dispatchEvent       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEventTarget.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} type 
     * @param {IDispatch} listener 
     * @param {VARIANT_BOOL} useCapture 
     * @returns {HRESULT} 
     */
    addEventListener(type, listener, useCapture) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(7, this, BSTR, type, "ptr", listener, VARIANT_BOOL, useCapture, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} type 
     * @param {IDispatch} listener 
     * @param {VARIANT_BOOL} useCapture 
     * @returns {HRESULT} 
     */
    removeEventListener(type, listener, useCapture) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(8, this, BSTR, type, "ptr", listener, VARIANT_BOOL, useCapture, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDOMEvent} evt 
     * @returns {VARIANT_BOOL} 
     */
    dispatchEvent(evt) {
        result := ComCall(9, this, "ptr", evt, VARIANT_BOOL.Ptr, &pfResult := 0, "HRESULT")
        return pfResult
    }

    Query(iid) {
        if (IEventTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.addEventListener := CallbackCreate(GetMethod(implObj, "addEventListener"), flags, 4)
        this.vtbl.removeEventListener := CallbackCreate(GetMethod(implObj, "removeEventListener"), flags, 4)
        this.vtbl.dispatchEvent := CallbackCreate(GetMethod(implObj, "dispatchEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.addEventListener)
        CallbackFree(this.vtbl.removeEventListener)
        CallbackFree(this.vtbl.dispatchEvent)
    }
}

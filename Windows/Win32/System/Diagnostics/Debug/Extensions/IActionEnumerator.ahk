#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IKeyStore.ahk" { IKeyStore }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IActionEnumerator extends IUnknown {
    /**
     * The interface identifier for IActionEnumerator
     * @type {Guid}
     */
    static IID := Guid("{3dec5c44-f63a-4ca6-90f0-fd5c269fda59}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActionEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Reset   : IntPtr
        GetNext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActionEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} keyName 
     * @param {Pointer<BSTR>} actionName 
     * @param {Pointer<BSTR>} actionDescription 
     * @param {Pointer<Boolean>} actionIsDefault 
     * @param {Pointer<IModelObject>} actionMethod 
     * @param {Pointer<IKeyStore>} metadta 
     * @returns {HRESULT} 
     */
    GetNext(keyName, actionName, actionDescription, actionIsDefault, actionMethod, metadta) {
        actionIsDefaultMarshal := actionIsDefault is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, BSTR.Ptr, keyName, BSTR.Ptr, actionName, BSTR.Ptr, actionDescription, actionIsDefaultMarshal, actionIsDefault, IModelObject.Ptr, actionMethod, IKeyStore.Ptr, metadta, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActionEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.GetNext := CallbackCreate(GetMethod(implObj, "GetNext"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.GetNext)
    }
}

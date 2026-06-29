#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SCRIPT_INVOCATION_CONTEXT_TYPE.ahk" { SCRIPT_INVOCATION_CONTEXT_TYPE }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IScriptInvocationContext extends IUnknown {
    /**
     * The interface identifier for IScriptInvocationContext
     * @type {Guid}
     */
    static IID := Guid("{5d7741b7-af7e-4a2a-85e5-c77f4d0659fb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IScriptInvocationContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetContextType        : IntPtr
        GetContextDescription : IntPtr
        GetContextObject      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IScriptInvocationContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {SCRIPT_INVOCATION_CONTEXT_TYPE} 
     */
    GetContextType() {
        result := ComCall(3, this, "int*", &pInvocationContextType := 0, "HRESULT")
        return pInvocationContextType
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetContextDescription() {
        pDescription := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pDescription, "HRESULT")
        return pDescription
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetContextObject() {
        result := ComCall(5, this, "ptr*", &ppContextObject := 0, "HRESULT")
        return IUnknown(ppContextObject)
    }

    Query(iid) {
        if (IScriptInvocationContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetContextType := CallbackCreate(GetMethod(implObj, "GetContextType"), flags, 2)
        this.vtbl.GetContextDescription := CallbackCreate(GetMethod(implObj, "GetContextDescription"), flags, 2)
        this.vtbl.GetContextObject := CallbackCreate(GetMethod(implObj, "GetContextObject"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetContextType)
        CallbackFree(this.vtbl.GetContextDescription)
        CallbackFree(this.vtbl.GetContextObject)
    }
}

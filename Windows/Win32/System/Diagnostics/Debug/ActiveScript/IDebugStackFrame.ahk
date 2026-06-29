#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDebugApplicationThread.ahk" { IDebugApplicationThread }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugCodeContext.ahk" { IDebugCodeContext }
#Import "..\IDebugProperty.ahk" { IDebugProperty }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugStackFrame extends IUnknown {
    /**
     * The interface identifier for IDebugStackFrame
     * @type {Guid}
     */
    static IID := Guid("{51973c17-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugStackFrame interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCodeContext       : IntPtr
        GetDescriptionString : IntPtr
        GetLanguageString    : IntPtr
        GetThread            : IntPtr
        GetDebugProperty     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugStackFrame.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IDebugCodeContext} 
     */
    GetCodeContext() {
        result := ComCall(3, this, "ptr*", &ppcc := 0, "HRESULT")
        return IDebugCodeContext(ppcc)
    }

    /**
     * 
     * @param {BOOL} fLong 
     * @returns {BSTR} 
     */
    GetDescriptionString(fLong) {
        pbstrDescription := BSTR.Owned()
        result := ComCall(4, this, BOOL, fLong, BSTR.Ptr, pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * 
     * @param {BOOL} fLong 
     * @returns {BSTR} 
     */
    GetLanguageString(fLong) {
        pbstrLanguage := BSTR.Owned()
        result := ComCall(5, this, BOOL, fLong, BSTR.Ptr, pbstrLanguage, "HRESULT")
        return pbstrLanguage
    }

    /**
     * 
     * @returns {IDebugApplicationThread} 
     */
    GetThread() {
        result := ComCall(6, this, "ptr*", &ppat := 0, "HRESULT")
        return IDebugApplicationThread(ppat)
    }

    /**
     * 
     * @returns {IDebugProperty} 
     */
    GetDebugProperty() {
        result := ComCall(7, this, "ptr*", &ppDebugProp := 0, "HRESULT")
        return IDebugProperty(ppDebugProp)
    }

    Query(iid) {
        if (IDebugStackFrame.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCodeContext := CallbackCreate(GetMethod(implObj, "GetCodeContext"), flags, 2)
        this.vtbl.GetDescriptionString := CallbackCreate(GetMethod(implObj, "GetDescriptionString"), flags, 3)
        this.vtbl.GetLanguageString := CallbackCreate(GetMethod(implObj, "GetLanguageString"), flags, 3)
        this.vtbl.GetThread := CallbackCreate(GetMethod(implObj, "GetThread"), flags, 2)
        this.vtbl.GetDebugProperty := CallbackCreate(GetMethod(implObj, "GetDebugProperty"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCodeContext)
        CallbackFree(this.vtbl.GetDescriptionString)
        CallbackFree(this.vtbl.GetLanguageString)
        CallbackFree(this.vtbl.GetThread)
        CallbackFree(this.vtbl.GetDebugProperty)
    }
}

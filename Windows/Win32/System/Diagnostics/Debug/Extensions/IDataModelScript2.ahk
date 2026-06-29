#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDataModelScript.ahk" { IDataModelScript }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelScript2 extends IDataModelScript {
    /**
     * The interface identifier for IDataModelScript2
     * @type {Guid}
     */
    static IID := Guid("{7d90cf81-bee2-4b91-9d49-8fec0f7d56d1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelScript2 interfaces
    */
    struct Vtbl extends IDataModelScript.Vtbl {
        GetScriptFullFilePathName : IntPtr
        SetScriptFullFilePathName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelScript2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetScriptFullFilePathName() {
        scriptFullPathName := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, scriptFullPathName, "HRESULT")
        return scriptFullPathName
    }

    /**
     * 
     * @param {PWSTR} scriptFullPathName 
     * @returns {HRESULT} 
     */
    SetScriptFullFilePathName(scriptFullPathName) {
        scriptFullPathName := scriptFullPathName is String ? StrPtr(scriptFullPathName) : scriptFullPathName

        result := ComCall(11, this, "ptr", scriptFullPathName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDataModelScript2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetScriptFullFilePathName := CallbackCreate(GetMethod(implObj, "GetScriptFullFilePathName"), flags, 2)
        this.vtbl.SetScriptFullFilePathName := CallbackCreate(GetMethod(implObj, "SetScriptFullFilePathName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetScriptFullFilePathName)
        CallbackFree(this.vtbl.SetScriptFullFilePathName)
    }
}

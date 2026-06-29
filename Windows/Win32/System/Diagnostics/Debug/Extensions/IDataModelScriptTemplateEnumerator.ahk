#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDataModelScriptTemplate.ahk" { IDataModelScriptTemplate }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDataModelScriptTemplateEnumerator extends IUnknown {
    /**
     * The interface identifier for IDataModelScriptTemplateEnumerator
     * @type {Guid}
     */
    static IID := Guid("{69ce6ae2-2268-4e6f-b062-20ce62bfe677}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataModelScriptTemplateEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Reset   : IntPtr
        GetNext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataModelScriptTemplateEnumerator.Vtbl()
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
     * @returns {IDataModelScriptTemplate} 
     */
    GetNext() {
        result := ComCall(4, this, "ptr*", &templateContent := 0, "HRESULT")
        return IDataModelScriptTemplate(templateContent)
    }

    Query(iid) {
        if (IDataModelScriptTemplateEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.GetNext := CallbackCreate(GetMethod(implObj, "GetNext"), flags, 2)
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

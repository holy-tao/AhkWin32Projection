#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpErrorLog extends IUnknown {
    /**
     * The interface identifier for ISpErrorLog
     * @type {Guid}
     */
    static IID := Guid("{f4711347-e608-11d2-a086-00c04f8ef9b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpErrorLog interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddError : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpErrorLog.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} lLineNumber 
     * @param {HRESULT} hr 
     * @param {PWSTR} pszDescription 
     * @param {PWSTR} pszHelpFile 
     * @param {Integer} dwHelpContext 
     * @returns {HRESULT} 
     */
    AddError(lLineNumber, hr, pszDescription, pszHelpFile, dwHelpContext) {
        pszDescription := pszDescription is String ? StrPtr(pszDescription) : pszDescription
        pszHelpFile := pszHelpFile is String ? StrPtr(pszHelpFile) : pszHelpFile

        result := ComCall(3, this, "int", lLineNumber, "int", hr, "ptr", pszDescription, "ptr", pszHelpFile, "uint", dwHelpContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpErrorLog.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddError := CallbackCreate(GetMethod(implObj, "AddError"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddError)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\EXCEPINFO.ahk" { EXCEPINFO }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * Communicates detailed error information between a client and an object.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ierrorlog
 * @namespace Windows.Win32.System.Com
 */
export default struct IErrorLog extends IUnknown {
    /**
     * The interface identifier for IErrorLog
     * @type {Guid}
     */
    static IID := Guid("{3127ca40-446e-11ce-8135-00aa004bb851}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IErrorLog interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddError : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IErrorLog.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds an error for the specified property to the error log.
     * @param {PWSTR} pszPropName The address of the name of the property to read. This cannot be NULL.
     * @param {Pointer<EXCEPINFO>} pExcepInfo Pointer to an array of [EXCEPINFO](ns-oaidl-excepinfo.md) structures.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorlog-adderror
     */
    AddError(pszPropName, pExcepInfo) {
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(3, this, "ptr", pszPropName, EXCEPINFO.Ptr, pExcepInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IErrorLog.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddError := CallbackCreate(GetMethod(implObj, "AddError"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddError)
    }
}

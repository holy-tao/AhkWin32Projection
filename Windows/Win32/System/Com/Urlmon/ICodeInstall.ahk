#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWindowForBindingUI.ahk" { IWindowForBindingUI }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct ICodeInstall extends IWindowForBindingUI {
    /**
     * The interface identifier for ICodeInstall
     * @type {Guid}
     */
    static IID := Guid("{79eac9d1-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICodeInstall interfaces
    */
    struct Vtbl extends IWindowForBindingUI.Vtbl {
        OnCodeInstallProblem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICodeInstall.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} ulStatusCode 
     * @param {PWSTR} szDestination 
     * @param {PWSTR} szSource 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    OnCodeInstallProblem(ulStatusCode, szDestination, szSource, dwReserved) {
        szDestination := szDestination is String ? StrPtr(szDestination) : szDestination
        szSource := szSource is String ? StrPtr(szSource) : szSource

        result := ComCall(4, this, "uint", ulStatusCode, "ptr", szDestination, "ptr", szSource, "uint", dwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICodeInstall.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnCodeInstallProblem := CallbackCreate(GetMethod(implObj, "OnCodeInstallProblem"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnCodeInstallProblem)
    }
}

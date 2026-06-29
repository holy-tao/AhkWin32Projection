#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostModule.ahk" { IDebugHostModule }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostModuleSignature extends IUnknown {
    /**
     * The interface identifier for IDebugHostModuleSignature
     * @type {Guid}
     */
    static IID := Guid("{31e53a5a-01ee-4bbb-b899-4b46ae7d595c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostModuleSignature interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsMatch : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostModuleSignature.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugHostModule} pModule 
     * @returns {Boolean} 
     */
    IsMatch(pModule) {
        result := ComCall(3, this, "ptr", pModule, "int*", &isMatch := 0, "HRESULT")
        return isMatch
    }

    Query(iid) {
        if (IDebugHostModuleSignature.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsMatch := CallbackCreate(GetMethod(implObj, "IsMatch"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsMatch)
    }
}

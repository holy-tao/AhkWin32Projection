#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IHandlerInfo.ahk" { IHandlerInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IHandlerInfo2 extends IHandlerInfo {
    /**
     * The interface identifier for IHandlerInfo2
     * @type {Guid}
     */
    static IID := Guid("{31cca04c-04d3-4ea9-90de-97b15e87a532}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHandlerInfo2 interfaces
    */
    struct Vtbl extends IHandlerInfo.Vtbl {
        GetApplicationId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHandlerInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetApplicationId() {
        result := ComCall(6, this, PWSTR.Ptr, &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IHandlerInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetApplicationId := CallbackCreate(GetMethod(implObj, "GetApplicationId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetApplicationId)
    }
}

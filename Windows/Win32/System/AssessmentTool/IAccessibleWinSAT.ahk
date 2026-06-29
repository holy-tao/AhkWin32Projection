#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\UI\Accessibility\IAccessible.ahk" { IAccessible }

/**
 * @namespace Windows.Win32.System.AssessmentTool
 */
export default struct IAccessibleWinSAT extends IAccessible {
    /**
     * The interface identifier for IAccessibleWinSAT
     * @type {Guid}
     */
    static IID := Guid("{30e6018a-94a8-4ff8-a69a-71b67413f07b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAccessibleWinSAT interfaces
    */
    struct Vtbl extends IAccessible.Vtbl {
        SetAccessiblityData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAccessibleWinSAT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} wsName 
     * @param {PWSTR} wsValue 
     * @param {PWSTR} wsDesc 
     * @returns {HRESULT} 
     */
    SetAccessiblityData(wsName, wsValue, wsDesc) {
        wsName := wsName is String ? StrPtr(wsName) : wsName
        wsValue := wsValue is String ? StrPtr(wsValue) : wsValue
        wsDesc := wsDesc is String ? StrPtr(wsDesc) : wsDesc

        result := ComCall(28, this, "ptr", wsName, "ptr", wsValue, "ptr", wsDesc, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAccessibleWinSAT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAccessiblityData := CallbackCreate(GetMethod(implObj, "SetAccessiblityData"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAccessiblityData)
    }
}

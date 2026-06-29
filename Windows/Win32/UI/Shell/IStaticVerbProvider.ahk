#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IStaticVerbProvider extends IUnknown {
    /**
     * The interface identifier for IStaticVerbProvider
     * @type {Guid}
     */
    static IID := Guid("{4b770da6-d111-4015-96fd-8c1c56f06c55}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStaticVerbProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsVerbSupported : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStaticVerbProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} verbName 
     * @returns {BOOL} 
     */
    IsVerbSupported(verbName) {
        verbName := verbName is String ? StrPtr(verbName) : verbName

        result := ComCall(3, this, "ptr", verbName, BOOL.Ptr, &result := 0, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStaticVerbProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsVerbSupported := CallbackCreate(GetMethod(implObj, "IsVerbSupported"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsVerbSupported)
    }
}

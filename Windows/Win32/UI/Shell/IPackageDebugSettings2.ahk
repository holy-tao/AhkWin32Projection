#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPackageDebugSettings.ahk" { IPackageDebugSettings }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IPackageDebugSettings2 extends IPackageDebugSettings {
    /**
     * The interface identifier for IPackageDebugSettings2
     * @type {Guid}
     */
    static IID := Guid("{6e3194bb-ab82-4d22-93f5-fabda40e7b16}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPackageDebugSettings2 interfaces
    */
    struct Vtbl extends IPackageDebugSettings.Vtbl {
        EnumerateApps : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPackageDebugSettings2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} packageFullName 
     * @param {Pointer<Integer>} appCount 
     * @param {Pointer<Pointer<PWSTR>>} appUserModelIds 
     * @param {Pointer<Pointer<PWSTR>>} appDisplayNames 
     * @returns {HRESULT} 
     */
    EnumerateApps(packageFullName, appCount, appUserModelIds, appDisplayNames) {
        packageFullName := packageFullName is String ? StrPtr(packageFullName) : packageFullName

        appCountMarshal := appCount is VarRef ? "uint*" : "ptr"
        appUserModelIdsMarshal := appUserModelIds is VarRef ? "ptr*" : "ptr"
        appDisplayNamesMarshal := appDisplayNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(18, this, "ptr", packageFullName, appCountMarshal, appCount, appUserModelIdsMarshal, appUserModelIds, appDisplayNamesMarshal, appDisplayNames, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPackageDebugSettings2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumerateApps := CallbackCreate(GetMethod(implObj, "EnumerateApps"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumerateApps)
    }
}

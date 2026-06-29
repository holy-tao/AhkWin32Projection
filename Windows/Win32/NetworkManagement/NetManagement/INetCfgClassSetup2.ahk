#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\INetCfgClassSetup.ahk" { INetCfgClassSetup }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetCfgComponent.ahk" { INetCfgComponent }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgClassSetup2 extends INetCfgClassSetup {
    /**
     * The interface identifier for INetCfgClassSetup2
     * @type {Guid}
     */
    static IID := Guid("{c0e8aea0-306e-11d1-aacf-00805fc1270e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgClassSetup2 interfaces
    */
    struct Vtbl extends INetCfgClassSetup.Vtbl {
        UpdateNonEnumeratedComponent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgClassSetup2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {INetCfgComponent} pIComp 
     * @returns {HRESULT} 
     */
    UpdateNonEnumeratedComponent(pIComp) {
        static dwSetupFlags := 0, dwUpgradeFromBuildNo := 0 ;Reserved parameters must always be NULL

        result := ComCall(6, this, "ptr", pIComp, "uint", dwSetupFlags, "uint", dwUpgradeFromBuildNo, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetCfgClassSetup2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UpdateNonEnumeratedComponent := CallbackCreate(GetMethod(implObj, "UpdateNonEnumeratedComponent"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UpdateNonEnumeratedComponent)
    }
}

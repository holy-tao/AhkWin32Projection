#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 */
export default struct IBriefcaseInitiator extends IUnknown {
    /**
     * The interface identifier for IBriefcaseInitiator
     * @type {Guid}
     */
    static IID := Guid("{99180164-da16-101a-935c-444553540000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBriefcaseInitiator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsMonikerInBriefcase : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBriefcaseInitiator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IMoniker} pmk 
     * @returns {HRESULT} 
     */
    IsMonikerInBriefcase(pmk) {
        result := ComCall(3, this, "ptr", pmk, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBriefcaseInitiator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsMonikerInBriefcase := CallbackCreate(GetMethod(implObj, "IsMonikerInBriefcase"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsMonikerInBriefcase)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPartBase.ahk" { IPartBase }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPartColorProfile extends IPartBase {
    /**
     * The interface identifier for IPartColorProfile
     * @type {Guid}
     */
    static IID := Guid("{63cca95b-7d18-4762-b15e-98658693d24a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPartColorProfile interfaces
    */
    struct Vtbl extends IPartBase.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPartColorProfile.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IPartColorProfile.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}

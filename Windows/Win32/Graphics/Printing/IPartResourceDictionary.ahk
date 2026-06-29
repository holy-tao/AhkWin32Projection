#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPartBase.ahk" { IPartBase }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPartResourceDictionary extends IPartBase {
    /**
     * The interface identifier for IPartResourceDictionary
     * @type {Guid}
     */
    static IID := Guid("{16cfce6d-e744-4fb3-b474-f1d54f024a01}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPartResourceDictionary interfaces
    */
    struct Vtbl extends IPartBase.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPartResourceDictionary.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IPartResourceDictionary.IID.Equals(iid)) {
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

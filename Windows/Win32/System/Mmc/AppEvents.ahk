#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }

/**
 * @namespace Windows.Win32.System.Mmc
 */
export default struct AppEvents extends IDispatch {
    /**
     * The interface identifier for AppEvents
     * @type {Guid}
     */
    static IID := Guid("{fc7a4252-78ac-4532-8c5a-563cfe138863}")

    /**
     * The class identifier for AppEvents
     * @type {Guid}
     */
    static CLSID := Guid("{fc7a4252-78ac-4532-8c5a-563cfe138863}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AppEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AppEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (AppEvents.IID.Equals(iid)) {
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

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct _IInkOverlayEvents extends IDispatch {
    /**
     * The interface identifier for _IInkOverlayEvents
     * @type {Guid}
     */
    static IID := Guid("{31179b69-e563-489e-b16f-712f1e8a0651}")

    /**
     * The class identifier for _IInkOverlayEvents
     * @type {Guid}
     */
    static CLSID := Guid("{31179b69-e563-489e-b16f-712f1e8a0651}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for _IInkOverlayEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := _IInkOverlayEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (_IInkOverlayEvents.IID.Equals(iid)) {
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

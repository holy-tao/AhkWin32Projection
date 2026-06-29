#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct DWebBridgeEvents extends IDispatch {
    /**
     * The interface identifier for DWebBridgeEvents
     * @type {Guid}
     */
    static IID := Guid("{a6d897ff-0a95-11d1-b0ba-006008166e11}")

    /**
     * The class identifier for DWebBridgeEvents
     * @type {Guid}
     */
    static CLSID := Guid("{a6d897ff-0a95-11d1-b0ba-006008166e11}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for DWebBridgeEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := DWebBridgeEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (DWebBridgeEvents.IID.Equals(iid)) {
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

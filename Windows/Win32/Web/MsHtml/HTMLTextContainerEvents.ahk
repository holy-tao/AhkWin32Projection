#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct HTMLTextContainerEvents extends IDispatch {
    /**
     * The interface identifier for HTMLTextContainerEvents
     * @type {Guid}
     */
    static IID := Guid("{1ff6aa72-5842-11cf-a707-00aa00c0098d}")

    /**
     * The class identifier for HTMLTextContainerEvents
     * @type {Guid}
     */
    static CLSID := Guid("{1ff6aa72-5842-11cf-a707-00aa00c0098d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for HTMLTextContainerEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := HTMLTextContainerEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (HTMLTextContainerEvents.IID.Equals(iid)) {
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

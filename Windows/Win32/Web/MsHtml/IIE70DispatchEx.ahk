#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Ole\IDispatchEx.ahk" { IDispatchEx }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IIE70DispatchEx extends IDispatchEx {
    /**
     * The interface identifier for IIE70DispatchEx
     * @type {Guid}
     */
    static IID := Guid("{3051046b-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIE70DispatchEx interfaces
    */
    struct Vtbl extends IDispatchEx.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIE70DispatchEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IIE70DispatchEx.IID.Equals(iid)) {
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

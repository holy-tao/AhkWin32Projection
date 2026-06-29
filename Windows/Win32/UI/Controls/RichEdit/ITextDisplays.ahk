#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }

/**
 * Represents the displays collection for this Text Object Model (TOM) engine instance.
 * @remarks
 * This interface is currently undefined.
 * @see https://learn.microsoft.com/windows/win32/api/tom/nn-tom-itextdisplays
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct ITextDisplays extends IDispatch {
    /**
     * The interface identifier for ITextDisplays
     * @type {Guid}
     */
    static IID := Guid("{c241f5f2-7206-11d8-a2c7-00a0d1d6c6b3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextDisplays interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextDisplays.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ITextDisplays.IID.Equals(iid)) {
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

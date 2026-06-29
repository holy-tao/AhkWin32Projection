#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITextRange2.ahk" { ITextRange2 }

/**
 * Currently, this interface contains no methods other than those inherited from ITextRange2.
 * @see https://learn.microsoft.com/windows/win32/api/tom/nn-tom-itextselection2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct ITextSelection2 extends ITextRange2 {
    /**
     * The interface identifier for ITextSelection2
     * @type {Guid}
     */
    static IID := Guid("{c241f5e1-7206-11d8-a2c7-00a0d1d6c6b3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextSelection2 interfaces
    */
    struct Vtbl extends ITextRange2.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextSelection2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ITextSelection2.IID.Equals(iid)) {
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

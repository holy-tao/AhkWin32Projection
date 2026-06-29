#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMAPIProp.ahk" { IMAPIProp }

/**
 * This article describes IAttach IMAPIProp providing access to the properties of attachments in messages.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/iattachimapiprop
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct IAttach extends IMAPIProp {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAttach interfaces
    */
    struct Vtbl extends IMAPIProp.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAttach.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IAttach.IID.Equals(iid)) {
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

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IXpsOMPart.ahk" { IXpsOMPart }

/**
 * Used as the base interface for the resource interfaces of the XPS object model.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomresource
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMResource extends IXpsOMPart {
    /**
     * The interface identifier for IXpsOMResource
     * @type {Guid}
     */
    static IID := Guid("{da2ac0a2-73a2-4975-ad14-74097c3ff3a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMResource interfaces
    */
    struct Vtbl extends IXpsOMPart.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMResource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IXpsOMResource.IID.Equals(iid)) {
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

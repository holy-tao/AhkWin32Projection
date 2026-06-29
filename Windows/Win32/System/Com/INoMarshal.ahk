#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The INoMarshal (objidlbase.h) interface marks an object that doesn't support being marshaled or stored in the Global Interface Table.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-inomarshal
 * @namespace Windows.Win32.System.Com
 */
export default struct INoMarshal extends IUnknown {
    /**
     * The interface identifier for INoMarshal
     * @type {Guid}
     */
    static IID := Guid("{ecc8691b-c1db-4dc0-855e-65f6c551af49}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INoMarshal interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INoMarshal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (INoMarshal.IID.Equals(iid)) {
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

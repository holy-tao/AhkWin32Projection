#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The IAgileObject (objidlbase.h) interface marks an interface as agile across apartments.
 * @remarks
 * The <b>IAgileObject</b> interface is a marker interface that indicates that an object is free threaded and can be called from any apartment.
 * 
 * Unlike what happens when aggregating the Free Threaded Marshaler (FTM), implementing the <b>IAgileObject</b> interface doesn't affect what happens when marshaling a call. Instead, the <b>IAgileObject</b> interface is recognized by the Global Interface Table (GIT). When an object that implements the <b>IAgileObject</b> interface is placed in the GIT and localized to another apartment, the object is called directly in the new apartment, rather than marshaling.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-iagileobject
 * @namespace Windows.Win32.System.Com
 */
export default struct IAgileObject extends IUnknown {
    /**
     * The interface identifier for IAgileObject
     * @type {Guid}
     */
    static IID := Guid("{94ea2b94-e9cc-49e0-c0ff-ee64ca8f5b90}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAgileObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAgileObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IAgileObject.IID.Equals(iid)) {
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

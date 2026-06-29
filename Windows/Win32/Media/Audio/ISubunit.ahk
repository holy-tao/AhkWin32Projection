#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ISubunit interface represents a hardware subunit (for example, a volume control) that lies in the data path between a client and an audio endpoint device.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-isubunit
 * @namespace Windows.Win32.Media.Audio
 */
export default struct ISubunit extends IUnknown {
    /**
     * The interface identifier for ISubunit
     * @type {Guid}
     */
    static IID := Guid("{82149a85-dba6-4487-86bb-ea8f7fefcc71}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISubunit interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISubunit.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ISubunit.IID.Equals(iid)) {
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

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IATSCLocator2.ahk" { IATSCLocator2 }

/**
 * The IDigitalCableLocator interface provides tuning information for a digital cable network.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDigitalCableLocator)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-idigitalcablelocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDigitalCableLocator extends IATSCLocator2 {
    /**
     * The interface identifier for IDigitalCableLocator
     * @type {Guid}
     */
    static IID := Guid("{48f66a11-171a-419a-9525-beeecd51584c}")

    /**
     * The class identifier for DigitalCableLocator
     * @type {Guid}
     */
    static CLSID := Guid("{03c06416-d127-407a-ab4c-fdd279abbe5d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDigitalCableLocator interfaces
    */
    struct Vtbl extends IATSCLocator2.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDigitalCableLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IDigitalCableLocator.IID.Equals(iid)) {
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

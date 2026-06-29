#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ILocator.ahk" { ILocator }

/**
 * The IDigitalLocator interface serves as the base interface for Locator objects that contain tuning information about the tuning space for a digital network. This interface is used only through derived interfaces such as IATSCLocator.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDigitalLocator)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-idigitallocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDigitalLocator extends ILocator {
    /**
     * The interface identifier for IDigitalLocator
     * @type {Guid}
     */
    static IID := Guid("{19b595d8-839a-47f0-96df-4f194f3c768c}")

    /**
     * The class identifier for DigitalLocator
     * @type {Guid}
     */
    static CLSID := Guid("{6e50cc0d-c19b-4bf6-810b-5bd60761f5cc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDigitalLocator interfaces
    */
    struct Vtbl extends ILocator.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDigitalLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IDigitalLocator.IID.Equals(iid)) {
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

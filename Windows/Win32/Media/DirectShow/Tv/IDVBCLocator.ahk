#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDigitalLocator.ahk" { IDigitalLocator }

/**
 * The IDVBCLocator interface is implemented on DVBCLocator objects, which contain tuning information for DVB-C networks.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBCLocator)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-idvbclocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDVBCLocator extends IDigitalLocator {
    /**
     * The interface identifier for IDVBCLocator
     * @type {Guid}
     */
    static IID := Guid("{6e42f36e-1dd2-43c4-9f78-69d25ae39034}")

    /**
     * The class identifier for DVBCLocator
     * @type {Guid}
     */
    static CLSID := Guid("{c531d9fd-9685-4028-8b68-6e1232079f1e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDVBCLocator interfaces
    */
    struct Vtbl extends IDigitalLocator.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDVBCLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IDVBCLocator.IID.Equals(iid)) {
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

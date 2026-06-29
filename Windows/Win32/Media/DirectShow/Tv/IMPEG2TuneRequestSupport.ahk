#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Indicates that the default network provider for a tuning space allows tuning through the IMPEG2TuneRequest interface as well as tuning through the native tuning request type implemented by that tuning space's CreateTuneRequest method.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMPEG2TuneRequestSupport)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-impeg2tunerequestsupport
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMPEG2TuneRequestSupport extends IUnknown {
    /**
     * The interface identifier for IMPEG2TuneRequestSupport
     * @type {Guid}
     */
    static IID := Guid("{1b9d5fc3-5bbc-4b6c-bb18-b9d10e3eeebf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMPEG2TuneRequestSupport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMPEG2TuneRequestSupport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IMPEG2TuneRequestSupport.IID.Equals(iid)) {
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

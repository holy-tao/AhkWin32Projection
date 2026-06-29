#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITuningSpace.ahk" { ITuningSpace }

/**
 * The IAuxInTuningSpace interface is implemented on AuxInTuningSpace objects, which represent auxiliary video inputs such as S-video or composite video on a hardware device that is connected to the computer.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAuxInTuningSpace)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-iauxintuningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IAuxInTuningSpace extends ITuningSpace {
    /**
     * The interface identifier for IAuxInTuningSpace
     * @type {Guid}
     */
    static IID := Guid("{e48244b8-7e17-4f76-a763-5090ff1e2f30}")

    /**
     * The class identifier for AuxInTuningSpace
     * @type {Guid}
     */
    static CLSID := Guid("{f9769a06-7aca-4e39-9cfb-97bb35f0e77e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAuxInTuningSpace interfaces
    */
    struct Vtbl extends ITuningSpace.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAuxInTuningSpace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IAuxInTuningSpace.IID.Equals(iid)) {
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

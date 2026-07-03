#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IESEvent.ahk" { IESEvent }
#Import "..\..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Implements an event that Protected Broadcast Driver Architecture (PBDA) Media Transform Devices (MTDs) use to inform a Media Sink Device that the MTD has updated the value for a name-value pair or exposed a new name-value pair.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESValueUpdatedEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-iesvalueupdatedevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IESValueUpdatedEvent extends IESEvent {
    /**
     * The interface identifier for IESValueUpdatedEvent
     * @type {Guid}
     */
    static IID := Guid("{8a24c46e-bb63-4664-8602-5d9c718c146d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IESValueUpdatedEvent interfaces
    */
    struct Vtbl extends IESEvent.Vtbl {
        GetValueNames : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IESValueUpdatedEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * For a name-value pair in the PBDA General Purpose Name-Value Service, gets the name for the value that has been updated.
     * @returns {Pointer<SAFEARRAY>} Pointer to a buffer that gets the name that has been updated. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesvalueupdatedevent-getvaluenames
     */
    GetValueNames() {
        result := ComCall(8, this, "ptr*", &pbstrNames := 0, "HRESULT")
        return pbstrNames
    }

    Query(iid) {
        if (IESValueUpdatedEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetValueNames := CallbackCreate(GetMethod(implObj, "GetValueNames"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetValueNames)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IGuideDataEvent interface is used to receive events from the BDA MPEG-2 Transport Information Filter (TIF).This interface is an outgoing connection-point interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IGuideDataEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdatif/nn-bdatif-iguidedataevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IGuideDataEvent extends IUnknown {
    /**
     * The interface identifier for IGuideDataEvent
     * @type {Guid}
     */
    static IID := Guid("{efda0c80-f395-42c3-9b3c-56b37dec7bb7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGuideDataEvent interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GuideDataAcquired    : IntPtr
        ProgramChanged       : IntPtr
        ServiceChanged       : IntPtr
        ScheduleEntryChanged : IntPtr
        ProgramDeleted       : IntPtr
        ServiceDeleted       : IntPtr
        ScheduleDeleted      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGuideDataEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GuideDataAcquired method is called when a complete set of guide data has been acquired from the current transport stream.
     * @returns {HRESULT} Return S_OK if successful, or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataevent-guidedataacquired
     */
    GuideDataAcquired() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The ProgramChanged method is called when information about one or more programs has changed.
     * @param {VARIANT} varProgramDescriptionID Specifies the unique identifier of the program that has changed. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/bdatif/nf-bdatif-iguidedata-getprogramproperties">IGuideData::GetProgramProperties</a> to get information about the program. The value of this parameter may be an empty <b>VARIANT</b> type (VT_EMPTY); if so, examine all of the programs to determine which ones have changed.
     * @returns {HRESULT} Return S_OK if successful, or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataevent-programchanged
     */
    ProgramChanged(varProgramDescriptionID) {
        result := ComCall(4, this, VARIANT, varProgramDescriptionID, "HRESULT")
        return result
    }

    /**
     * The ServiceChanged method is called when a service has been changed.
     * @param {VARIANT} varServiceDescriptionID Specifies the unique identifier of the service that has changed.
     * @returns {HRESULT} Return S_OK if successful, or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataevent-servicechanged
     */
    ServiceChanged(varServiceDescriptionID) {
        result := ComCall(5, this, VARIANT, varServiceDescriptionID, "HRESULT")
        return result
    }

    /**
     * The ScheduleEntryChanged method is called by the TIF when information about one or more schedule entries has changed.
     * @param {VARIANT} varScheduleEntryDescriptionID Specifies the unique identifier of the program that has changed. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/bdatif/nf-bdatif-iguidedata-getscheduleentryproperties">IGuideData::GetScheduleEntryProperties</a> to get information about the program. The value of this parameter may be an empty <b>VARIANT</b> type (VT_EMPTY); if so, examine all of the programs to determine which ones have changed.
     * @returns {HRESULT} Return S_OK if successful, or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataevent-scheduleentrychanged
     */
    ScheduleEntryChanged(varScheduleEntryDescriptionID) {
        result := ComCall(6, this, VARIANT, varScheduleEntryDescriptionID, "HRESULT")
        return result
    }

    /**
     * The ProgramDeleted method is called when a program has been deleted.
     * @remarks
     * The event sink is not required to support this event; it may return E_NOTIMPL.
     * @param {VARIANT} varProgramDescriptionID Specifies the unique identifier of the program that was deleted.
     * @returns {HRESULT} Return S_OK if successful, or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataevent-programdeleted
     */
    ProgramDeleted(varProgramDescriptionID) {
        result := ComCall(7, this, VARIANT, varProgramDescriptionID, "HRESULT")
        return result
    }

    /**
     * The ServiceDeleted method is called when a service has been deleted.
     * @remarks
     * The event sink is not required to support this event; it may return E_NOTIMPL.
     * @param {VARIANT} varServiceDescriptionID Specifies the unique identifier of the service that was deleted.
     * @returns {HRESULT} Return S_OK if successful, or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataevent-servicedeleted
     */
    ServiceDeleted(varServiceDescriptionID) {
        result := ComCall(8, this, VARIANT, varServiceDescriptionID, "HRESULT")
        return result
    }

    /**
     * The ScheduleDeleted method is called when a schedule entry has been deleted.
     * @remarks
     * The event sink is not required to support this event; it may return E_NOTIMPL.
     * @param {VARIANT} varScheduleEntryDescriptionID Specifies the unique identifier of the schedule entry that was deleted.
     * @returns {HRESULT} Return S_OK if successful, or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataevent-scheduledeleted
     */
    ScheduleDeleted(varScheduleEntryDescriptionID) {
        result := ComCall(9, this, VARIANT, varScheduleEntryDescriptionID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGuideDataEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GuideDataAcquired := CallbackCreate(GetMethod(implObj, "GuideDataAcquired"), flags, 1)
        this.vtbl.ProgramChanged := CallbackCreate(GetMethod(implObj, "ProgramChanged"), flags, 2)
        this.vtbl.ServiceChanged := CallbackCreate(GetMethod(implObj, "ServiceChanged"), flags, 2)
        this.vtbl.ScheduleEntryChanged := CallbackCreate(GetMethod(implObj, "ScheduleEntryChanged"), flags, 2)
        this.vtbl.ProgramDeleted := CallbackCreate(GetMethod(implObj, "ProgramDeleted"), flags, 2)
        this.vtbl.ServiceDeleted := CallbackCreate(GetMethod(implObj, "ServiceDeleted"), flags, 2)
        this.vtbl.ScheduleDeleted := CallbackCreate(GetMethod(implObj, "ScheduleDeleted"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GuideDataAcquired)
        CallbackFree(this.vtbl.ProgramChanged)
        CallbackFree(this.vtbl.ServiceChanged)
        CallbackFree(this.vtbl.ScheduleEntryChanged)
        CallbackFree(this.vtbl.ProgramDeleted)
        CallbackFree(this.vtbl.ServiceDeleted)
        CallbackFree(this.vtbl.ScheduleDeleted)
    }
}

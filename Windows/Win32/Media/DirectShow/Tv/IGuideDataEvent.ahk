#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IGuideDataEvent interface is used to receive events from the BDA MPEG-2 Transport Information Filter (TIF).This interface is an outgoing connection-point interface.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IGuideDataEvent)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdatif/nn-bdatif-iguidedataevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IGuideDataEvent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuideDataEvent
     * @type {Guid}
     */
    static IID => Guid("{efda0c80-f395-42c3-9b3c-56b37dec7bb7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GuideDataAcquired", "ProgramChanged", "ServiceChanged", "ScheduleEntryChanged", "ProgramDeleted", "ServiceDeleted", "ScheduleDeleted"]

    /**
     * The GuideDataAcquired method is called when a complete set of guide data has been acquired from the current transport stream.
     * @returns {HRESULT} Return S_OK if successful, or an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-iguidedataevent-guidedataacquired
     */
    GuideDataAcquired() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The ProgramChanged method is called when information about one or more programs has changed.
     * @param {VARIANT} varProgramDescriptionID Specifies the unique identifier of the program that has changed. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/bdatif/nf-bdatif-iguidedata-getprogramproperties">IGuideData::GetProgramProperties</a> to get information about the program. The value of this parameter may be an empty <b>VARIANT</b> type (VT_EMPTY); if so, examine all of the programs to determine which ones have changed.
     * @returns {HRESULT} Return S_OK if successful, or an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-iguidedataevent-programchanged
     */
    ProgramChanged(varProgramDescriptionID) {
        result := ComCall(4, this, "ptr", varProgramDescriptionID, "HRESULT")
        return result
    }

    /**
     * The ServiceChanged method is called when a service has been changed.
     * @param {VARIANT} varServiceDescriptionID Specifies the unique identifier of the service that has changed.
     * @returns {HRESULT} Return S_OK if successful, or an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-iguidedataevent-servicechanged
     */
    ServiceChanged(varServiceDescriptionID) {
        result := ComCall(5, this, "ptr", varServiceDescriptionID, "HRESULT")
        return result
    }

    /**
     * The ScheduleEntryChanged method is called by the TIF when information about one or more schedule entries has changed.
     * @param {VARIANT} varScheduleEntryDescriptionID Specifies the unique identifier of the program that has changed. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/bdatif/nf-bdatif-iguidedata-getscheduleentryproperties">IGuideData::GetScheduleEntryProperties</a> to get information about the program. The value of this parameter may be an empty <b>VARIANT</b> type (VT_EMPTY); if so, examine all of the programs to determine which ones have changed.
     * @returns {HRESULT} Return S_OK if successful, or an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-iguidedataevent-scheduleentrychanged
     */
    ScheduleEntryChanged(varScheduleEntryDescriptionID) {
        result := ComCall(6, this, "ptr", varScheduleEntryDescriptionID, "HRESULT")
        return result
    }

    /**
     * The ProgramDeleted method is called when a program has been deleted.
     * @param {VARIANT} varProgramDescriptionID Specifies the unique identifier of the program that was deleted.
     * @returns {HRESULT} Return S_OK if successful, or an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-iguidedataevent-programdeleted
     */
    ProgramDeleted(varProgramDescriptionID) {
        result := ComCall(7, this, "ptr", varProgramDescriptionID, "HRESULT")
        return result
    }

    /**
     * The ServiceDeleted method is called when a service has been deleted.
     * @param {VARIANT} varServiceDescriptionID Specifies the unique identifier of the service that was deleted.
     * @returns {HRESULT} Return S_OK if successful, or an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-iguidedataevent-servicedeleted
     */
    ServiceDeleted(varServiceDescriptionID) {
        result := ComCall(8, this, "ptr", varServiceDescriptionID, "HRESULT")
        return result
    }

    /**
     * The ScheduleDeleted method is called when a schedule entry has been deleted.
     * @param {VARIANT} varScheduleEntryDescriptionID Specifies the unique identifier of the schedule entry that was deleted.
     * @returns {HRESULT} Return S_OK if successful, or an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdatif/nf-bdatif-iguidedataevent-scheduledeleted
     */
    ScheduleDeleted(varScheduleEntryDescriptionID) {
        result := ComCall(9, this, "ptr", varScheduleEntryDescriptionID, "HRESULT")
        return result
    }
}

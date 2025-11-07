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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataevent-guidedataacquired
     */
    GuideDataAcquired() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varProgramDescriptionID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataevent-programchanged
     */
    ProgramChanged(varProgramDescriptionID) {
        result := ComCall(4, this, "ptr", varProgramDescriptionID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varServiceDescriptionID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataevent-servicechanged
     */
    ServiceChanged(varServiceDescriptionID) {
        result := ComCall(5, this, "ptr", varServiceDescriptionID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varScheduleEntryDescriptionID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataevent-scheduleentrychanged
     */
    ScheduleEntryChanged(varScheduleEntryDescriptionID) {
        result := ComCall(6, this, "ptr", varScheduleEntryDescriptionID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varProgramDescriptionID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataevent-programdeleted
     */
    ProgramDeleted(varProgramDescriptionID) {
        result := ComCall(7, this, "ptr", varProgramDescriptionID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varServiceDescriptionID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataevent-servicedeleted
     */
    ServiceDeleted(varServiceDescriptionID) {
        result := ComCall(8, this, "ptr", varServiceDescriptionID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varScheduleEntryDescriptionID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedataevent-scheduledeleted
     */
    ScheduleDeleted(varScheduleEntryDescriptionID) {
        result := ComCall(9, this, "ptr", varScheduleEntryDescriptionID, "HRESULT")
        return result
    }
}

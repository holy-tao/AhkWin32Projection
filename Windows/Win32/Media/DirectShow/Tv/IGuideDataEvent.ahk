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
     * 
     * @returns {HRESULT} 
     */
    GuideDataAcquired() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varProgramDescriptionID 
     * @returns {HRESULT} 
     */
    ProgramChanged(varProgramDescriptionID) {
        result := ComCall(4, this, "ptr", varProgramDescriptionID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varServiceDescriptionID 
     * @returns {HRESULT} 
     */
    ServiceChanged(varServiceDescriptionID) {
        result := ComCall(5, this, "ptr", varServiceDescriptionID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varScheduleEntryDescriptionID 
     * @returns {HRESULT} 
     */
    ScheduleEntryChanged(varScheduleEntryDescriptionID) {
        result := ComCall(6, this, "ptr", varScheduleEntryDescriptionID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varProgramDescriptionID 
     * @returns {HRESULT} 
     */
    ProgramDeleted(varProgramDescriptionID) {
        result := ComCall(7, this, "ptr", varProgramDescriptionID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varServiceDescriptionID 
     * @returns {HRESULT} 
     */
    ServiceDeleted(varServiceDescriptionID) {
        result := ComCall(8, this, "ptr", varServiceDescriptionID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varScheduleEntryDescriptionID 
     * @returns {HRESULT} 
     */
    ScheduleDeleted(varScheduleEntryDescriptionID) {
        result := ComCall(9, this, "ptr", varScheduleEntryDescriptionID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

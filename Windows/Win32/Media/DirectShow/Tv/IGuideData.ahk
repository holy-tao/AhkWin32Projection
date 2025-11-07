#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumTuneRequests.ahk
#Include .\IEnumGuideDataProperties.ahk
#Include ..\..\..\System\Ole\IEnumVARIANT.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IGuideData interface is exposed by the BDA MPEG-2 Transport Information Filter (TIF). It enables the client to get service information from the MPEG-2 transport stream. Use this interface if you are writing a guide store loader.
 * @remarks
 * 
  * The TIF collects service informaton for services, programs, and schedule entries. A service is analogous to a channel; a program is a television show (also known as an "event"); and a schedule entry is an event that occurs at a specific time on a specific service.
  * 
  * For each program and schedule entry, the TIF creates a string that uniquely identifies that element within the multiplex. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/bdatif/nf-bdatif-iguidedata-getguideprogramids">GetGuideProgramIDs</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/bdatif/nf-bdatif-iguidedata-getscheduleentryids">GetScheduleEntryIDs</a> methods return a list of these identifiers. You can then pass the identifier to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/bdatif/nf-bdatif-iguidedata-getprogramproperties">GetProgramProperties</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/bdatif/nf-bdatif-iguidedata-getscheduleentryproperties">GetScheduleEntryProperties</a> methods to get additional properties for a particular element.
  * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IGuideData)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdatif/nn-bdatif-iguidedata
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IGuideData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuideData
     * @type {Guid}
     */
    static IID => Guid("{61571138-5b01-43cd-aeaf-60b784a0bf93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetServices", "GetServiceProperties", "GetGuideProgramIDs", "GetProgramProperties", "GetScheduleEntryIDs", "GetScheduleEntryProperties"]

    /**
     * 
     * @returns {IEnumTuneRequests} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedata-getservices
     */
    GetServices() {
        result := ComCall(3, this, "ptr*", &ppEnumTuneRequests := 0, "HRESULT")
        return IEnumTuneRequests(ppEnumTuneRequests)
    }

    /**
     * 
     * @param {ITuneRequest} pTuneRequest 
     * @returns {IEnumGuideDataProperties} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedata-getserviceproperties
     */
    GetServiceProperties(pTuneRequest) {
        result := ComCall(4, this, "ptr", pTuneRequest, "ptr*", &ppEnumProperties := 0, "HRESULT")
        return IEnumGuideDataProperties(ppEnumProperties)
    }

    /**
     * 
     * @returns {IEnumVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedata-getguideprogramids
     */
    GetGuideProgramIDs() {
        result := ComCall(5, this, "ptr*", &pEnumPrograms := 0, "HRESULT")
        return IEnumVARIANT(pEnumPrograms)
    }

    /**
     * 
     * @param {VARIANT} varProgramDescriptionID 
     * @returns {IEnumGuideDataProperties} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedata-getprogramproperties
     */
    GetProgramProperties(varProgramDescriptionID) {
        result := ComCall(6, this, "ptr", varProgramDescriptionID, "ptr*", &ppEnumProperties := 0, "HRESULT")
        return IEnumGuideDataProperties(ppEnumProperties)
    }

    /**
     * 
     * @returns {IEnumVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedata-getscheduleentryids
     */
    GetScheduleEntryIDs() {
        result := ComCall(7, this, "ptr*", &pEnumScheduleEntries := 0, "HRESULT")
        return IEnumVARIANT(pEnumScheduleEntries)
    }

    /**
     * 
     * @param {VARIANT} varScheduleEntryDescriptionID 
     * @returns {IEnumGuideDataProperties} 
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-iguidedata-getscheduleentryproperties
     */
    GetScheduleEntryProperties(varScheduleEntryDescriptionID) {
        result := ComCall(8, this, "ptr", varScheduleEntryDescriptionID, "ptr*", &ppEnumProperties := 0, "HRESULT")
        return IEnumGuideDataProperties(ppEnumProperties)
    }
}

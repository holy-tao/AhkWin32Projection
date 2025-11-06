#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a mechanism for recipients of published events to restrict the number of event instances they receive.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefileseventsfilter
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesEventsFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesEventsFilter
     * @type {Guid}
     */
    static IID => Guid("{33fc4e1b-0716-40fa-ba65-6e62a84a846f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPathFilter", "GetIncludedEvents", "GetExcludedEvents"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppszFilter 
     * @param {Pointer<Integer>} pMatch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileseventsfilter-getpathfilter
     */
    GetPathFilter(ppszFilter, pMatch) {
        ppszFilterMarshal := ppszFilter is VarRef ? "ptr*" : "ptr"
        pMatchMarshal := pMatch is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, ppszFilterMarshal, ppszFilter, pMatchMarshal, pMatch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cElements 
     * @param {Pointer<Integer>} prgEvents 
     * @param {Pointer<Integer>} pcEvents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileseventsfilter-getincludedevents
     */
    GetIncludedEvents(cElements, prgEvents, pcEvents) {
        prgEventsMarshal := prgEvents is VarRef ? "int*" : "ptr"
        pcEventsMarshal := pcEvents is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", cElements, prgEventsMarshal, prgEvents, pcEventsMarshal, pcEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cElements 
     * @param {Pointer<Integer>} prgEvents 
     * @param {Pointer<Integer>} pcEvents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileseventsfilter-getexcludedevents
     */
    GetExcludedEvents(cElements, prgEvents, pcEvents) {
        prgEventsMarshal := prgEvents is VarRef ? "int*" : "ptr"
        pcEventsMarshal := pcEvents is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", cElements, prgEventsMarshal, prgEvents, pcEventsMarshal, pcEvents, "HRESULT")
        return result
    }
}

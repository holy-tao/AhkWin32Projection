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
     * Retrieves a UNC path string and a scope indicator describing which path-based events should be delivered to this event sink.
     * @param {Pointer<PWSTR>} ppszFilter Receives a fully qualified UNC path string identifying the path associated with the filter. The memory for this string must be allocated using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> function.
     * @param {Pointer<Integer>} pMatch Receives an <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_pathfilter_match">OFFLINEFILES_PATHFILTER_MATCH</a> enumeration  value indicating which descendants of the filter path are to be included in the set of events delivered to the event sink.
     * @returns {HRESULT} Return <b>S_OK</b> if implemented, <b>E_NOTIMPL</b> if not implemented.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefileseventsfilter-getpathfilter
     */
    GetPathFilter(ppszFilter, pMatch) {
        ppszFilterMarshal := ppszFilter is VarRef ? "ptr*" : "ptr"
        pMatchMarshal := pMatch is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, ppszFilterMarshal, ppszFilter, pMatchMarshal, pMatch, "HRESULT")
        return result
    }

    /**
     * Retrieves an array of OFFLINEFILES_EVENTS enumeration values describing which events should be received by the event sink.
     * @param {Integer} cElements Specifies the maximum number of elements that can be stored in the array referenced by the <i>prgEvents</i> parameter.
     * @param {Pointer<Integer>} prgEvents Contains the address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_events">OFFLINEFILES_EVENTS</a> enumeration values.  Place the <b>OFFLINEFILES_EVENT_XXXXXX</b> identifier in an array entry to specify that the corresponding event is desired by this event sink.
     * @param {Pointer<Integer>} pcEvents Receives the actual number of elements written to the array referenced by the <i>prgEvents</i> parameter.
     * @returns {HRESULT} Return <b>S_OK</b> if implemented, <b>E_NOTIMPL</b> if not implemented.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefileseventsfilter-getincludedevents
     */
    GetIncludedEvents(cElements, prgEvents, pcEvents) {
        prgEventsMarshal := prgEvents is VarRef ? "int*" : "ptr"
        pcEventsMarshal := pcEvents is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", cElements, prgEventsMarshal, prgEvents, pcEventsMarshal, pcEvents, "HRESULT")
        return result
    }

    /**
     * Retrieves an array of OFFLINEFILES_EVENTS enumeration values describing which events should not be received by the event sink.
     * @param {Integer} cElements Specifies the maximum number of elements that can be stored in the array referenced by the <i>prgEvents</i> parameter.
     * @param {Pointer<Integer>} prgEvents Contains the address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_events">OFFLINEFILES_EVENTS</a> enumeration values.  Place the <b>OFFLINEFILES_EVENT_XXXXXX</b> identifier in an array entry to specify that the corresponding event is not desired by this event sink.
     * @param {Pointer<Integer>} pcEvents Receives the actual number of elements written to the array referenced by the <i>prgEvents</i> parameter.
     * @returns {HRESULT} Return <b>S_OK</b> if implemented, <b>E_NOTIMPL</b> if not implemented.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefileseventsfilter-getexcludedevents
     */
    GetExcludedEvents(cElements, prgEvents, pcEvents) {
        prgEventsMarshal := prgEvents is VarRef ? "int*" : "ptr"
        pcEventsMarshal := pcEvents is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", cElements, prgEventsMarshal, prgEvents, pcEventsMarshal, pcEvents, "HRESULT")
        return result
    }
}

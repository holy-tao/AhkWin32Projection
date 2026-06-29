#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\OFFLINEFILES_EVENTS.ahk" { OFFLINEFILES_EVENTS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\OFFLINEFILES_PATHFILTER_MATCH.ahk" { OFFLINEFILES_PATHFILTER_MATCH }

/**
 * Provides a mechanism for recipients of published events to restrict the number of event instances they receive.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefileseventsfilter
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesEventsFilter extends IUnknown {
    /**
     * The interface identifier for IOfflineFilesEventsFilter
     * @type {Guid}
     */
    static IID := Guid("{33fc4e1b-0716-40fa-ba65-6e62a84a846f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesEventsFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPathFilter     : IntPtr
        GetIncludedEvents : IntPtr
        GetExcludedEvents : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesEventsFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a UNC path string and a scope indicator describing which path-based events should be delivered to this event sink.
     * @param {Pointer<PWSTR>} ppszFilter Receives a fully qualified UNC path string identifying the path associated with the filter. The memory for this string must be allocated using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> function.
     * @param {Pointer<OFFLINEFILES_PATHFILTER_MATCH>} pMatch Receives an <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_pathfilter_match">OFFLINEFILES_PATHFILTER_MATCH</a> enumeration  value indicating which descendants of the filter path are to be included in the set of events delivered to the event sink.
     * @returns {HRESULT} Return <b>S_OK</b> if implemented, <b>E_NOTIMPL</b> if not implemented.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileseventsfilter-getpathfilter
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
     * @param {Pointer<OFFLINEFILES_EVENTS>} prgEvents Contains the address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_events">OFFLINEFILES_EVENTS</a> enumeration values.  Place the <b>OFFLINEFILES_EVENT_XXXXXX</b> identifier in an array entry to specify that the corresponding event is desired by this event sink.
     * @param {Pointer<Integer>} pcEvents Receives the actual number of elements written to the array referenced by the <i>prgEvents</i> parameter.
     * @returns {HRESULT} Return <b>S_OK</b> if implemented, <b>E_NOTIMPL</b> if not implemented.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileseventsfilter-getincludedevents
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
     * @param {Pointer<OFFLINEFILES_EVENTS>} prgEvents Contains the address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_events">OFFLINEFILES_EVENTS</a> enumeration values.  Place the <b>OFFLINEFILES_EVENT_XXXXXX</b> identifier in an array entry to specify that the corresponding event is not desired by this event sink.
     * @param {Pointer<Integer>} pcEvents Receives the actual number of elements written to the array referenced by the <i>prgEvents</i> parameter.
     * @returns {HRESULT} Return <b>S_OK</b> if implemented, <b>E_NOTIMPL</b> if not implemented.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefileseventsfilter-getexcludedevents
     */
    GetExcludedEvents(cElements, prgEvents, pcEvents) {
        prgEventsMarshal := prgEvents is VarRef ? "int*" : "ptr"
        pcEventsMarshal := pcEvents is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", cElements, prgEventsMarshal, prgEvents, pcEventsMarshal, pcEvents, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOfflineFilesEventsFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPathFilter := CallbackCreate(GetMethod(implObj, "GetPathFilter"), flags, 3)
        this.vtbl.GetIncludedEvents := CallbackCreate(GetMethod(implObj, "GetIncludedEvents"), flags, 4)
        this.vtbl.GetExcludedEvents := CallbackCreate(GetMethod(implObj, "GetExcludedEvents"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPathFilter)
        CallbackFree(this.vtbl.GetIncludedEvents)
        CallbackFree(this.vtbl.GetExcludedEvents)
    }
}

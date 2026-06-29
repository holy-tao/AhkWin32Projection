#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\COR_PRF_EVENTPIPE_PROVIDER_CONFIG.ahk" { COR_PRF_EVENTPIPE_PROVIDER_CONFIG }
#Import ".\COR_PRF_EVENTPIPE_PARAM_DESC.ahk" { COR_PRF_EVENTPIPE_PARAM_DESC }
#Import ".\ICorProfilerInfo11.ahk" { ICorProfilerInfo11 }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\COR_PRF_EVENT_DATA.ahk" { COR_PRF_EVENT_DATA }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerInfo12 extends ICorProfilerInfo11 {
    /**
     * The interface identifier for ICorProfilerInfo12
     * @type {Guid}
     */
    static IID := Guid("{27b24ccd-1cb1-47c5-96ee-98190dc30959}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerInfo12 interfaces
    */
    struct Vtbl extends ICorProfilerInfo11.Vtbl {
        EventPipeStartSession         : IntPtr
        EventPipeAddProviderToSession : IntPtr
        EventPipeStopSession          : IntPtr
        EventPipeCreateProvider       : IntPtr
        EventPipeGetProviderInfo      : IntPtr
        EventPipeDefineEvent          : IntPtr
        EventPipeWriteEvent           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerInfo12.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cProviderConfigs 
     * @param {Pointer<COR_PRF_EVENTPIPE_PROVIDER_CONFIG>} pProviderConfigs 
     * @param {BOOL} requestRundown 
     * @returns {Integer} 
     */
    EventPipeStartSession(cProviderConfigs, pProviderConfigs, requestRundown) {
        result := ComCall(101, this, "uint", cProviderConfigs, COR_PRF_EVENTPIPE_PROVIDER_CONFIG.Ptr, pProviderConfigs, BOOL, requestRundown, "uint*", &pSession := 0, "HRESULT")
        return pSession
    }

    /**
     * 
     * @param {Integer} session 
     * @param {COR_PRF_EVENTPIPE_PROVIDER_CONFIG} providerConfig 
     * @returns {HRESULT} 
     */
    EventPipeAddProviderToSession(session, providerConfig) {
        result := ComCall(102, this, "uint", session, COR_PRF_EVENTPIPE_PROVIDER_CONFIG, providerConfig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} session 
     * @returns {HRESULT} 
     */
    EventPipeStopSession(session) {
        result := ComCall(103, this, "uint", session, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} providerName 
     * @returns {Pointer} 
     */
    EventPipeCreateProvider(providerName) {
        providerName := providerName is String ? StrPtr(providerName) : providerName

        result := ComCall(104, this, "ptr", providerName, "ptr*", &pProvider := 0, "HRESULT")
        return pProvider
    }

    /**
     * 
     * @param {Pointer} provider 
     * @param {Integer} cchName 
     * @param {PWSTR} providerName 
     * @returns {Integer} 
     */
    EventPipeGetProviderInfo(provider, cchName, providerName) {
        providerName := providerName is String ? StrPtr(providerName) : providerName

        result := ComCall(105, this, "ptr", provider, "uint", cchName, "uint*", &pcchName := 0, "ptr", providerName, "HRESULT")
        return pcchName
    }

    /**
     * 
     * @param {Pointer} provider 
     * @param {PWSTR} eventName 
     * @param {Integer} eventID 
     * @param {Integer} keywords 
     * @param {Integer} eventVersion 
     * @param {Integer} level 
     * @param {Integer} opcode 
     * @param {BOOL} needStack 
     * @param {Integer} cParamDescs 
     * @param {Pointer<COR_PRF_EVENTPIPE_PARAM_DESC>} pParamDescs 
     * @returns {Pointer} 
     */
    EventPipeDefineEvent(provider, eventName, eventID, keywords, eventVersion, level, opcode, needStack, cParamDescs, pParamDescs) {
        eventName := eventName is String ? StrPtr(eventName) : eventName

        result := ComCall(106, this, "ptr", provider, "ptr", eventName, "uint", eventID, "uint", keywords, "uint", eventVersion, "uint", level, "char", opcode, BOOL, needStack, "uint", cParamDescs, COR_PRF_EVENTPIPE_PARAM_DESC.Ptr, pParamDescs, "ptr*", &pEvent := 0, "HRESULT")
        return pEvent
    }

    /**
     * 
     * @param {Pointer} event 
     * @param {Integer} cData 
     * @param {Pointer<COR_PRF_EVENT_DATA>} data 
     * @param {Pointer<Guid>} pActivityId 
     * @param {Pointer<Guid>} pRelatedActivityId 
     * @returns {HRESULT} 
     */
    EventPipeWriteEvent(event, cData, data, pActivityId, pRelatedActivityId) {
        result := ComCall(107, this, "ptr", event, "uint", cData, COR_PRF_EVENT_DATA.Ptr, data, Guid.Ptr, pActivityId, Guid.Ptr, pRelatedActivityId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorProfilerInfo12.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EventPipeStartSession := CallbackCreate(GetMethod(implObj, "EventPipeStartSession"), flags, 5)
        this.vtbl.EventPipeAddProviderToSession := CallbackCreate(GetMethod(implObj, "EventPipeAddProviderToSession"), flags, 3)
        this.vtbl.EventPipeStopSession := CallbackCreate(GetMethod(implObj, "EventPipeStopSession"), flags, 2)
        this.vtbl.EventPipeCreateProvider := CallbackCreate(GetMethod(implObj, "EventPipeCreateProvider"), flags, 3)
        this.vtbl.EventPipeGetProviderInfo := CallbackCreate(GetMethod(implObj, "EventPipeGetProviderInfo"), flags, 5)
        this.vtbl.EventPipeDefineEvent := CallbackCreate(GetMethod(implObj, "EventPipeDefineEvent"), flags, 12)
        this.vtbl.EventPipeWriteEvent := CallbackCreate(GetMethod(implObj, "EventPipeWriteEvent"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EventPipeStartSession)
        CallbackFree(this.vtbl.EventPipeAddProviderToSession)
        CallbackFree(this.vtbl.EventPipeStopSession)
        CallbackFree(this.vtbl.EventPipeCreateProvider)
        CallbackFree(this.vtbl.EventPipeGetProviderInfo)
        CallbackFree(this.vtbl.EventPipeDefineEvent)
        CallbackFree(this.vtbl.EventPipeWriteEvent)
    }
}

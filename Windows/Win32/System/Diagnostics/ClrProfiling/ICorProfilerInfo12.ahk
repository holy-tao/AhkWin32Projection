#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo11.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo12 extends ICorProfilerInfo11{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerInfo12
     * @type {Guid}
     */
    static IID => Guid("{27b24ccd-1cb1-47c5-96ee-98190dc30959}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 101

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EventPipeStartSession", "EventPipeAddProviderToSession", "EventPipeStopSession", "EventPipeCreateProvider", "EventPipeGetProviderInfo", "EventPipeDefineEvent", "EventPipeWriteEvent"]

    /**
     * 
     * @param {Integer} cProviderConfigs 
     * @param {Pointer<COR_PRF_EVENTPIPE_PROVIDER_CONFIG>} pProviderConfigs 
     * @param {BOOL} requestRundown 
     * @param {Pointer<Integer>} pSession 
     * @returns {HRESULT} 
     */
    EventPipeStartSession(cProviderConfigs, pProviderConfigs, requestRundown, pSession) {
        pSessionMarshal := pSession is VarRef ? "uint*" : "ptr"

        result := ComCall(101, this, "uint", cProviderConfigs, "ptr", pProviderConfigs, "int", requestRundown, pSessionMarshal, pSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} session 
     * @param {COR_PRF_EVENTPIPE_PROVIDER_CONFIG} providerConfig 
     * @returns {HRESULT} 
     */
    EventPipeAddProviderToSession(session, providerConfig) {
        result := ComCall(102, this, "uint", session, "ptr", providerConfig, "HRESULT")
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
     * @param {Pointer<Pointer>} pProvider 
     * @returns {HRESULT} 
     */
    EventPipeCreateProvider(providerName, pProvider) {
        providerName := providerName is String ? StrPtr(providerName) : providerName

        pProviderMarshal := pProvider is VarRef ? "ptr*" : "ptr"

        result := ComCall(104, this, "ptr", providerName, pProviderMarshal, pProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} provider 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pcchName 
     * @param {PWSTR} providerName 
     * @returns {HRESULT} 
     */
    EventPipeGetProviderInfo(provider, cchName, pcchName, providerName) {
        providerName := providerName is String ? StrPtr(providerName) : providerName

        pcchNameMarshal := pcchName is VarRef ? "uint*" : "ptr"

        result := ComCall(105, this, "ptr", provider, "uint", cchName, pcchNameMarshal, pcchName, "ptr", providerName, "HRESULT")
        return result
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
     * @param {Pointer<Pointer>} pEvent 
     * @returns {HRESULT} 
     */
    EventPipeDefineEvent(provider, eventName, eventID, keywords, eventVersion, level, opcode, needStack, cParamDescs, pParamDescs, pEvent) {
        eventName := eventName is String ? StrPtr(eventName) : eventName

        pEventMarshal := pEvent is VarRef ? "ptr*" : "ptr"

        result := ComCall(106, this, "ptr", provider, "ptr", eventName, "uint", eventID, "uint", keywords, "uint", eventVersion, "uint", level, "char", opcode, "int", needStack, "uint", cParamDescs, "ptr", pParamDescs, pEventMarshal, pEvent, "HRESULT")
        return result
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
        result := ComCall(107, this, "ptr", event, "uint", cData, "ptr", data, "ptr", pActivityId, "ptr", pRelatedActivityId, "HRESULT")
        return result
    }
}

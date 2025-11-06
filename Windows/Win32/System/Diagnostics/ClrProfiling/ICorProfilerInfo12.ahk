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
     * @returns {Integer} 
     */
    EventPipeStartSession(cProviderConfigs, pProviderConfigs, requestRundown) {
        result := ComCall(101, this, "uint", cProviderConfigs, "ptr", pProviderConfigs, "int", requestRundown, "uint*", &pSession := 0, "HRESULT")
        return pSession
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

        result := ComCall(106, this, "ptr", provider, "ptr", eventName, "uint", eventID, "uint", keywords, "uint", eventVersion, "uint", level, "char", opcode, "int", needStack, "uint", cParamDescs, "ptr", pParamDescs, "ptr*", &pEvent := 0, "HRESULT")
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
        result := ComCall(107, this, "ptr", event, "uint", cData, "ptr", data, "ptr", pActivityId, "ptr", pRelatedActivityId, "HRESULT")
        return result
    }
}

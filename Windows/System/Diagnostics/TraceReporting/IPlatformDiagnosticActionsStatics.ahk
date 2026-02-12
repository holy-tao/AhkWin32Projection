#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\PlatformDiagnosticTraceRuntimeInfo.ahk
#Include .\PlatformDiagnosticTraceInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics.TraceReporting
 * @version WindowsRuntime 1.4
 */
class IPlatformDiagnosticActionsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlatformDiagnosticActionsStatics
     * @type {Guid}
     */
    static IID => Guid("{c1145cfa-9292-4267-890a-9ea3ed072312}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsScenarioEnabled", "TryEscalateScenario", "DownloadLatestSettingsForNamespace", "GetActiveScenarioList", "ForceUpload", "IsTraceRunning", "GetActiveTraceRuntime", "GetKnownTraceList"]

    /**
     * 
     * @param {Guid} scenarioId 
     * @returns {Boolean} 
     */
    IsScenarioEnabled(scenarioId) {
        result := ComCall(6, this, "ptr", scenarioId, "int*", &isActive := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isActive
    }

    /**
     * 
     * @param {Guid} scenarioId 
     * @param {Integer} escalationType 
     * @param {HSTRING} outputDirectory 
     * @param {Boolean} timestampOutputDirectory 
     * @param {Boolean} forceEscalationUpload 
     * @param {IMapView<HSTRING, HSTRING>} triggers 
     * @returns {Boolean} 
     */
    TryEscalateScenario(scenarioId, escalationType, outputDirectory, timestampOutputDirectory, forceEscalationUpload, triggers) {
        if(outputDirectory is String) {
            pin := HSTRING.Create(outputDirectory)
            outputDirectory := pin.Value
        }
        outputDirectory := outputDirectory is Win32Handle ? NumGet(outputDirectory, "ptr") : outputDirectory

        result := ComCall(7, this, "ptr", scenarioId, "int", escalationType, "ptr", outputDirectory, "int", timestampOutputDirectory, "int", forceEscalationUpload, "ptr", triggers, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} partner 
     * @param {HSTRING} feature 
     * @param {Boolean} isScenarioNamespace 
     * @param {Boolean} downloadOverCostedNetwork 
     * @param {Boolean} downloadOverBattery 
     * @returns {Integer} 
     */
    DownloadLatestSettingsForNamespace(partner, feature, isScenarioNamespace, downloadOverCostedNetwork, downloadOverBattery) {
        if(partner is String) {
            pin := HSTRING.Create(partner)
            partner := pin.Value
        }
        partner := partner is Win32Handle ? NumGet(partner, "ptr") : partner
        if(feature is String) {
            pin := HSTRING.Create(feature)
            feature := pin.Value
        }
        feature := feature is Win32Handle ? NumGet(feature, "ptr") : feature

        result := ComCall(8, this, "ptr", partner, "ptr", feature, "int", isScenarioNamespace, "int", downloadOverCostedNetwork, "int", downloadOverBattery, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IVectorView<Guid>} 
     */
    GetActiveScenarioList() {
        result := ComCall(9, this, "ptr*", &scenarioIds := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetGuid(), scenarioIds)
    }

    /**
     * 
     * @param {Integer} latency 
     * @param {Boolean} uploadOverCostedNetwork 
     * @param {Boolean} uploadOverBattery 
     * @returns {Integer} 
     */
    ForceUpload(latency, uploadOverCostedNetwork, uploadOverBattery) {
        result := ComCall(10, this, "uint", latency, "int", uploadOverCostedNetwork, "int", uploadOverBattery, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} slotType 
     * @param {Guid} scenarioId 
     * @param {Integer} traceProfileHash 
     * @returns {Integer} 
     */
    IsTraceRunning(slotType, scenarioId, traceProfileHash) {
        result := ComCall(11, this, "int", slotType, "ptr", scenarioId, "uint", traceProfileHash, "int*", &slotState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return slotState
    }

    /**
     * 
     * @param {Integer} slotType 
     * @returns {PlatformDiagnosticTraceRuntimeInfo} 
     */
    GetActiveTraceRuntime(slotType) {
        result := ComCall(12, this, "int", slotType, "ptr*", &traceRuntimeInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlatformDiagnosticTraceRuntimeInfo(traceRuntimeInfo)
    }

    /**
     * 
     * @param {Integer} slotType 
     * @returns {IVectorView<PlatformDiagnosticTraceInfo>} 
     */
    GetKnownTraceList(slotType) {
        result := ComCall(13, this, "int", slotType, "ptr*", &traceInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PlatformDiagnosticTraceInfo, traceInfo)
    }
}

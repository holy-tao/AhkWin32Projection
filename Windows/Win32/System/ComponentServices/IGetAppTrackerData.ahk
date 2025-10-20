#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables administrative applications to retrieve statistical information about running COM+ applications.
 * @remarks
 * 
  * Applications that use tracker data will usually need to poll the Tracker Server periodically to ensure that this data is up-to-date. For example, an administrative application that displays tracking data to the user would typically want this data to be near as possible to real-time. However, polling too frequently can degrade overall system performance. Also keep in mind that the COM+ applications updating the data do not send updates to the Tracker Server immediately, so even in the best case there will be some delay (typically only a few seconds).
  * 
  * Polling frequency is a global policy that administrators can adjust, if necessary, to balance between freshness of data and performance impact for the particular set of tools in use on the systems they manage. The value returned in PollingIntervalInSeconds is the minimum amount of time that an application should wait after retrieving tracking data before making another call to retrieve the same data. Any application that polls the Tracker Server should call this method and adjust their polling behavior accordingly.
  * 
  * The polling interval is by default equal to the tracking event frequency (three seconds). This value can be adjusted by writing the following DWORD registry value:
  * 
  * 
  * <b>HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\COM3</b>&#92;<b>TrackingInfoPollingFrequency</b> = <i>minimum polling interval in seconds</i>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-igetapptrackerdata
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IGetAppTrackerData extends IUnknown{
    /**
     * The interface identifier for IGetAppTrackerData
     * @type {Guid}
     */
    static IID => Guid("{507c3ac8-3e12-4cb0-9366-653d3e050638}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} PartitionId 
     * @param {Pointer<Guid>} ApplicationId 
     * @param {Integer} Flags 
     * @param {Pointer<UInt32>} NumApplicationProcesses 
     * @param {Pointer<ApplicationProcessSummary>} ApplicationProcesses 
     * @returns {HRESULT} 
     */
    GetApplicationProcesses(PartitionId, ApplicationId, Flags, NumApplicationProcesses, ApplicationProcesses) {
        result := ComCall(3, this, "ptr", PartitionId, "ptr", ApplicationId, "uint", Flags, "uint*", NumApplicationProcesses, "ptr", ApplicationProcesses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ApplicationInstanceId 
     * @param {Integer} ProcessId 
     * @param {Integer} Flags 
     * @param {Pointer<ApplicationProcessSummary>} Summary 
     * @param {Pointer<ApplicationProcessStatistics>} Statistics 
     * @param {Pointer<ApplicationProcessRecycleInfo>} RecycleInfo 
     * @param {Pointer<BOOL>} AnyComponentsHangMonitored 
     * @returns {HRESULT} 
     */
    GetApplicationProcessDetails(ApplicationInstanceId, ProcessId, Flags, Summary, Statistics, RecycleInfo, AnyComponentsHangMonitored) {
        result := ComCall(4, this, "ptr", ApplicationInstanceId, "uint", ProcessId, "uint", Flags, "ptr", Summary, "ptr", Statistics, "ptr", RecycleInfo, "ptr", AnyComponentsHangMonitored, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ApplicationInstanceId 
     * @param {Integer} ProcessId 
     * @param {Pointer<Guid>} PartitionId 
     * @param {Integer} Flags 
     * @param {Pointer<UInt32>} NumApplicationsInProcess 
     * @param {Pointer<ApplicationSummary>} Applications 
     * @returns {HRESULT} 
     */
    GetApplicationsInProcess(ApplicationInstanceId, ProcessId, PartitionId, Flags, NumApplicationsInProcess, Applications) {
        result := ComCall(5, this, "ptr", ApplicationInstanceId, "uint", ProcessId, "ptr", PartitionId, "uint", Flags, "uint*", NumApplicationsInProcess, "ptr", Applications, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ApplicationInstanceId 
     * @param {Integer} ProcessId 
     * @param {Pointer<Guid>} PartitionId 
     * @param {Pointer<Guid>} ApplicationId 
     * @param {Integer} Flags 
     * @param {Pointer<UInt32>} NumComponentsInProcess 
     * @param {Pointer<ComponentSummary>} Components 
     * @returns {HRESULT} 
     */
    GetComponentsInProcess(ApplicationInstanceId, ProcessId, PartitionId, ApplicationId, Flags, NumComponentsInProcess, Components) {
        result := ComCall(6, this, "ptr", ApplicationInstanceId, "uint", ProcessId, "ptr", PartitionId, "ptr", ApplicationId, "uint", Flags, "uint*", NumComponentsInProcess, "ptr", Components, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ApplicationInstanceId 
     * @param {Integer} ProcessId 
     * @param {Pointer<Guid>} Clsid 
     * @param {Integer} Flags 
     * @param {Pointer<ComponentSummary>} Summary 
     * @param {Pointer<ComponentStatistics>} Statistics 
     * @param {Pointer<ComponentHangMonitorInfo>} HangMonitorInfo 
     * @returns {HRESULT} 
     */
    GetComponentDetails(ApplicationInstanceId, ProcessId, Clsid, Flags, Summary, Statistics, HangMonitorInfo) {
        result := ComCall(7, this, "ptr", ApplicationInstanceId, "uint", ProcessId, "ptr", Clsid, "uint", Flags, "ptr", Summary, "ptr", Statistics, "ptr", HangMonitorInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} TopLevelCollection 
     * @returns {HRESULT} 
     */
    GetTrackerDataAsCollectionObject(TopLevelCollection) {
        result := ComCall(8, this, "ptr", TopLevelCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} PollingIntervalInSeconds 
     * @returns {HRESULT} 
     */
    GetSuggestedPollingInterval(PollingIntervalInSeconds) {
        result := ComCall(9, this, "uint*", PollingIntervalInSeconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

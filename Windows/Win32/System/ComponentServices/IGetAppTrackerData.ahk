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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetApplicationProcesses", "GetApplicationProcessDetails", "GetApplicationsInProcess", "GetComponentsInProcess", "GetComponentDetails", "GetTrackerDataAsCollectionObject", "GetSuggestedPollingInterval"]

    /**
     * Retrieves summary information for all processes that are hosting COM+ applications, or for a specified subset of these processes.
     * @param {Pointer<Guid>} PartitionId A partition ID to filter results, or GUID_NULL for all partitions.
     * @param {Pointer<Guid>} ApplicationId An application ID to filter results, or GUID_NULL for all applications.
     * @param {Integer} Flags A combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-getapptrackerdataflags">GetAppTrackerDataFlags</a> enumeration to filter results and to select which data is returned. The following flags are supported: GATD_INCLUDE_PROCESS_EXE_NAME, GATD_INCLUDE_LIBRARY_APPS, GATD_INCLUDE_SWC. See remarks below for more information.
     * @param {Pointer<Integer>} NumApplicationProcesses On return, the number of processes that match the filter criteria specified by <i>PartitionId</i>, <i>ApplicationId</i>, and <i>Flags</i>.
     * @param {Pointer<Pointer<ApplicationProcessSummary>>} ApplicationProcesses On return, an array of <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-applicationprocesssummary">ApplicationProcessSummary</a> structures for the matching processes.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG and E_OUTOFMEMORY, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully and the results are in the <i>ApplicationProcesses</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully, but there were no processes the matched the filter criteria.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-igetapptrackerdata-getapplicationprocesses
     */
    GetApplicationProcesses(PartitionId, ApplicationId, Flags, NumApplicationProcesses, ApplicationProcesses) {
        NumApplicationProcessesMarshal := NumApplicationProcesses is VarRef ? "uint*" : "ptr"
        ApplicationProcessesMarshal := ApplicationProcesses is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", PartitionId, "ptr", ApplicationId, "uint", Flags, NumApplicationProcessesMarshal, NumApplicationProcesses, ApplicationProcessesMarshal, ApplicationProcesses, "HRESULT")
        return result
    }

    /**
     * Retrieves detailed information about a single process hosting COM+ applications.
     * @param {Pointer<Guid>} ApplicationInstanceId The application instance GUID that uniquely identifies the tracked process to select, or GUID_NULL if the <i>ProcessId</i> parameter will be used for selection instead.
     * @param {Integer} ProcessId The process ID that identifies the process to select, or 0 if the <i>ApplicationInstanceId</i> parameter will be used for selection instead.
     * @param {Integer} Flags A combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-getapptrackerdataflags">GetAppTrackerDataFlags</a> enumeration that specify which data is to be returned. The following flags are supported: GATD_INCLUDE_PROCESS_EXE_NAME (if retrieving a summary).
     * @param {Pointer<ApplicationProcessSummary>} Summary On return, a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-applicationprocesssummary">ApplicationProcessSummary</a> structure with summary information for the process. This parameter can be <b>NULL</b>.
     * @param {Pointer<ApplicationProcessStatistics>} Statistics On return, a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-applicationprocessstatistics">ApplicationProcessStatistics</a> structure with statistics for the process. This parameter can be <b>NULL</b>.
     * @param {Pointer<ApplicationProcessRecycleInfo>} RecycleInfo On return, a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-applicationprocessrecycleinfo">ApplicationProcessRecycleInfo</a> structure with recycling details for the process. This parameter can be <b>NULL</b>.
     * @param {Pointer<BOOL>} AnyComponentsHangMonitored On return, indicates whether any components in the process are configured for hang monitoring. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG and E_OUTOFMEMORY, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_APP_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified process does not exist, or is not hosting any tracked COM+ applications.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-igetapptrackerdata-getapplicationprocessdetails
     */
    GetApplicationProcessDetails(ApplicationInstanceId, ProcessId, Flags, Summary, Statistics, RecycleInfo, AnyComponentsHangMonitored) {
        AnyComponentsHangMonitoredMarshal := AnyComponentsHangMonitored is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", ApplicationInstanceId, "uint", ProcessId, "uint", Flags, "ptr", Summary, "ptr", Statistics, "ptr", RecycleInfo, AnyComponentsHangMonitoredMarshal, AnyComponentsHangMonitored, "HRESULT")
        return result
    }

    /**
     * Retrieves summary information for all COM+ applications hosted in a single process, or for a specified subset of these applications.
     * @param {Pointer<Guid>} ApplicationInstanceId The application instance GUID that uniquely identifies the tracked process to select, or GUID_NULL if the <i>ProcessId</i> parameter will be used for selection instead.
     * @param {Integer} ProcessId The process ID that identifies the process to select, or 0 if <i>ApplicationInstanceId</i> will be used for selection instead.
     * @param {Pointer<Guid>} PartitionId A partition ID to filter results, or GUID_NULL for all partitions.
     * @param {Integer} Flags A combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-getapptrackerdataflags">GetAppTrackerDataFlags</a> enumeration to filter results and to select which data is returned. The following flags are supported: GATD_INCLUDE_LIBRARY_APPS, GATD_INCLUDE_SWC, GATD_INCLUDE_APPLICATION_NAME. See Remarks below for more information.
     * @param {Pointer<Integer>} NumApplicationsInProcess On return, the number of applications in the process that match the filter criteria specified by <i>PartitionId</i> and <i>Flags</i>.
     * @param {Pointer<Pointer<ApplicationSummary>>} Applications On return, an array of <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-applicationsummary">ApplicationSummary</a> structures for the matching applications.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG and E_OUTOFMEMORY, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully and the results are in the <i>Applications</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully, but there were no processes the matched the filter criteria.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_APP_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified process does not exist, or is not hosting any tracked COM+ applications.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-igetapptrackerdata-getapplicationsinprocess
     */
    GetApplicationsInProcess(ApplicationInstanceId, ProcessId, PartitionId, Flags, NumApplicationsInProcess, Applications) {
        NumApplicationsInProcessMarshal := NumApplicationsInProcess is VarRef ? "uint*" : "ptr"
        ApplicationsMarshal := Applications is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", ApplicationInstanceId, "uint", ProcessId, "ptr", PartitionId, "uint", Flags, NumApplicationsInProcessMarshal, NumApplicationsInProcess, ApplicationsMarshal, Applications, "HRESULT")
        return result
    }

    /**
     * Retrieves summary information for all COM+ components hosted in a single process, or for a specified subset of these components.
     * @param {Pointer<Guid>} ApplicationInstanceId The application instance GUID that uniquely identifies the tracked process to select, or GUID_NULL if the <i>ProcessId</i> parameter will be used for selection instead.
     * @param {Integer} ProcessId The process ID that identifies the process to select, or 0 if the <i>ApplicationInstanceId</i> parameter will be used for selection instead.
     * @param {Pointer<Guid>} PartitionId A partition ID to filter results, or GUID_NULL for all partitions.
     * @param {Pointer<Guid>} ApplicationId An application ID to filter results, or GUID_NULL for all applications.
     * @param {Integer} Flags A combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-getapptrackerdataflags">GetAppTrackerDataFlags</a> enumeration to filter results and to select which data is returned. The following flags are supported: GATD_INCLUDE_LIBRARY_APPS, GATD_INCLUDE_SWC, GATD_INCLUDE_CLASS_NAME, GATD_INCLUDE_APPLICATION_NAME. See Remarks below for more information.
     * @param {Pointer<Integer>} NumComponentsInProcess On return, the number of components in the process that match the filter criteria specified by <i>PartitionId</i>, <i>ApplicationId</i>, and <i>Flags</i>.
     * @param {Pointer<Pointer<ComponentSummary>>} Components On return, an array of <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-componentsummary">ComponentSummary</a> structures for the matching components.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG and E_OUTOFMEMORY, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully and the results are in the <i>Components</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully, but there were no components the matched the filter criteria.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_APP_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified process does not exist, or is not hosting any tracked COM+ applications.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-igetapptrackerdata-getcomponentsinprocess
     */
    GetComponentsInProcess(ApplicationInstanceId, ProcessId, PartitionId, ApplicationId, Flags, NumComponentsInProcess, Components) {
        NumComponentsInProcessMarshal := NumComponentsInProcess is VarRef ? "uint*" : "ptr"
        ComponentsMarshal := Components is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", ApplicationInstanceId, "uint", ProcessId, "ptr", PartitionId, "ptr", ApplicationId, "uint", Flags, NumComponentsInProcessMarshal, NumComponentsInProcess, ComponentsMarshal, Components, "HRESULT")
        return result
    }

    /**
     * Retrieves detailed information about a single COM+ component hosted in a process.
     * @param {Pointer<Guid>} ApplicationInstanceId The application instance GUID that uniquely identifies the tracked process to select, or GUID_NULL if the <i>ProcessId</i> parameter will be used for selection instead.
     * @param {Integer} ProcessId The process ID that identifies the process to select, or 0 if <i>ApplicationInstanceId</i> will be used for selection instead.
     * @param {Pointer<Guid>} Clsid The CLSID of the component.
     * @param {Integer} Flags A combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-getapptrackerdataflags">GetAppTrackerDataFlags</a> enumeration to select which data is returned. The following flags are supported: GATD_INCLUDE_CLASS_NAME (if retrieving a summary), GATD_INCLUDE_APPLICATION_NAME (if retrieving a summary).
     * @param {Pointer<ComponentSummary>} Summary On return, a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-componentsummary">ComponentSummary</a> structure with summary information for the component. This parameter can be <b>NULL</b>.
     * @param {Pointer<ComponentStatistics>} Statistics On return, a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-componentstatistics">ComponentStatistics</a> structure with statistics for the component. This parameter can be <b>NULL</b>.
     * @param {Pointer<ComponentHangMonitorInfo>} HangMonitorInfo On return, a <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-componenthangmonitorinfo">ComponentHangMonitorInfo</a> structure with hang monitoring configuration for the component. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG and E_OUTOFMEMORY, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_APP_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified process does not exist, or is not hosting any tracked COM+ applications.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_OBJECT_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified component does not exist in the specified process.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-igetapptrackerdata-getcomponentdetails
     */
    GetComponentDetails(ApplicationInstanceId, ProcessId, Clsid, Flags, Summary, Statistics, HangMonitorInfo) {
        result := ComCall(7, this, "ptr", ApplicationInstanceId, "uint", ProcessId, "ptr", Clsid, "uint", Flags, "ptr", Summary, "ptr", Statistics, "ptr", HangMonitorInfo, "HRESULT")
        return result
    }

    /**
     * Retrieves tracking data for all COM+ applications in the form of a collection object.
     * @returns {IUnknown} On return, the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for a collection of tracker data.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-igetapptrackerdata-gettrackerdataascollectionobject
     */
    GetTrackerDataAsCollectionObject() {
        result := ComCall(8, this, "ptr*", &TopLevelCollection := 0, "HRESULT")
        return IUnknown(TopLevelCollection)
    }

    /**
     * Retrieves the minimum interval for polling suggested by the Tracker Server.
     * @returns {Integer} The Tracker Server's suggested polling interval, in seconds.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-igetapptrackerdata-getsuggestedpollinginterval
     */
    GetSuggestedPollingInterval() {
        result := ComCall(9, this, "uint*", &PollingIntervalInSeconds := 0, "HRESULT")
        return PollingIntervalInSeconds
    }
}

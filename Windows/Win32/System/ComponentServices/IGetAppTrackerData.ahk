#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables administrative applications to retrieve statistical information about running COM+ applications.
 * @remarks
 * Applications that use tracker data will usually need to poll the Tracker Server periodically to ensure that this data is up-to-date. For example, an administrative application that displays tracking data to the user would typically want this data to be near as possible to real-time. However, polling too frequently can degrade overall system performance. Also keep in mind that the COM+ applications updating the data do not send updates to the Tracker Server immediately, so even in the best case there will be some delay (typically only a few seconds).
 * 
 * Polling frequency is a global policy that administrators can adjust, if necessary, to balance between freshness of data and performance impact for the particular set of tools in use on the systems they manage. The value returned in PollingIntervalInSeconds is the minimum amount of time that an application should wait after retrieving tracking data before making another call to retrieve the same data. Any application that polls the Tracker Server should call this method and adjust their polling behavior accordingly.
 * 
 * The polling interval is by default equal to the tracking event frequency (three seconds). This value can be adjusted by writing the following DWORD registry value:
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\COM3</b>&#92;<b>TrackingInfoPollingFrequency</b> = <i>minimum polling interval in seconds</i>
 * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nn-comsvcs-igetapptrackerdata
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
     * @remarks
     * The <i>PartitionId</i>, <i>ApplicationId</i>, and <i>Flags</i> parameters can be used to specify filter criteria if the caller only wants information on a subset of tracked processes.
     * 
     * 
     * 
     * If neither GATD_INCLUDE_LIBRARY_APPS nor GATD_INCLUDE_SWC are set in <i>Flags</i>, the results include COM+ server application instances only. The <i>ApplicationId</i> parameter can be used to select instances of a specific COM+ server application, and the <i>PartitionId</i> parameter for COM+ server applications from a specific partition.
     * 
     * If either GATD_INCLUDE_LIBRARY_APPS or GATD_INCLUDE_SWC are set, the results also include processes that are hosting COM+ library applications or Services Without Components contexts, respectively. In these cases, <i>ApplicationId</i> and <i>PartitionId</i> filter processes based on all applications (of the requested types) that the process is hosting. If a process includes at least one application that matches the criteria, it will be included in the results.
     * 
     * For example, imagine the following COM+ applications are installed:
     * 
     * 
     * 
     * <ul>
     * <li>AppX is a server application in PartitionA.
     * </li>
     * <li>AppY is a library application in PartitionA.
     * </li>
     * <li>AppZ is a server application in PartitionB.
     * </li>
     * </ul>
     * If <i>PartitionId</i> specifies PartitionA, and GATD_INCLUDE_LIBRARY_APPS is set:
     * 
     * 
     * 
     * <ul>
     * <li>An instance of AppX will be included.
     * </li>
     * <li>A client process that has created components from AppY will be included.
     * </li>
     * <li>An instance of AppZ containing no other COM+ components will not be included because AppZ is not in the partition specified by <i>PartitionId</i>.
     * </li>
     * <li>However, if there is another instance of AppZ, but which has also created components from AppY, this process will be included even though the server application is not in the partition specified by <i>PartitionId</i>. This process would not be included if GATD_INCLUDE_LIBRARY_APPS was not set.
     * </li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-igetapptrackerdata-getapplicationprocesses
     */
    GetApplicationProcesses(PartitionId, ApplicationId, Flags, NumApplicationProcesses, ApplicationProcesses) {
        NumApplicationProcessesMarshal := NumApplicationProcesses is VarRef ? "uint*" : "ptr"
        ApplicationProcessesMarshal := ApplicationProcesses is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", PartitionId, "ptr", ApplicationId, "uint", Flags, NumApplicationProcessesMarshal, NumApplicationProcesses, ApplicationProcessesMarshal, ApplicationProcesses, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves detailed information about a single process hosting COM+ applications.
     * @remarks
     * A process may be selected by its application instance ID or its process ID, but not both. Selection by application instance ID is generally preferred, because process IDs may be reused after a process terminates. However, selection by process ID may be useful if you obtain the process ID from some other source, such as a command line argument to your program.
     * 
     * You may request any or all of the information available for the process by passing non-<b>NULL</b> values for <i>Summary</i>, <i>Statistics</i>, <i>RecycleInfo</i>, or <i>AnyComponentsHangMonitored</i>. At least one of these parameters must be non-<b>NULL</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-igetapptrackerdata-getapplicationprocessdetails
     */
    GetApplicationProcessDetails(ApplicationInstanceId, ProcessId, Flags, Summary, Statistics, RecycleInfo, AnyComponentsHangMonitored) {
        AnyComponentsHangMonitoredMarshal := AnyComponentsHangMonitored is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", ApplicationInstanceId, "uint", ProcessId, "uint", Flags, "ptr", Summary, "ptr", Statistics, "ptr", RecycleInfo, AnyComponentsHangMonitoredMarshal, AnyComponentsHangMonitored, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves summary information for all COM+ applications hosted in a single process, or for a specified subset of these applications.
     * @remarks
     * A process may be selected by its application instance ID or its process ID, but not both. Selection by application instance ID is generally preferred, because process IDs may be reused after a process terminates. However, selection by process ID may be useful if you obtain the process ID from some other source, such as a command line argument to your program.
     * 
     * If neither GATD_INCLUDE_LIBRARY_APPS nor GATD_INCLUDE_SWC are set in <i>Flags</i>, only the COM+ server application is included in the results. If GATD_INCLUDE_LIBRARY_APPS is set, COM+ library applications in the process, if any, are also included. If GATD_INCLUDE_SWC is set, and the process is hosting one or more Services Without Components contexts, the results will also include a single pseudo-application entry with a summary of the SWC contexts.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-igetapptrackerdata-getapplicationsinprocess
     */
    GetApplicationsInProcess(ApplicationInstanceId, ProcessId, PartitionId, Flags, NumApplicationsInProcess, Applications) {
        NumApplicationsInProcessMarshal := NumApplicationsInProcess is VarRef ? "uint*" : "ptr"
        ApplicationsMarshal := Applications is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", ApplicationInstanceId, "uint", ProcessId, "ptr", PartitionId, "uint", Flags, NumApplicationsInProcessMarshal, NumApplicationsInProcess, ApplicationsMarshal, Applications, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves summary information for all COM+ components hosted in a single process, or for a specified subset of these components.
     * @remarks
     * A process may be selected by its application instance ID or its process ID, but not both. Selection by application instance ID is generally preferred, because process IDs may be reused after a process terminates. However, selection by process ID may be useful if you obtain the process ID from some other source, such as a command line argument to your program.
     * 
     * If neither GATD_INCLUDE_LIBRARY_APPS nor GATD_INCLUDE_SWC are set in <i>Flags</i>, only components from the COM+ server application are included in the results. If GATD_INCLUDE_LIBRARY_APPS is set, components from COM+ library applications in the process, if any, are also included. If GATD_INCLUDE_SWC is set, the results will also include entries for Services Without Components contexts.
     * 
     * If <i>ApplicationId</i> is used to specify an application (it is not set to GUID_NULL), the GATD_INCLUDE_LIBRARY_APPS and GATD_INCLUDE_SWC flags are not meaningful, and it is not valid to use them. Components from the specified application will be returned, regardless of the type of that application.
     * @param {Pointer<Guid>} ApplicationInstanceId The application instance GUID that uniquely identifies the tracked process to select, or GUID_NULL if the <i>ProcessId</i> parameter will be used for selection instead.
     * @param {Integer} ProcessId The process ID that identifies the process to select, or 0 if the <i>ApplicationInstanceId</i> parameter will be used for selection instead.
     * @param {Pointer<Guid>} PartitionId A partition ID to filter results, or GUID_NULL for all partitions.
     * @param {Pointer<Guid>} ApplicationId An application ID to filter results, or GUID_NULL for all applications.
     * @param {Integer} Flags A combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-getapptrackerdataflags">GetAppTrackerDataFlags</a> enumeration to filter results and to select which data is returned. The following flags are supported: GATD_INCLUDE_LIBRARY_APPS, GATD_INCLUDE_SWC, GATD_INCLUDE_CLASS_NAME, GATD_INCLUDE_APPLICATION_NAME. See Remarks below for more information.
     * @param {Pointer<Integer>} NumComponentsInProcess On return, the number of components in the process that match the filter criteria specified by <i>PartitionId</i>, <i>ApplicationId</i>, and <i>Flags</i>.
     * @param {Pointer<Pointer<ComponentSummary>>} Components_ On return, an array of <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ns-comsvcs-componentsummary">ComponentSummary</a> structures for the matching components.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-igetapptrackerdata-getcomponentsinprocess
     */
    GetComponentsInProcess(ApplicationInstanceId, ProcessId, PartitionId, ApplicationId, Flags, NumComponentsInProcess, Components_) {
        NumComponentsInProcessMarshal := NumComponentsInProcess is VarRef ? "uint*" : "ptr"
        Components_Marshal := Components_ is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", ApplicationInstanceId, "uint", ProcessId, "ptr", PartitionId, "ptr", ApplicationId, "uint", Flags, NumComponentsInProcessMarshal, NumComponentsInProcess, Components_Marshal, Components_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves detailed information about a single COM+ component hosted in a process.
     * @remarks
     * A process may be selected by its application instance ID or its process ID, but not both. Selection by application instance ID is generally preferred, because process IDs may be reused after a process terminates. However, selection by process ID may be useful if you obtain the process ID from some other source, such as a command line argument to your program. 
     * 
     * 
     * 
     * You may request any or all of the information available for the component by passing non-<b>NULL</b> values for <i>Summary</i>, <i>Statistics</i>, or <i>HangMonitorInfo</i>. At least one of these parameters must be non-<b>NULL</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-igetapptrackerdata-getcomponentdetails
     */
    GetComponentDetails(ApplicationInstanceId, ProcessId, Clsid, Flags, Summary, Statistics, HangMonitorInfo) {
        result := ComCall(7, this, "ptr", ApplicationInstanceId, "uint", ProcessId, "ptr", Clsid, "uint", Flags, "ptr", Summary, "ptr", Statistics, "ptr", HangMonitorInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves tracking data for all COM+ applications in the form of a collection object.
     * @remarks
     * This method is primarily intended to enable applications that subscribe to the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icomtrackinginfoevents">IComTrackingInfoEvents</a> event interface to add support for <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-igetapptrackerdata">IGetAppTrackerData</a> with minimal changes to their code. The object returned by this method is identical to the object sent in calls to subscribers' <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-icomtrackinginfoevents-onnewtrackinginfo">IComTrackingInfoEvent::OnNewTrackingInfo</a> method, so that code for navigating and parsing this collection may be reused. 
     * 
     * 
     * 
     * Applications should not expect this method to return newly updated tracking data any more frequently than the server's suggested polling interval (see <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-igetapptrackerdata-getsuggestedpollinginterval">IGetAppTrackerData::GetSuggestedPollingInterval</a>). 
     * 
     * 
     * 
     * Note that the collection object returned by this method does not contain all tracking data that is available by calling the other methods. In particular, recycling details and hang monitoring configuration are not provided.
     * @returns {IUnknown} On return, the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for a collection of tracker data.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-igetapptrackerdata-gettrackerdataascollectionobject
     */
    GetTrackerDataAsCollectionObject() {
        result := ComCall(8, this, "ptr*", &TopLevelCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(TopLevelCollection)
    }

    /**
     * Retrieves the minimum interval for polling suggested by the Tracker Server.
     * @remarks
     * Applications that use tracker data will usually need to poll the Tracker Server periodically to ensure that this data is up-to-date. For example, an administrative application that displays tracking data to the user would typically want this data to be near as possible to real-time. However, polling too frequently can degrade overall system performance. Also keep in mind that the COM+ applications updating the data do not send updates to the Tracker Server immediately, so even in the best case there will be some delay (typically only a few seconds).
     * 
     * 
     * 
     * Polling frequency is a global policy that administrators can adjust, if necessary, to balance between freshness of data and performance impact for the particular set of tools in use on the systems they manage. The value returned in <i>PollingIntervalInSeconds</i> is the minimum amount of time that an application should wait after retrieving tracking data before making another call to retrieve the same data. Any application that polls the Tracker Server should call this method and adjust their polling behavior accordingly. 
     * 
     * The polling interval is by default equal to the tracking event frequency (three seconds). This value can be adjusted by writing the following REG_DWORD registry value: 
     * 
     * 
     * 
     * <b>HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\COM3</b>&#92;<b>TrackingInfoPollingFrequency</b> = <i>minimum polling interval</i>
     * @returns {Integer} The Tracker Server's suggested polling interval, in seconds.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-igetapptrackerdata-getsuggestedpollinginterval
     */
    GetSuggestedPollingInterval() {
        result := ComCall(9, this, "uint*", &PollingIntervalInSeconds := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PollingIntervalInSeconds
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages the configuration information that is common to all data collector objects in the set; adds and removes data collectors from the set; and starts data collection. This is the primary PLA interface that you use.
 * @remarks
 * 
  * To create the object from a script, use the "Pla.DataCollectorSet" program identifier.
  * 
  * To retrieve an existing data collector set, create an instance of the data collector set object and then call 
  *     the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-query">IDataCollectorSet::Query</a> method 
  *     to query the properties of a previously 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-commit">persisted </a> data collector set.
  * 
  * To create a set, create an instance of the data collector set object and set the properties as appropriate. 
  *     You
  *     can set the properties individually or pass XML that contains the property values to the 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-setxml">IDataCollectorSet::SetXml</a> 
  *     method.
  * 
  * To add new data collector objects to the set, retrieve the collection from the 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_datacollectors">IDataCollectorSet::DataCollectors</a> 
  *     property. To persist the data collector set, call the 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-commit">IDataCollectorSet::Commit</a> 
  *     method.
  * 
  * You can start the data collectors manually using the 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-start">IDataCollectorSet::Start</a> method or automatically 
  *     using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_schedules">IDataCollectorSet::Schedules</a> 
  *     property. Alternatively, an alert can trigger a collection to run if the 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ialertdatacollector-get_triggerdatacollectorset">IAlertDataCollector::TriggerDataCollectorSet</a> 
  *     property is set.
  * 
  * If you want to manage the collected data, retrieve an 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatamanager">IDataManager</a> interface from the 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_datamanager">IDataCollectorSet::DataManager</a> 
  *     property.
  * 
  * The following example shows the XML elements for a data collector set. For details, see the corresponding 
  *     property.
  *    
  * 
  * 
  * ```xml
  * <DataCollectorSet>
  *     <DataManager>
  *         <Enabled/>              <!-- 0 (false), nonzero (true) -->
  *         <CheckBeforeRunning/>   <!-- 0 (false), nonzero (true) -->
  *         <MinFreeDisk/>
  *         <MaxSize/>
  *         <MaxFolderCount/>
  *         <ResourcePolicy/>
  *         <ReportFileName/>
  *         <RuleTargetFileName/>
  *         <EventsFileName/>
  *         <FolderAction>          <!-- Include a <FolderAction> element for -->
  *             <Actions/>          <!-- each action to take. -->
  *             <Age/>
  *             <SendCabTo/>
  *             <Size/>
  *         </FolderAction>
  *     </DataManager>
  *     <Description/>
  *     <DescriptionUnresolved/>    <!-- Output only -->
  *     <DisplayName/>
  *     <DisplayNameUnresolved/>    <!-- Output only -->
  *     <Duration/>  
  *     <Keyword/>                  <!-- Specify for each keyword -->
  *     <LatestOutputLocation/>     
  *     <Name/>                     <!-- Output only -->
  *     <OutputLocation/>           <!-- Output only -->
  *     <RootPath/>
  *     <Segment/>
  *     <SegmentMaxDuration/> 
  *     <SegmentMaxSize/> 
  *     <SerialNumber/>
  *     <Server/>                   <!-- Output only -->
  *     <Status/>                   <!-- Output only -->
  *     <Subdirectory/>
  *     <SubdirectoryFormat/>
  *     <SubdirectoryFormatPattern/>
  *     <Task/>
  *     <TaskArguments/>
  *     <TaskRunAsSelf/>            <!-- 0 (false), -1 (true) -->
  *     <TaskUserTextArguments/>
  *     <Schedule>
  *         <Days/>
  *         <EndDate/>              <!-- mm/dd/yyyy -->
  *         <StartDate/>            <!-- mm/dd/yyyy -->
  *         <StartTime/>            <!-- hh:mm:ss (use 24-hour clock) -->
  *     </Schedule>
  *     <SchedulesEnabled/>         <!-- 0 (false), nonzero (true) -->
  *     <Security/>                 <!-- Security Descriptor Definition Language -->
  *     <StopOnCompletion/>         <!-- 0 (false), nonzero (true) -->
  *     <UserAccount/>              <!-- Output only. Set using SetCredentials --></DataCollectorSet>
  * ```
  * 
  * 
  * If you call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_xml">IDataCollectorSet::Xml</a> to 
  *     retrieve the XML for a set and the set includes data collectors, the XML will also contain the XML elements for 
  *     each data collector in the set.
  * 
  * To use the data collector set elements to initialize the property values of a data collector set, call the 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-setxml">SetXml</a> method. The contents of the XML will 
  *     overwrite the existing contents of the set. The following shows how to include the elements for the alert data 
  *     collector. 
  * 
  * 
  * ```xml
  * <DataCollectorSet>
  * 
  *     <!-- Data collector set elements go here. -->
  * 
  *     <AlertDataCollector>
  *         <Alert/>  <!-- Specify an <Alert> element for each alert -->
  *         <EventLog/>
  *         <SampleInterval/>
  *         <Task/>
  *         <TaskArguments/>
  *         <TaskRunAsSelf/>            <!-- 0 (false), nonzero (true) -->
  *         <TaskUserTextArguments/>
  *         <TriggerDataCollectorSet/>
  * 
  *         <!-- Data collector elements go here. -->
  *     </AlertDataCollector>
  * </DataCollectorSet>
  * ```
  * 
  * 
  * You can specify only the elements for the properties that you want to set. If you do not specify a property, 
  *     PLA provides a default value. When you retrieve the XML for the set, the XML includes all elements, including 
  *     those from the data collectors contained in the set (for details on data collector properties, see each data 
  *     collector interface). However, the schedule and folder action elements are not included if they are not defined 
  *     for the set.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-idatacollectorset
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class IDataCollectorSet extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataCollectorSet
     * @type {Guid}
     */
    static IID => Guid("{03837520-098b-11d8-9414-505054503030}")

    /**
     * The class identifier for DataCollectorSet
     * @type {Guid}
     */
    static CLSID => Guid("{03837521-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataCollectors", "get_Duration", "put_Duration", "get_Description", "put_Description", "get_DescriptionUnresolved", "get_DisplayName", "put_DisplayName", "get_DisplayNameUnresolved", "get_Keywords", "put_Keywords", "get_LatestOutputLocation", "put_LatestOutputLocation", "get_Name", "get_OutputLocation", "get_RootPath", "put_RootPath", "get_Segment", "put_Segment", "get_SegmentMaxDuration", "put_SegmentMaxDuration", "get_SegmentMaxSize", "put_SegmentMaxSize", "get_SerialNumber", "put_SerialNumber", "get_Server", "get_Status", "get_Subdirectory", "put_Subdirectory", "get_SubdirectoryFormat", "put_SubdirectoryFormat", "get_SubdirectoryFormatPattern", "put_SubdirectoryFormatPattern", "get_Task", "put_Task", "get_TaskRunAsSelf", "put_TaskRunAsSelf", "get_TaskArguments", "put_TaskArguments", "get_TaskUserTextArguments", "put_TaskUserTextArguments", "get_Schedules", "get_SchedulesEnabled", "put_SchedulesEnabled", "get_UserAccount", "get_Xml", "get_Security", "put_Security", "get_StopOnCompletion", "put_StopOnCompletion", "get_DataManager", "SetCredentials", "Query", "Commit", "Delete", "Start", "Stop", "SetXml", "SetValue", "GetValue"]

    /**
     * 
     * @param {Pointer<IDataCollectorCollection>} collectors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_datacollectors
     */
    get_DataCollectors(collectors) {
        result := ComCall(7, this, "ptr*", collectors, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} seconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_duration
     */
    get_Duration(seconds) {
        secondsMarshal := seconds is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, secondsMarshal, seconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} seconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_duration
     */
    put_Duration(seconds) {
        result := ComCall(9, this, "uint", seconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_description
     */
    get_Description(description) {
        result := ComCall(10, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(11, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Descr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_descriptionunresolved
     */
    get_DescriptionUnresolved(Descr) {
        result := ComCall(12, this, "ptr", Descr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} DisplayName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_displayname
     */
    get_DisplayName(DisplayName) {
        result := ComCall(13, this, "ptr", DisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} DisplayName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_displayname
     */
    put_DisplayName(DisplayName) {
        DisplayName := DisplayName is String ? BSTR.Alloc(DisplayName).Value : DisplayName

        result := ComCall(14, this, "ptr", DisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_displaynameunresolved
     */
    get_DisplayNameUnresolved(name) {
        result := ComCall(15, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} keywords 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_keywords
     */
    get_Keywords(keywords) {
        keywordsMarshal := keywords is VarRef ? "ptr*" : "ptr"

        result := ComCall(16, this, keywordsMarshal, keywords, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} keywords 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_keywords
     */
    put_Keywords(keywords) {
        result := ComCall(17, this, "ptr", keywords, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_latestoutputlocation
     */
    get_LatestOutputLocation(path) {
        result := ComCall(18, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_latestoutputlocation
     */
    put_LatestOutputLocation(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(19, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_name
     */
    get_Name(name) {
        result := ComCall(20, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_outputlocation
     */
    get_OutputLocation(path) {
        result := ComCall(21, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} folder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_rootpath
     */
    get_RootPath(folder) {
        result := ComCall(22, this, "ptr", folder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} folder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_rootpath
     */
    put_RootPath(folder) {
        folder := folder is String ? BSTR.Alloc(folder).Value : folder

        result := ComCall(23, this, "ptr", folder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} segment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_segment
     */
    get_Segment(segment) {
        result := ComCall(24, this, "ptr", segment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} segment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_segment
     */
    put_Segment(segment) {
        result := ComCall(25, this, "short", segment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} seconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_segmentmaxduration
     */
    get_SegmentMaxDuration(seconds) {
        secondsMarshal := seconds is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, secondsMarshal, seconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} seconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_segmentmaxduration
     */
    put_SegmentMaxDuration(seconds) {
        result := ComCall(27, this, "uint", seconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} size 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_segmentmaxsize
     */
    get_SegmentMaxSize(size) {
        sizeMarshal := size is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, sizeMarshal, size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} size 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_segmentmaxsize
     */
    put_SegmentMaxSize(size) {
        result := ComCall(29, this, "uint", size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_serialnumber
     */
    get_SerialNumber(index) {
        indexMarshal := index is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, indexMarshal, index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_serialnumber
     */
    put_SerialNumber(index) {
        result := ComCall(31, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} server 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_server
     */
    get_Server(server) {
        result := ComCall(32, this, "ptr", server, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_status
     */
    get_Status(status) {
        statusMarshal := status is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, statusMarshal, status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} folder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_subdirectory
     */
    get_Subdirectory(folder) {
        result := ComCall(34, this, "ptr", folder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} folder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_subdirectory
     */
    put_Subdirectory(folder) {
        folder := folder is String ? BSTR.Alloc(folder).Value : folder

        result := ComCall(35, this, "ptr", folder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} format 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_subdirectoryformat
     */
    get_SubdirectoryFormat(format) {
        formatMarshal := format is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, formatMarshal, format, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} format 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_subdirectoryformat
     */
    put_SubdirectoryFormat(format) {
        result := ComCall(37, this, "int", format, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pattern 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_subdirectoryformatpattern
     */
    get_SubdirectoryFormatPattern(pattern) {
        result := ComCall(38, this, "ptr", pattern, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pattern 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_subdirectoryformatpattern
     */
    put_SubdirectoryFormatPattern(pattern) {
        pattern := pattern is String ? BSTR.Alloc(pattern).Value : pattern

        result := ComCall(39, this, "ptr", pattern, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} task 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_task
     */
    get_Task(task) {
        result := ComCall(40, this, "ptr", task, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} task 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_task
     */
    put_Task(task) {
        task := task is String ? BSTR.Alloc(task).Value : task

        result := ComCall(41, this, "ptr", task, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} RunAsSelf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_taskrunasself
     */
    get_TaskRunAsSelf(RunAsSelf) {
        result := ComCall(42, this, "ptr", RunAsSelf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} RunAsSelf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_taskrunasself
     */
    put_TaskRunAsSelf(RunAsSelf) {
        result := ComCall(43, this, "short", RunAsSelf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} task 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_taskarguments
     */
    get_TaskArguments(task) {
        result := ComCall(44, this, "ptr", task, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} task 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_taskarguments
     */
    put_TaskArguments(task) {
        task := task is String ? BSTR.Alloc(task).Value : task

        result := ComCall(45, this, "ptr", task, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} UserText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_taskusertextarguments
     */
    get_TaskUserTextArguments(UserText) {
        result := ComCall(46, this, "ptr", UserText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} UserText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_taskusertextarguments
     */
    put_TaskUserTextArguments(UserText) {
        UserText := UserText is String ? BSTR.Alloc(UserText).Value : UserText

        result := ComCall(47, this, "ptr", UserText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IScheduleCollection>} ppSchedules 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_schedules
     */
    get_Schedules(ppSchedules) {
        result := ComCall(48, this, "ptr*", ppSchedules, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_schedulesenabled
     */
    get_SchedulesEnabled(enabled) {
        result := ComCall(49, this, "ptr", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_schedulesenabled
     */
    put_SchedulesEnabled(enabled) {
        result := ComCall(50, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} user 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_useraccount
     */
    get_UserAccount(user) {
        result := ComCall(51, this, "ptr", user, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} xml 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_xml
     */
    get_Xml(xml) {
        result := ComCall(52, this, "ptr", xml, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSecurity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_security
     */
    get_Security(pbstrSecurity) {
        result := ComCall(53, this, "ptr", pbstrSecurity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSecurity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_security
     */
    put_Security(bstrSecurity) {
        bstrSecurity := bstrSecurity is String ? BSTR.Alloc(bstrSecurity).Value : bstrSecurity

        result := ComCall(54, this, "ptr", bstrSecurity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Stop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_stoponcompletion
     */
    get_StopOnCompletion(Stop) {
        result := ComCall(55, this, "ptr", Stop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Stop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-put_stoponcompletion
     */
    put_StopOnCompletion(Stop) {
        result := ComCall(56, this, "short", Stop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDataManager>} DataManager 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-get_datamanager
     */
    get_DataManager(DataManager) {
        result := ComCall(57, this, "ptr*", DataManager, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} user 
     * @param {BSTR} password 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-setcredentials
     */
    SetCredentials(user, password) {
        user := user is String ? BSTR.Alloc(user).Value : user
        password := password is String ? BSTR.Alloc(password).Value : password

        result := ComCall(58, this, "ptr", user, "ptr", password, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} server 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-query
     */
    Query(name, server) {
        name := name is String ? BSTR.Alloc(name).Value : name
        server := server is String ? BSTR.Alloc(server).Value : server

        result := ComCall(59, this, "ptr", name, "ptr", server, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} server 
     * @param {Integer} mode 
     * @param {Pointer<IValueMap>} validation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-commit
     */
    Commit(name, server, mode, validation) {
        name := name is String ? BSTR.Alloc(name).Value : name
        server := server is String ? BSTR.Alloc(server).Value : server

        result := ComCall(60, this, "ptr", name, "ptr", server, "int", mode, "ptr*", validation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-delete
     */
    Delete() {
        result := ComCall(61, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Synchronous 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-start
     */
    Start(Synchronous) {
        result := ComCall(62, this, "short", Synchronous, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Synchronous 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-stop
     */
    Stop(Synchronous) {
        result := ComCall(63, this, "short", Synchronous, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} xml 
     * @param {Pointer<IValueMap>} validation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-setxml
     */
    SetXml(xml, validation) {
        xml := xml is String ? BSTR.Alloc(xml).Value : xml

        result := ComCall(64, this, "ptr", xml, "ptr*", validation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} key 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-setvalue
     */
    SetValue(key, value) {
        key := key is String ? BSTR.Alloc(key).Value : key
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(65, this, "ptr", key, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} key 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollectorset-getvalue
     */
    GetValue(key, value) {
        key := key is String ? BSTR.Alloc(key).Value : key

        result := ComCall(66, this, "ptr", key, "ptr", value, "HRESULT")
        return result
    }
}

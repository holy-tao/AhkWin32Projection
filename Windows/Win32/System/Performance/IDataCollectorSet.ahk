#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDataCollectorCollection.ahk
#Include .\IScheduleCollection.ahk
#Include .\IDataManager.ahk
#Include .\IValueMap.ahk
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
     * @type {IDataCollectorCollection} 
     */
    DataCollectors {
        get => this.get_DataCollectors()
    }

    /**
     * @type {Integer} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    DescriptionUnresolved {
        get => this.get_DescriptionUnresolved()
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * @type {BSTR} 
     */
    DisplayNameUnresolved {
        get => this.get_DisplayNameUnresolved()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    Keywords {
        get => this.get_Keywords()
        set => this.put_Keywords(value)
    }

    /**
     * @type {BSTR} 
     */
    LatestOutputLocation {
        get => this.get_LatestOutputLocation()
        set => this.put_LatestOutputLocation(value)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    OutputLocation {
        get => this.get_OutputLocation()
    }

    /**
     * @type {BSTR} 
     */
    RootPath {
        get => this.get_RootPath()
        set => this.put_RootPath(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Segment {
        get => this.get_Segment()
        set => this.put_Segment(value)
    }

    /**
     * @type {Integer} 
     */
    SegmentMaxDuration {
        get => this.get_SegmentMaxDuration()
        set => this.put_SegmentMaxDuration(value)
    }

    /**
     * @type {Integer} 
     */
    SegmentMaxSize {
        get => this.get_SegmentMaxSize()
        set => this.put_SegmentMaxSize(value)
    }

    /**
     * @type {Integer} 
     */
    SerialNumber {
        get => this.get_SerialNumber()
        set => this.put_SerialNumber(value)
    }

    /**
     * @type {BSTR} 
     */
    Server {
        get => this.get_Server()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {BSTR} 
     */
    Subdirectory {
        get => this.get_Subdirectory()
        set => this.put_Subdirectory(value)
    }

    /**
     * @type {Integer} 
     */
    SubdirectoryFormat {
        get => this.get_SubdirectoryFormat()
        set => this.put_SubdirectoryFormat(value)
    }

    /**
     * @type {BSTR} 
     */
    SubdirectoryFormatPattern {
        get => this.get_SubdirectoryFormatPattern()
        set => this.put_SubdirectoryFormatPattern(value)
    }

    /**
     * @type {BSTR} 
     */
    Task {
        get => this.get_Task()
        set => this.put_Task(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    TaskRunAsSelf {
        get => this.get_TaskRunAsSelf()
        set => this.put_TaskRunAsSelf(value)
    }

    /**
     * @type {BSTR} 
     */
    TaskArguments {
        get => this.get_TaskArguments()
        set => this.put_TaskArguments(value)
    }

    /**
     * @type {BSTR} 
     */
    TaskUserTextArguments {
        get => this.get_TaskUserTextArguments()
        set => this.put_TaskUserTextArguments(value)
    }

    /**
     * @type {IScheduleCollection} 
     */
    Schedules {
        get => this.get_Schedules()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SchedulesEnabled {
        get => this.get_SchedulesEnabled()
        set => this.put_SchedulesEnabled(value)
    }

    /**
     * @type {BSTR} 
     */
    UserAccount {
        get => this.get_UserAccount()
    }

    /**
     * @type {BSTR} 
     */
    Xml {
        get => this.get_Xml()
    }

    /**
     * @type {BSTR} 
     */
    Security {
        get => this.get_Security()
        set => this.put_Security(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    StopOnCompletion {
        get => this.get_StopOnCompletion()
        set => this.put_StopOnCompletion(value)
    }

    /**
     * @type {IDataManager} 
     */
    DataManager {
        get => this.get_DataManager()
    }

    /**
     * Retrieves the list of data collectors in this set.
     * @returns {IDataCollectorCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_datacollectors
     */
    get_DataCollectors() {
        result := ComCall(7, this, "ptr*", &collectors := 0, "HRESULT")
        return IDataCollectorCollection(collectors)
    }

    /**
     * Retrieves and sets the duration that the data collector set runs.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_duration
     */
    get_Duration() {
        result := ComCall(8, this, "uint*", &seconds := 0, "HRESULT")
        return seconds
    }

    /**
     * Retrieves and sets the duration that the data collector set runs.
     * @param {Integer} seconds 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_duration
     */
    put_Duration(seconds) {
        result := ComCall(9, this, "uint", seconds, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the description of the data collector set. The description will be added to all output files as metadata and inserted into Performance Data Helper logs as a comment.
     * @remarks
     * 
     * To use a localized string from a binary, specify the description in the form @<i>binary</i>,#<i>id</i> where <i>binary</i> is the EXE or DLL that contains the localized resource string and <i>id</i> is the string resource identifier.
     * 
     * If you set the description to the @<i>binary</i>,#<i>id</i> form, when you retrieve  the description you will receive the localized string. To retrieve the description string that you set, access the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_descriptionunresolved">IDataCollectorSet::DescriptionUnresolved</a> property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_description
     */
    get_Description() {
        description := BSTR()
        result := ComCall(10, this, "ptr", description, "HRESULT")
        return description
    }

    /**
     * Retrieves or sets the description of the data collector set. The description will be added to all output files as metadata and inserted into Performance Data Helper logs as a comment.
     * @remarks
     * 
     * To use a localized string from a binary, specify the description in the form @<i>binary</i>,#<i>id</i> where <i>binary</i> is the EXE or DLL that contains the localized resource string and <i>id</i> is the string resource identifier.
     * 
     * If you set the description to the @<i>binary</i>,#<i>id</i> form, when you retrieve  the description you will receive the localized string. To retrieve the description string that you set, access the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_descriptionunresolved">IDataCollectorSet::DescriptionUnresolved</a> property.
     * 
     * 
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(11, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * Retrieves the description of the data collector set in its original form.
     * @remarks
     * 
     * This property returns the description as you originally set it in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_description">IDataCollectorSet::Description</a> property. Typically, you would use this property if you set the description using the form @<i>binary</i>,#<i>id</i>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_descriptionunresolved
     */
    get_DescriptionUnresolved() {
        Descr := BSTR()
        result := ComCall(12, this, "ptr", Descr, "HRESULT")
        return Descr
    }

    /**
     * Retrieves or sets the display name of the data collector set.
     * @remarks
     * 
     * To use a localized string from a binary, specify the display name in the form @<i>binary</i>,#<i>id</i> where <i>binary</i> is the EXE or DLL that contains the localized resource string and <i>id</i> is the string resource identifier.
     * 
     * If you set the display name to the @<i>binary</i>,#<i>id</i> form, when you retrieve  the display name you will receive the localized string. To retrieve the display name string that you set, access the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_displaynameunresolved">IDataCollectorSet::DisplayNameUnresolved</a> property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_displayname
     */
    get_DisplayName() {
        DisplayName := BSTR()
        result := ComCall(13, this, "ptr", DisplayName, "HRESULT")
        return DisplayName
    }

    /**
     * Retrieves or sets the display name of the data collector set.
     * @remarks
     * 
     * To use a localized string from a binary, specify the display name in the form @<i>binary</i>,#<i>id</i> where <i>binary</i> is the EXE or DLL that contains the localized resource string and <i>id</i> is the string resource identifier.
     * 
     * If you set the display name to the @<i>binary</i>,#<i>id</i> form, when you retrieve  the display name you will receive the localized string. To retrieve the display name string that you set, access the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_displaynameunresolved">IDataCollectorSet::DisplayNameUnresolved</a> property.
     * 
     * 
     * @param {BSTR} DisplayName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_displayname
     */
    put_DisplayName(DisplayName) {
        DisplayName := DisplayName is String ? BSTR.Alloc(DisplayName).Value : DisplayName

        result := ComCall(14, this, "ptr", DisplayName, "HRESULT")
        return result
    }

    /**
     * Retrieves the display name of the data collector set in its original form.
     * @remarks
     * 
     * This property returns the display name as you originally set it in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_displayname">IDataCollectorSet::DisplayName</a> property. Typically, you would use this property if you set the display name using the form @<i>binary</i>,#<i>id</i>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_displaynameunresolved
     */
    get_DisplayNameUnresolved() {
        name := BSTR()
        result := ComCall(15, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Retrieves or sets keywords that describe the data collector set. The list of keywords is added to the output files as metadata.
     * @remarks
     * 
     * The keywords can be used when searching for files and are also displayed in Windows Explorer.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_keywords
     */
    get_Keywords() {
        result := ComCall(16, this, "ptr*", &keywords := 0, "HRESULT")
        return keywords
    }

    /**
     * Retrieves or sets keywords that describe the data collector set. The list of keywords is added to the output files as metadata.
     * @remarks
     * 
     * The keywords can be used when searching for files and are also displayed in Windows Explorer.
     * 
     * 
     * @param {Pointer<SAFEARRAY>} keywords 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_keywords
     */
    put_Keywords(keywords) {
        result := ComCall(17, this, "ptr", keywords, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the fully decorated folder name that PLA used the last time logs were written.
     * @remarks
     * 
     * Typically, you do not set this property. When the data collector starts, PLA sets this property using the value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_outputlocation">IDataCollectorSet::OutputLocation</a> property.
     * 
     * You can set this property to empty if the folder has been deleted.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_latestoutputlocation
     */
    get_LatestOutputLocation() {
        path := BSTR()
        result := ComCall(18, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * Retrieves or sets the fully decorated folder name that PLA used the last time logs were written.
     * @remarks
     * 
     * Typically, you do not set this property. When the data collector starts, PLA sets this property using the value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_outputlocation">IDataCollectorSet::OutputLocation</a> property.
     * 
     * You can set this property to empty if the folder has been deleted.
     * 
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_latestoutputlocation
     */
    put_LatestOutputLocation(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(19, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * Retrieves the unique name used to identify the data collector set.
     * @remarks
     * 
     * The name is set when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-commit">IDataCollectorSet::Commit</a> method.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(20, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Retrieves the decorated folder name if PLA were to create it now.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_latestoutputlocation">IDataCollectorSet::LatestOutputLocation</a> property contains the decorated file name used the last time the collector ran.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_outputlocation
     */
    get_OutputLocation() {
        path := BSTR()
        result := ComCall(21, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * Retrieves or sets the base path where the subdirectories are created.
     * @remarks
     * 
     * If this property is changed from the default value, the specified directory must exist before the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-start">IDataCollectorSet::Start</a> method is called.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_rootpath
     */
    get_RootPath() {
        folder := BSTR()
        result := ComCall(22, this, "ptr", folder, "HRESULT")
        return folder
    }

    /**
     * Retrieves or sets the base path where the subdirectories are created.
     * @remarks
     * 
     * If this property is changed from the default value, the specified directory must exist before the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-start">IDataCollectorSet::Start</a> method is called.
     * 
     * 
     * @param {BSTR} folder 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_rootpath
     */
    put_RootPath(folder) {
        folder := folder is String ? BSTR.Alloc(folder).Value : folder

        result := ComCall(23, this, "ptr", folder, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that indicates whether PLA creates new logs if the maximum size or segment duration is reached before the data collector set is stopped.
     * @remarks
     * 
     * You would enable segmentation, for example, if you want to write to a new log file when the current log file reaches 100 MB. The name used for the new log is determined by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_filenameformat">IDataCollector::FileNameFormat</a> property. 
     * 
     * The task associated with the data collector set is launched each time a segment is created.
     * 
     * If VARIANT_TRUE, PLA uses both the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxsize">IDataCollectorSet::SegmentMaxSize</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxduration">IDataCollectorSet::SegmentMaxDuration</a> properties, if set, to determine when to segment the log. When one of the limits is reached, PLA segments the log. After segmenting the log, PLA resets the counters for limits.
     * 
     * If VARIANT_FALSE, PLA ignores <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxsize">SegmentMaxSize</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxduration">SegmentMaxDuration</a>.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_segment
     */
    get_Segment() {
        result := ComCall(24, this, "short*", &segment := 0, "HRESULT")
        return segment
    }

    /**
     * Retrieves or sets a value that indicates whether PLA creates new logs if the maximum size or segment duration is reached before the data collector set is stopped.
     * @remarks
     * 
     * You would enable segmentation, for example, if you want to write to a new log file when the current log file reaches 100 MB. The name used for the new log is determined by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_filenameformat">IDataCollector::FileNameFormat</a> property. 
     * 
     * The task associated with the data collector set is launched each time a segment is created.
     * 
     * If VARIANT_TRUE, PLA uses both the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxsize">IDataCollectorSet::SegmentMaxSize</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxduration">IDataCollectorSet::SegmentMaxDuration</a> properties, if set, to determine when to segment the log. When one of the limits is reached, PLA segments the log. After segmenting the log, PLA resets the counters for limits.
     * 
     * If VARIANT_FALSE, PLA ignores <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxsize">SegmentMaxSize</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxduration">SegmentMaxDuration</a>.
     * 
     * 
     * @param {VARIANT_BOOL} segment 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_segment
     */
    put_Segment(segment) {
        result := ComCall(25, this, "short", segment, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the duration that the data collector set can run before it begins writing to new log files.
     * @remarks
     * 
     * You must enable the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segment">IDataCollectorSet::Segment</a> property for this property to take effect.
     * 
     * This duration needs to be less than the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_duration">IDataCollectorSet::Duration</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ischedule-get_enddate">ISchedule::EndDate</a> property.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_segmentmaxduration
     */
    get_SegmentMaxDuration() {
        result := ComCall(26, this, "uint*", &seconds := 0, "HRESULT")
        return seconds
    }

    /**
     * Retrieves or sets the duration that the data collector set can run before it begins writing to new log files.
     * @remarks
     * 
     * You must enable the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segment">IDataCollectorSet::Segment</a> property for this property to take effect.
     * 
     * This duration needs to be less than the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_duration">IDataCollectorSet::Duration</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ischedule-get_enddate">ISchedule::EndDate</a> property.
     * 
     * 
     * @param {Integer} seconds 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_segmentmaxduration
     */
    put_SegmentMaxDuration(seconds) {
        result := ComCall(27, this, "uint", seconds, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the maximum size of any log file in the data collector set.
     * @remarks
     * 
     * When the maximum size is reached, PLA creates a new log file to write to if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segment">IDataCollectorSet::Segment</a> property is enabled.
     * 
     * PLA tries to limit the log file size to this value; however, the actual size of the log file might grow slightly larger than this value.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_segmentmaxsize
     */
    get_SegmentMaxSize() {
        result := ComCall(28, this, "uint*", &size := 0, "HRESULT")
        return size
    }

    /**
     * Retrieves or sets the maximum size of any log file in the data collector set.
     * @remarks
     * 
     * When the maximum size is reached, PLA creates a new log file to write to if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segment">IDataCollectorSet::Segment</a> property is enabled.
     * 
     * PLA tries to limit the log file size to this value; however, the actual size of the log file might grow slightly larger than this value.
     * 
     * 
     * @param {Integer} size 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_segmentmaxsize
     */
    put_SegmentMaxSize(size) {
        result := ComCall(29, this, "uint", size, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the number of times that this data collector set has been started, including segments.
     * @remarks
     * 
     * Use this property if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_subdirectoryformat">IDataCollectorSet::SubdirectoryFormat</a> property is set to <b>plaSerialNumber</b>.
     * 
     * PLA increments the serial number after using it.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_serialnumber
     */
    get_SerialNumber() {
        result := ComCall(30, this, "uint*", &index := 0, "HRESULT")
        return index
    }

    /**
     * Retrieves or sets the number of times that this data collector set has been started, including segments.
     * @remarks
     * 
     * Use this property if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_subdirectoryformat">IDataCollectorSet::SubdirectoryFormat</a> property is set to <b>plaSerialNumber</b>.
     * 
     * PLA increments the serial number after using it.
     * 
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_serialnumber
     */
    put_SerialNumber(index) {
        result := ComCall(31, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the server where the data collector set is run.
     * @remarks
     * 
     * The name is set when you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-commit">IDataCollectorSet::Commit</a> method.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_server
     */
    get_Server() {
        server := BSTR()
        result := ComCall(32, this, "ptr", server, "HRESULT")
        return server
    }

    /**
     * Retrieves the status of the data collector set.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_status
     */
    get_Status() {
        result := ComCall(33, this, "int*", &status := 0, "HRESULT")
        return status
    }

    /**
     * Retrieves or sets a base subdirectory of the root path where the next instance of the data collector set will write its logs.
     * @remarks
     * 
     * The actual name of the subdirectory used can be different if you had previously specified formatting options in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_subdirectoryformat">IDataCollectorSet::SubdirectoryFormat</a> property. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_latestoutputlocation">IDataCollectorSet::LatestOutputLocation</a> property contains the actual folder name used. 
     * 
     * If a location is not specified, files are written to the path specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_rootpath">IDataCollectorSet::RootPath</a> property.
     * 
     * PLA creates the folders in the subdirectory path if they do not exist. Note that the folders will not inherit the ACLs from the root path. The user specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_useraccount">IDataCollectorSet::UserAccount</a> property and those in the Administrators group will have read and write access to the folders. Users in the Performance Log Users group and Performance Monitor Users group have read-only access.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_subdirectory
     */
    get_Subdirectory() {
        folder := BSTR()
        result := ComCall(34, this, "ptr", folder, "HRESULT")
        return folder
    }

    /**
     * Retrieves or sets a base subdirectory of the root path where the next instance of the data collector set will write its logs.
     * @remarks
     * 
     * The actual name of the subdirectory used can be different if you had previously specified formatting options in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_subdirectoryformat">IDataCollectorSet::SubdirectoryFormat</a> property. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_latestoutputlocation">IDataCollectorSet::LatestOutputLocation</a> property contains the actual folder name used. 
     * 
     * If a location is not specified, files are written to the path specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_rootpath">IDataCollectorSet::RootPath</a> property.
     * 
     * PLA creates the folders in the subdirectory path if they do not exist. Note that the folders will not inherit the ACLs from the root path. The user specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_useraccount">IDataCollectorSet::UserAccount</a> property and those in the Administrators group will have read and write access to the folders. Users in the Performance Log Users group and Performance Monitor Users group have read-only access.
     * 
     * 
     * @param {BSTR} folder 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_subdirectory
     */
    put_Subdirectory(folder) {
        folder := folder is String ? BSTR.Alloc(folder).Value : folder

        result := ComCall(35, this, "ptr", folder, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets flags that describe how to decorate the subdirectory name.
     * @remarks
     * 
     * PLA appends the decoration to the folder name. For example, if you specify <b>plaMonthDayHour</b>, PLA appends the current month, day, and hour values to the folder name. If the folder name is MyFile, the result could be MyFile110816.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_subdirectoryformat
     */
    get_SubdirectoryFormat() {
        result := ComCall(36, this, "int*", &format := 0, "HRESULT")
        return format
    }

    /**
     * Retrieves or sets flags that describe how to decorate the subdirectory name.
     * @remarks
     * 
     * PLA appends the decoration to the folder name. For example, if you specify <b>plaMonthDayHour</b>, PLA appends the current month, day, and hour values to the folder name. If the folder name is MyFile, the result could be MyFile110816.
     * 
     * 
     * @param {Integer} format 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_subdirectoryformat
     */
    put_SubdirectoryFormat(format) {
        result := ComCall(37, this, "int", format, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a format pattern to use when decorating the folder name.
     * @remarks
     * 
     * PLA uses the pattern only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_subdirectoryformat">IDataCollectorSet::SubdirectoryFormat</a> property is set to <b>plaPattern</b>.
     * 
     * Use the following pattern characters to define your own pattern to append to the file name. For example, the pattern "MMMM d, yyyy \a\t h:mmTt" could yield "January 31, 2005 at 4:20AM". 
     * 
     * <table>
     * <tr>
     * <th>Pattern</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>D</td>
     * <td>Day of the year.</td>
     * </tr>
     * <tr>
     * <td>DDD</td>
     * <td>Day of the year with leading zeros, if applicable.</td>
     * </tr>
     * <tr>
     * <td>d</td>
     * <td>Day of the month.</td>
     * </tr>
     * <tr>
     * <td>dd</td>
     * <td>Day of the month with a leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>ddd</td>
     * <td>The abbreviated name of the weekday, for example, Tue for Tuesday.</td>
     * </tr>
     * <tr>
     * <td>dddd</td>
     * <td>Full name of the weekday.</td>
     * </tr>
     * <tr>
     * <td>M</td>
     * <td>Month.</td>
     * </tr>
     * <tr>
     * <td>MM</td>
     * <td>Month with leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>MMM</td>
     * <td>The abbreviated name of the month, for example, Jan for January.</td>
     * </tr>
     * <tr>
     * <td>MMMM</td>
     * <td>Full name of the month.</td>
     * </tr>
     * <tr>
     * <td>y</td>
     * <td>Year without the century.</td>
     * </tr>
     * <tr>
     * <td>yy</td>
     * <td>Year without the century but including a leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>yyyy</td>
     * <td>Year with the century.</td>
     * </tr>
     * <tr>
     * <td>h</td>
     * <td>Hour in a 12-hour clock.</td>
     * </tr>
     * <tr>
     * <td>hh</td>
     * <td>Hour in a 12-hour clock with a leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>H</td>
     * <td>Hour in a 24-hour clock.</td>
     * </tr>
     * <tr>
     * <td>HH</td>
     * <td>Hour in a 24-hour clock with a leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>m</td>
     * <td>Minute.</td>
     * </tr>
     * <tr>
     * <td>mm</td>
     * <td>Minute with a leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>S</td>
     * <td>Second.</td>
     * </tr>
     * <tr>
     * <td>Ss</td>
     * <td>Second with a leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>T</td>
     * <td>The first character of the A.M./P.M. designator.</td>
     * </tr>
     * <tr>
     * <td>Tt</td>
     * <td>The A.M./P.M. designator.</td>
     * </tr>
     * <tr>
     * <td>Z</td>
     * <td>Time zone offset.</td>
     * </tr>
     * <tr>
     * <td>Zz</td>
     * <td>Time zone offset with a leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>N</td>
     * <td>Serial number. The number of leading zeros is defined by the number of characters. For example, if the serial number is 32 and the pattern is NNN, the serial number used is 032.</td>
     * </tr>
     * <tr>
     * <td>\c</td>
     * <td>Escaped character, where <i>c</i> is any character. Unrecognized characters, excluding white space, that are not escaped will result in an error.</td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_subdirectoryformatpattern
     */
    get_SubdirectoryFormatPattern() {
        pattern := BSTR()
        result := ComCall(38, this, "ptr", pattern, "HRESULT")
        return pattern
    }

    /**
     * Retrieves or sets a format pattern to use when decorating the folder name.
     * @remarks
     * 
     * PLA uses the pattern only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_subdirectoryformat">IDataCollectorSet::SubdirectoryFormat</a> property is set to <b>plaPattern</b>.
     * 
     * Use the following pattern characters to define your own pattern to append to the file name. For example, the pattern "MMMM d, yyyy \a\t h:mmTt" could yield "January 31, 2005 at 4:20AM". 
     * 
     * <table>
     * <tr>
     * <th>Pattern</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>D</td>
     * <td>Day of the year.</td>
     * </tr>
     * <tr>
     * <td>DDD</td>
     * <td>Day of the year with leading zeros, if applicable.</td>
     * </tr>
     * <tr>
     * <td>d</td>
     * <td>Day of the month.</td>
     * </tr>
     * <tr>
     * <td>dd</td>
     * <td>Day of the month with a leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>ddd</td>
     * <td>The abbreviated name of the weekday, for example, Tue for Tuesday.</td>
     * </tr>
     * <tr>
     * <td>dddd</td>
     * <td>Full name of the weekday.</td>
     * </tr>
     * <tr>
     * <td>M</td>
     * <td>Month.</td>
     * </tr>
     * <tr>
     * <td>MM</td>
     * <td>Month with leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>MMM</td>
     * <td>The abbreviated name of the month, for example, Jan for January.</td>
     * </tr>
     * <tr>
     * <td>MMMM</td>
     * <td>Full name of the month.</td>
     * </tr>
     * <tr>
     * <td>y</td>
     * <td>Year without the century.</td>
     * </tr>
     * <tr>
     * <td>yy</td>
     * <td>Year without the century but including a leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>yyyy</td>
     * <td>Year with the century.</td>
     * </tr>
     * <tr>
     * <td>h</td>
     * <td>Hour in a 12-hour clock.</td>
     * </tr>
     * <tr>
     * <td>hh</td>
     * <td>Hour in a 12-hour clock with a leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>H</td>
     * <td>Hour in a 24-hour clock.</td>
     * </tr>
     * <tr>
     * <td>HH</td>
     * <td>Hour in a 24-hour clock with a leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>m</td>
     * <td>Minute.</td>
     * </tr>
     * <tr>
     * <td>mm</td>
     * <td>Minute with a leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>S</td>
     * <td>Second.</td>
     * </tr>
     * <tr>
     * <td>Ss</td>
     * <td>Second with a leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>T</td>
     * <td>The first character of the A.M./P.M. designator.</td>
     * </tr>
     * <tr>
     * <td>Tt</td>
     * <td>The A.M./P.M. designator.</td>
     * </tr>
     * <tr>
     * <td>Z</td>
     * <td>Time zone offset.</td>
     * </tr>
     * <tr>
     * <td>Zz</td>
     * <td>Time zone offset with a leading zero, if applicable.</td>
     * </tr>
     * <tr>
     * <td>N</td>
     * <td>Serial number. The number of leading zeros is defined by the number of characters. For example, if the serial number is 32 and the pattern is NNN, the serial number used is 032.</td>
     * </tr>
     * <tr>
     * <td>\c</td>
     * <td>Escaped character, where <i>c</i> is any character. Unrecognized characters, excluding white space, that are not escaped will result in an error.</td>
     * </tr>
     * </table>
     * 
     * 
     * @param {BSTR} pattern 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_subdirectoryformatpattern
     */
    put_SubdirectoryFormatPattern(pattern) {
        pattern := pattern is String ? BSTR.Alloc(pattern).Value : pattern

        result := ComCall(39, this, "ptr", pattern, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the name of a Task Scheduler job to start each time the data collector set stops, including between segments.
     * @remarks
     * 
     * To specify command-line arguments for the task, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_taskarguments">IDataCollectorSet::TaskArguments</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_taskusertextarguments">IDataCollectorSet::TaskUserTextArguments</a>. 
     * 
     * To start the task in the directory where PLA is collecting the data, set the task's <b>Start in</b> field to $(Arg1).
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_task
     */
    get_Task() {
        task := BSTR()
        result := ComCall(40, this, "ptr", task, "HRESULT")
        return task
    }

    /**
     * Retrieves or sets the name of a Task Scheduler job to start each time the data collector set stops, including between segments.
     * @remarks
     * 
     * To specify command-line arguments for the task, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_taskarguments">IDataCollectorSet::TaskArguments</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_taskusertextarguments">IDataCollectorSet::TaskUserTextArguments</a>. 
     * 
     * To start the task in the directory where PLA is collecting the data, set the task's <b>Start in</b> field to $(Arg1).
     * 
     * 
     * @param {BSTR} task 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_task
     */
    put_Task(task) {
        task := task is String ? BSTR.Alloc(task).Value : task

        result := ComCall(41, this, "ptr", task, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that determines whether the task runs as the data collector set user or as the user specified in the task.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_taskrunasself
     */
    get_TaskRunAsSelf() {
        result := ComCall(42, this, "short*", &RunAsSelf := 0, "HRESULT")
        return RunAsSelf
    }

    /**
     * Retrieves or sets a value that determines whether the task runs as the data collector set user or as the user specified in the task.
     * @param {VARIANT_BOOL} RunAsSelf 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_taskrunasself
     */
    put_TaskRunAsSelf(RunAsSelf) {
        result := ComCall(43, this, "short", RunAsSelf, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the command-line arguments to pass to the Task Scheduler job specified in the IDataCollectorSet::Task property.
     * @remarks
     * 
     * PLA provides the following substitution variables that you can include in your arguments string. PLA provides the values for the substitution variables when the task is triggered. You must escape the braces, for example, \{name\}.
     * 
     * <table>
     * <tr>
     * <th>Variable</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>{key}</td>
     * <td>Space-delimited list of key values that were specified using the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-setvalue">IDataCollectorSet::SetValue</a> method.</td>
     * </tr>
     * <tr>
     * <td>{logs}</td>
     * <td>Space-delimited list of full paths to the current data collector files.</td>
     * </tr>
     * <tr>
     * <td>{state}</td>
     * <td>Indicates whether the set is running (1 for running, 0 for stopped).</td>
     * </tr>
     * <tr>
     * <td>{usertext}</td>
     * <td>String from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_taskusertextarguments">IDataCollectorSet::TaskUserTextArguments</a> property.</td>
     * </tr>
     * </table>
     *  
     * 
     * Typically, if you use the substitution variables, you specify them in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_taskusertextarguments">TaskUserTextArguments</a>, where you do not have to escape the braces and then specify {usertext} in this property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_taskarguments
     */
    get_TaskArguments() {
        task := BSTR()
        result := ComCall(44, this, "ptr", task, "HRESULT")
        return task
    }

    /**
     * Retrieves or sets the command-line arguments to pass to the Task Scheduler job specified in the IDataCollectorSet::Task property.
     * @remarks
     * 
     * PLA provides the following substitution variables that you can include in your arguments string. PLA provides the values for the substitution variables when the task is triggered. You must escape the braces, for example, \{name\}.
     * 
     * <table>
     * <tr>
     * <th>Variable</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>{key}</td>
     * <td>Space-delimited list of key values that were specified using the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-setvalue">IDataCollectorSet::SetValue</a> method.</td>
     * </tr>
     * <tr>
     * <td>{logs}</td>
     * <td>Space-delimited list of full paths to the current data collector files.</td>
     * </tr>
     * <tr>
     * <td>{state}</td>
     * <td>Indicates whether the set is running (1 for running, 0 for stopped).</td>
     * </tr>
     * <tr>
     * <td>{usertext}</td>
     * <td>String from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_taskusertextarguments">IDataCollectorSet::TaskUserTextArguments</a> property.</td>
     * </tr>
     * </table>
     *  
     * 
     * Typically, if you use the substitution variables, you specify them in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_taskusertextarguments">TaskUserTextArguments</a>, where you do not have to escape the braces and then specify {usertext} in this property.
     * 
     * 
     * @param {BSTR} task 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_taskarguments
     */
    put_TaskArguments(task) {
        task := task is String ? BSTR.Alloc(task).Value : task

        result := ComCall(45, this, "ptr", task, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the command-line arguments that are substituted for the {usertext} substitution variable in the IDataCollectorSet::TaskArguments property.
     * @remarks
     * 
     * These arguments are included in the command-line arguments passed to the Task Scheduler job only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_taskarguments">TaskArguments</a> property includes the  {usertext} substitution variable. 
     * 
     * PLA provides the following substitution variables that you can include in your arguments string. PLA provides the values for the substitution variables when the task is triggered. You do not escape the braces.
     * 
     * <table>
     * <tr>
     * <th>Variable</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>{key}</td>
     * <td>Space-delimited list of key values that were specified using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-setvalue">IDataCollectorSet::SetValue</a> method.</td>
     * </tr>
     * <tr>
     * <td>{logs}</td>
     * <td>Space-delimited list of full paths to the current data collector files.</td>
     * </tr>
     * <tr>
     * <td>{state}</td>
     * <td> Indicates whether the set is running (1 for running, 0 for stopped).</td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_taskusertextarguments
     */
    get_TaskUserTextArguments() {
        UserText := BSTR()
        result := ComCall(46, this, "ptr", UserText, "HRESULT")
        return UserText
    }

    /**
     * Retrieves or sets the command-line arguments that are substituted for the {usertext} substitution variable in the IDataCollectorSet::TaskArguments property.
     * @remarks
     * 
     * These arguments are included in the command-line arguments passed to the Task Scheduler job only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_taskarguments">TaskArguments</a> property includes the  {usertext} substitution variable. 
     * 
     * PLA provides the following substitution variables that you can include in your arguments string. PLA provides the values for the substitution variables when the task is triggered. You do not escape the braces.
     * 
     * <table>
     * <tr>
     * <th>Variable</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>{key}</td>
     * <td>Space-delimited list of key values that were specified using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-setvalue">IDataCollectorSet::SetValue</a> method.</td>
     * </tr>
     * <tr>
     * <td>{logs}</td>
     * <td>Space-delimited list of full paths to the current data collector files.</td>
     * </tr>
     * <tr>
     * <td>{state}</td>
     * <td> Indicates whether the set is running (1 for running, 0 for stopped).</td>
     * </tr>
     * </table>
     * 
     * 
     * @param {BSTR} UserText 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_taskusertextarguments
     */
    put_TaskUserTextArguments(UserText) {
        UserText := UserText is String ? BSTR.Alloc(UserText).Value : UserText

        result := ComCall(47, this, "ptr", UserText, "HRESULT")
        return result
    }

    /**
     * Retrieves the list of schedules that determine when the data collector set runs.
     * @remarks
     * 
     * There can be only one instance of a data collector set running at a time; if one is already running and a second one tries to start, the second one will fail and the first one will continue.
     * 
     * To enable the schedules, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_schedulesenabled">IDataCollectorSet::SchedulesEnabled</a> property.
     * 
     * To manually start the data collector set, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-start">IDataCollectorSet::Start</a> method.
     * 
     * 
     * @returns {IScheduleCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_schedules
     */
    get_Schedules() {
        result := ComCall(48, this, "ptr*", &ppSchedules := 0, "HRESULT")
        return IScheduleCollection(ppSchedules)
    }

    /**
     * Retrieves or sets a value that indicates whether the schedules are enabled.
     * @remarks
     * 
     * You can use this property to temporarily suspend running the data collection set based on the schedules.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_schedulesenabled
     */
    get_SchedulesEnabled() {
        result := ComCall(49, this, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Retrieves or sets a value that indicates whether the schedules are enabled.
     * @remarks
     * 
     * You can use this property to temporarily suspend running the data collection set based on the schedules.
     * 
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_schedulesenabled
     */
    put_SchedulesEnabled(enabled) {
        result := ComCall(50, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * Retrieves the user account under which the data collector set will run.
     * @remarks
     * 
     * The user name is set using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-setcredentials">IDataCollectorSet::SetCredentials</a> method.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_useraccount
     */
    get_UserAccount() {
        user := BSTR()
        result := ComCall(51, this, "ptr", user, "HRESULT")
        return user
    }

    /**
     * Retrieves an XML string that describes the values of the data collector set properties, including those of the data collectors contained in the set.
     * @remarks
     * 
     * For details on the property elements contained in the XML string, see the Remarks section of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollectorset">IDataCollectorSet</a> and the individual data collectors.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_xml
     */
    get_Xml() {
        xml := BSTR()
        result := ComCall(52, this, "ptr", xml, "HRESULT")
        return xml
    }

    /**
     * Retrieves or sets access control information that determines who can access this data collector set.
     * @remarks
     * 
     * By default, the user has full privileges, the Administrators group has read, write, and execute privileges, and the Performance Log Users group has read and execute privileges.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_security
     */
    get_Security() {
        pbstrSecurity := BSTR()
        result := ComCall(53, this, "ptr", pbstrSecurity, "HRESULT")
        return pbstrSecurity
    }

    /**
     * Retrieves or sets access control information that determines who can access this data collector set.
     * @remarks
     * 
     * By default, the user has full privileges, the Administrators group has read, write, and execute privileges, and the Performance Log Users group has read and execute privileges.
     * 
     * 
     * @param {BSTR} bstrSecurity 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_security
     */
    put_Security(bstrSecurity) {
        bstrSecurity := bstrSecurity is String ? BSTR.Alloc(bstrSecurity).Value : bstrSecurity

        result := ComCall(54, this, "ptr", bstrSecurity, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that determines whether the data collector set stops when all the data collectors in the set are in a completed state.
     * @remarks
     * 
     * A data collector set stops only after all the data collectors in the set are complete. The following table identifies when each data collector is complete.
     * 
     * <table>
     * <tr>
     * <th>Collector</th>
     * <th>Is complete </th>
     * </tr>
     * <tr>
     * <td>Configuration</td>
     * <td>When all configuration information has been collected.</td>
     * </tr>
     * <tr>
     * <td>Performance Counter and Event Tracing</td>
     * <td>Immediately if both <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxduration">segment duration</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxsize">segment size</a> are zero. Otherwise, if either segment duration or segment size is specified, then the set completes only after one of the segment conditions is met.For Performance Counter, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-iperformancecounterdatacollector-get_segmentmaxrecords">maximum number of records segment</a> is also considered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Alert and API Tracing</td>
     * <td>Immediately. </td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_stoponcompletion
     */
    get_StopOnCompletion() {
        result := ComCall(55, this, "short*", &Stop := 0, "HRESULT")
        return Stop
    }

    /**
     * Retrieves or sets a value that determines whether the data collector set stops when all the data collectors in the set are in a completed state.
     * @remarks
     * 
     * A data collector set stops only after all the data collectors in the set are complete. The following table identifies when each data collector is complete.
     * 
     * <table>
     * <tr>
     * <th>Collector</th>
     * <th>Is complete </th>
     * </tr>
     * <tr>
     * <td>Configuration</td>
     * <td>When all configuration information has been collected.</td>
     * </tr>
     * <tr>
     * <td>Performance Counter and Event Tracing</td>
     * <td>Immediately if both <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxduration">segment duration</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_segmentmaxsize">segment size</a> are zero. Otherwise, if either segment duration or segment size is specified, then the set completes only after one of the segment conditions is met.For Performance Counter, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-iperformancecounterdatacollector-get_segmentmaxrecords">maximum number of records segment</a> is also considered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Alert and API Tracing</td>
     * <td>Immediately. </td>
     * </tr>
     * </table>
     * 
     * 
     * @param {VARIANT_BOOL} Stop 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-put_stoponcompletion
     */
    put_StopOnCompletion(Stop) {
        result := ComCall(56, this, "short", Stop, "HRESULT")
        return result
    }

    /**
     * Retrieves the data manager associated with this data collector set.
     * @returns {IDataManager} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-get_datamanager
     */
    get_DataManager() {
        result := ComCall(57, this, "ptr*", &DataManager := 0, "HRESULT")
        return IDataManager(DataManager)
    }

    /**
     * Specifies the user account under which the data collector set runs.
     * @param {BSTR} user A user account under which the data collector set runs. Specify the user name in the form <i>domain</i>&#92;<i>user</i> or <i>user</i>@<i>domain</i>.
     * @param {BSTR} password The password of the user account.
     * @returns {HRESULT} The property returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-setcredentials
     */
    SetCredentials(user, password) {
        user := user is String ? BSTR.Alloc(user).Value : user
        password := password is String ? BSTR.Alloc(password).Value : password

        result := ComCall(58, this, "ptr", user, "ptr", password, "HRESULT")
        return result
    }

    /**
     * Retrieves the specified data collector set.
     * @param {BSTR} name The name of the data collector set to retrieve. The name is case-insensitive and is of the form <b>[</b><i>Namespace</i><b>\]</b><i>Name</i>. For details on the optional namespace, see Remarks.
     * @param {BSTR} server The computer on which the set exists. You can specify a computer name, a fully qualified domain name, or an IP address (IPv4 or IPv6 format). If <b>NULL</b>, the set is retrieved from the local computer.
     * @returns {HRESULT} Returns S_OK if successful. The following table shows possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PLA_E_DCS_NOT_FOUND</b></dt>
     * <dt>0x80300002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified data collector set was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * <dt>0x80300002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You must retrieve a data collector set into an empty instance or into an instance that uses the same namespace.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(RPC_S_SERVER_UNAVAILABLE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RPC server is not available. The method is unable to query the data collector set remotely. To query the data collector set from a remote computer running Windows Vista, enable Performance Logs and Alerts in <b>Windows Firewall Settings</b> on the remote computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_BAD_NETPATH)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to find the remote computer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-query
     */
    Query(name, server) {
        name := name is String ? BSTR.Alloc(name).Value : name
        server := server is String ? BSTR.Alloc(server).Value : server

        result := ComCall(59, this, "ptr", name, "ptr", server, "HRESULT")
        return result
    }

    /**
     * Saves, updates, or validates the data collector set. You can also use this method to flush a trace session.
     * @param {BSTR} name A unique name used to save the data collector set. The name is of the form  <b>[</b><i>Namespace</i><b>\]</b><i>Name</i>. For details, see Remarks.
     * @param {BSTR} server The computer on which you want to save the set. You can specify a computer name, a fully qualified domain name, or an IP address (IPv4 or IPv6 format). If <b>NULL</b>, the set is saved to the local computer.
     * @param {Integer} mode Indicates whether you want to save, update, flush, or validate the data collector set. For possible values, see the <a href="https://docs.microsoft.com/windows/win32/api/pla/ne-pla-commitmode">CommitMode</a> enumeration.
     * @returns {IValueMap} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemap">IValueMap</a> interface that you use to retrieve the validation error of each property whose value is not valid or is ignored. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_count">IValueMap::Count</a> property is zero if there were no errors or warnings.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-commit
     */
    Commit(name, server, mode) {
        name := name is String ? BSTR.Alloc(name).Value : name
        server := server is String ? BSTR.Alloc(server).Value : server

        result := ComCall(60, this, "ptr", name, "ptr", server, "int", mode, "ptr*", &validation := 0, "HRESULT")
        return IValueMap(validation)
    }

    /**
     * Deletes the persisted copy of the data collector set if the set is not running.
     * @returns {HRESULT} Returns S_OK if successful. The following table shows a possible error value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(RPC_S_SERVER_UNAVAILABLE)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The RPC server is not available. The method is unable to delete the data collector set remotely. To delete the data collector set on a remote computer running  Windows Vista, enable Performance Logs and Alerts in <b>Windows Firewall Settings</b> on the remote computer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-delete
     */
    Delete() {
        result := ComCall(61, this, "HRESULT")
        return result
    }

    /**
     * Manually starts the data collector set.
     * @param {VARIANT_BOOL} Synchronous Data collection runs in a separate process. This value determines when the method returns. 
     * 
     * Set to VARIANT_TRUE to have the method return after the data collection process starts or fails to start. The return value indicates whether the set successfully started or failed to start.
     * 
     * Set to VARIANT_FALSE to return after the set is queued to run. The return value indicates whether the set was successfully queued. For more information, see Remarks.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. The following table shows possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The set must be persisted (see the <a href="/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-commit">Commit</a> method) prior to starting collection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_PATH_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system cannot find the path specified. This error occurs when the <a href="/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_rootpath">RootPath</a> property specifies a directory that does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_EXISTS)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subdirectory or log file already exists. Try using a format to uniquely identify the file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-start
     */
    Start(Synchronous) {
        result := ComCall(62, this, "short", Synchronous, "HRESULT")
        return result
    }

    /**
     * Manually stops the data collector set.
     * @param {VARIANT_BOOL} Synchronous Data collection runs in a separate process. This value determines when the method returns. 
     * 
     * Set to VARIANT_TRUE to have the method return after the data collector set is stopped or fails to stop. The return value indicates whether the set successfully stopped or failed to stop.
     * 
     * Set to VARIANT_FALSE to return after the method sends a request to the set to stop. The return value indicates whether the request was successfully sent to the set. An event is written to the event log if the set fails to stop.
     * @returns {HRESULT} Returns S_OK if successful. The following table shows a possible error value.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PLA_E_DCS_NOT_RUNNING</b></dt>
     * <dt>0x80300104</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data collector set is not running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-stop
     */
    Stop(Synchronous) {
        result := ComCall(63, this, "short", Synchronous, "HRESULT")
        return result
    }

    /**
     * Sets the property values of those properties included in the XML.
     * @param {BSTR} xml XML that contains the properties to set. For details on specifying the XML string, see the Remarks section of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollectorset">IDataCollectorSet</a>.
     * @returns {IValueMap} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemap">IValueMap</a> interface that you use to retrieve the validation error of each property whose value is not valid. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_count">IValueMap::Count</a> property is zero if there were no errors.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-setxml
     */
    SetXml(xml) {
        xml := xml is String ? BSTR.Alloc(xml).Value : xml

        result := ComCall(64, this, "ptr", xml, "ptr*", &validation := 0, "HRESULT")
        return IValueMap(validation)
    }

    /**
     * Sets a user-defined value.
     * @param {BSTR} key The name of the value.
     * @param {BSTR} value The value associated with the key.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-setvalue
     */
    SetValue(key, value) {
        key := key is String ? BSTR.Alloc(key).Value : key
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(65, this, "ptr", key, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Retrieves a user-defined value.
     * @param {BSTR} key The key of the value to retrieve.
     * @returns {BSTR} A value associated with the key.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollectorset-getvalue
     */
    GetValue(key) {
        key := key is String ? BSTR.Alloc(key).Value : key

        value := BSTR()
        result := ComCall(66, this, "ptr", key, "ptr", value, "HRESULT")
        return value
    }
}

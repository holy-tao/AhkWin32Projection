#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmCollection.ahk
#Include .\IFsrmPropertyDefinition.ahk
#Include .\IFsrmRule.ahk
#Include .\IFsrmPipelineModuleDefinition.ahk
#Include .\IFsrmProperty.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Manages file classification. Use this interface to define properties to use in classification, add classification rules for classifying files, define classification and storage modules, and enable classification reporting.
 * @remarks
 * 
 * To create this object from a script, use the "Fsrm.FsrmClassificationManager" program 
 *     identifier.
 * 
 * The classification feature lets you classify (tag) files. To do this the properties that can be associated with 
 *      a file must first be defined using 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-createpropertydefinition">CreatePropertyDefinition</a>. 
 *      Once a property is defined it may be set using APIs such as 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-setfileproperty">SetFileProperty</a>, retrieved 
 *      using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-getfileproperty">GetFileProperty</a> or 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enumfileproperties">EnumFileProperties</a>, or 
 *      cleared using 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-clearfileproperty">ClearFileProperty</a>. 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager2-classifyfiles">ClassifyFiles</a> performs these 
 *      actions on multiple files. Alternatively a series of rules to automatically classify files can be created. If a 
 *      rule applies to the file, the rule associates a property and property value with the file. The property can be 
 *      stored separately from the file or stored in the file depending on the storage module available on the 
 *      machine.
 * 
 * The built-in System Cache Storage Module stores the properties outside of the file using alternate data stream 
 *      storage and the security descriptor (Windows Server 2012 and Windows 8 only). Storing the 
 *      properties separately may result in them not moving when the file is moved.
 * 
 * The Office Storage Modules store the classification properties in the Office files themselves. One parser is 
 *      for Office 97-2003 files, and the other is for Office 2007-2010 files. Office files that contain the 
 *      classification properties in the file can have the properties displayed in SharePoint if the property names match 
 *      the SharePoint column names. Updating the column values in SharePoint updates the properties in the file. Note 
 *      that SharePoint treats these names as case-sensitive, therefore the property definition's name defined in FSRM 
 *      must have the same case when uploading to SharePoint.
 * 
 * You can use the classification and storage plugins or you can implement your own classification and storage 
 *      plugins. Note that the built-in Content Classifier plugin uses the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface to search the content of the file.
 * 
 * When you run classification, FSRM evaluates a files for any rule that is applicable to that file (and committed 
 *      to FSRM) and enabled. If reporting is enabled, FSRM also generates the classification reports.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmclassificationmanager
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmClassificationManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmClassificationManager
     * @type {Guid}
     */
    static IID => Guid("{d2dc89da-ee91-48a0-85d8-cc72a56f7d04}")

    /**
     * The class identifier for FsrmClassificationManager
     * @type {Guid}
     */
    static CLSID => Guid("{b15c0e47-c391-45b9-95c8-eb596c853f3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ClassificationReportFormats", "put_ClassificationReportFormats", "get_Logging", "put_Logging", "get_ClassificationReportMailTo", "put_ClassificationReportMailTo", "get_ClassificationReportEnabled", "put_ClassificationReportEnabled", "get_ClassificationLastReportPathWithoutExtension", "get_ClassificationLastError", "get_ClassificationRunningStatus", "EnumPropertyDefinitions", "CreatePropertyDefinition", "GetPropertyDefinition", "EnumRules", "CreateRule", "GetRule", "EnumModuleDefinitions", "CreateModuleDefinition", "GetModuleDefinition", "RunClassification", "WaitForClassificationCompletion", "CancelClassification", "EnumFileProperties", "GetFileProperty", "SetFileProperty", "ClearFileProperty"]

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    ClassificationReportFormats {
        get => this.get_ClassificationReportFormats()
        set => this.put_ClassificationReportFormats(value)
    }

    /**
     * @type {Integer} 
     */
    Logging {
        get => this.get_Logging()
        set => this.put_Logging(value)
    }

    /**
     * @type {BSTR} 
     */
    ClassificationReportMailTo {
        get => this.get_ClassificationReportMailTo()
        set => this.put_ClassificationReportMailTo(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ClassificationReportEnabled {
        get => this.get_ClassificationReportEnabled()
        set => this.put_ClassificationReportEnabled(value)
    }

    /**
     * @type {BSTR} 
     */
    ClassificationLastReportPathWithoutExtension {
        get => this.get_ClassificationLastReportPathWithoutExtension()
    }

    /**
     * @type {BSTR} 
     */
    ClassificationLastError {
        get => this.get_ClassificationLastError()
    }

    /**
     * @type {Integer} 
     */
    ClassificationRunningStatus {
        get => this.get_ClassificationRunningStatus()
    }

    /**
     * The list of formats in which to generate the classification reports.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-get_classificationreportformats
     */
    get_ClassificationReportFormats() {
        result := ComCall(7, this, "ptr*", &formats := 0, "HRESULT")
        return formats
    }

    /**
     * The list of formats in which to generate the classification reports.
     * @param {Pointer<SAFEARRAY>} formats 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-put_classificationreportformats
     */
    put_ClassificationReportFormats(formats) {
        result := ComCall(8, this, "ptr", formats, "HRESULT")
        return result
    }

    /**
     * The types of logging to perform when running the classification rules.
     * @remarks
     * 
     * The log file for the <b>FsrmClassificationLoggingFlags_ClassificationsInLogFile</b> and 
     *     <b>FsrmClassificationLoggingFlags_ErrorsInLogFile</b> logging options are stored in the 
     *     reports directory. The name of the 
     *     <b>FsrmClassificationLoggingFlags_ClassificationsInLogFile</b> log file is 
     *     "<i>ClassifierName</i>-<i>FsrmServerName(FQDN)</i>-<i>TimeStamp</i>.xml". 
     *     The log file contains one entry per property assignment to a specific file. Each log entry specifies the:
     * 
     * <ul>
     * <li>File name (full path)</li>
     * <li>Property</li>
     * <li>Value assigned</li>
     * <li>Rule applied</li>
     * <li>Result (whether the classification succeeded)</li>
     * </ul>
     * The name of the <b>FsrmClassificationLoggingFlags_ErrorsInLogFile</b> log file is 
     *     "<i>ClassifierName</i><i>Errors</i>-<i>FQDNServerName</i>-<i>TimeStamp</i>.xml". 
     *     The log file contains one entry per error. Each log entry specifies the:
     * 
     * <ul>
     * <li>Error code</li>
     * <li>File name (full path)</li>
     * <li>Property</li>
     * <li>Rule applied</li>
     * </ul>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-get_logging
     */
    get_Logging() {
        result := ComCall(9, this, "int*", &logging := 0, "HRESULT")
        return logging
    }

    /**
     * The types of logging to perform when running the classification rules.
     * @remarks
     * 
     * The log file for the <b>FsrmClassificationLoggingFlags_ClassificationsInLogFile</b> and 
     *     <b>FsrmClassificationLoggingFlags_ErrorsInLogFile</b> logging options are stored in the 
     *     reports directory. The name of the 
     *     <b>FsrmClassificationLoggingFlags_ClassificationsInLogFile</b> log file is 
     *     "<i>ClassifierName</i>-<i>FsrmServerName(FQDN)</i>-<i>TimeStamp</i>.xml". 
     *     The log file contains one entry per property assignment to a specific file. Each log entry specifies the:
     * 
     * <ul>
     * <li>File name (full path)</li>
     * <li>Property</li>
     * <li>Value assigned</li>
     * <li>Rule applied</li>
     * <li>Result (whether the classification succeeded)</li>
     * </ul>
     * The name of the <b>FsrmClassificationLoggingFlags_ErrorsInLogFile</b> log file is 
     *     "<i>ClassifierName</i><i>Errors</i>-<i>FQDNServerName</i>-<i>TimeStamp</i>.xml". 
     *     The log file contains one entry per error. Each log entry specifies the:
     * 
     * <ul>
     * <li>Error code</li>
     * <li>File name (full path)</li>
     * <li>Property</li>
     * <li>Rule applied</li>
     * </ul>
     * 
     * 
     * @param {Integer} logging 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-put_logging
     */
    put_Logging(logging) {
        result := ComCall(10, this, "int", logging, "HRESULT")
        return result
    }

    /**
     * The email address to which to send the classification reports, if any.
     * @remarks
     * 
     * This property is optional.
     * 
     * The email message is sent only if the classification finishes successfully. Email is not sent for 
     *     <b>FsrmReportType_ExportReport</b> report types. The reports are attached to the email 
     *     message. You can specify [Admin Email] to send notification to the administrator (if the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-get_adminemail">IFsrmSetting::AdminEmail</a> property is set). The 
     *     subject is "&lt;ReportType&gt;: &lt;ReportName&gt;". The body of the email message is empty.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-get_classificationreportmailto
     */
    get_ClassificationReportMailTo() {
        mailTo := BSTR()
        result := ComCall(11, this, "ptr", mailTo, "HRESULT")
        return mailTo
    }

    /**
     * The email address to which to send the classification reports, if any.
     * @remarks
     * 
     * This property is optional.
     * 
     * The email message is sent only if the classification finishes successfully. Email is not sent for 
     *     <b>FsrmReportType_ExportReport</b> report types. The reports are attached to the email 
     *     message. You can specify [Admin Email] to send notification to the administrator (if the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-get_adminemail">IFsrmSetting::AdminEmail</a> property is set). The 
     *     subject is "&lt;ReportType&gt;: &lt;ReportName&gt;". The body of the email message is empty.
     * 
     * 
     * @param {BSTR} mailTo 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-put_classificationreportmailto
     */
    put_ClassificationReportMailTo(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(12, this, "ptr", mailTo, "HRESULT")
        return result
    }

    /**
     * Determines whether classification reporting is enabled or not.
     * @remarks
     * 
     * Controls reporting regardless of whether classification was scheduled (using the Task Scheduler) or run on 
     *     demand (using 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-runclassification">IFsrmClassificationManager::RunClassification</a>).
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-get_classificationreportenabled
     */
    get_ClassificationReportEnabled() {
        result := ComCall(13, this, "short*", &reportEnabled := 0, "HRESULT")
        return reportEnabled
    }

    /**
     * Determines whether classification reporting is enabled or not.
     * @remarks
     * 
     * Controls reporting regardless of whether classification was scheduled (using the Task Scheduler) or run on 
     *     demand (using 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-runclassification">IFsrmClassificationManager::RunClassification</a>).
     * 
     * 
     * @param {VARIANT_BOOL} reportEnabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-put_classificationreportenabled
     */
    put_ClassificationReportEnabled(reportEnabled) {
        result := ComCall(14, this, "short", reportEnabled, "HRESULT")
        return result
    }

    /**
     * The local directory path where the reports were stored the last time that classification ran.
     * @remarks
     * 
     * If the reports failed, this is the path where the reports would have been stored. The directory may contain 
     *     reports that completed successfully before the failure occurred. The value passed to 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-setoutputdirectory">IFsrmReportManager::SetOutputDirectory</a>, 
     *     if any, and the reporting context determine the path.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-get_classificationlastreportpathwithoutextension
     */
    get_ClassificationLastReportPathWithoutExtension() {
        lastReportPath := BSTR()
        result := ComCall(15, this, "ptr", lastReportPath, "HRESULT")
        return lastReportPath
    }

    /**
     * The error message from the last time that classification was run.
     * @remarks
     * 
     * The property is set after classification is run either manually using 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-runclassification">IFsrmClassificationManager::RunClassification</a> 
     *     or is scheduled using Task Scheduler.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-get_classificationlasterror
     */
    get_ClassificationLastError() {
        lastError := BSTR()
        result := ComCall(16, this, "ptr", lastError, "HRESULT")
        return lastError
    }

    /**
     * The running status of the classification.
     * @remarks
     * 
     * Used regardless of whether classification was scheduled (using the Task Scheduler) or run on demand (using 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-runclassification">IFsrmClassificationManager::RunClassification</a>).
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-get_classificationrunningstatus
     */
    get_ClassificationRunningStatus() {
        result := ComCall(17, this, "int*", &runningStatus := 0, "HRESULT")
        return runningStatus
    }

    /**
     * Enumerates the property definitions.
     * @param {Integer} options One or more options for enumerating the property definitions. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * @returns {IFsrmCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a> interface that contains a 
     *        collection of property definitions. Each item in the collection is a <b>VARIANT</b> of 
     *        type <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the 
     *        variant for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpropertydefinition">IFsrmPropertyDefinition</a> 
     *        interface.
     * 
     * The collection contains only committed property definitions; the collection will not contain newly created 
     *        property definitions that have not been committed.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enumpropertydefinitions
     */
    EnumPropertyDefinitions(options) {
        result := ComCall(18, this, "int", options, "ptr*", &propertyDefinitions := 0, "HRESULT")
        return IFsrmCollection(propertyDefinitions)
    }

    /**
     * Creates a property definition.
     * @returns {IFsrmPropertyDefinition} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpropertydefinition">IFsrmPropertyDefinition</a> interface to the 
     *       new property definition. To save the property definition, call 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmPropertyDefinition::Commit</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-createpropertydefinition
     */
    CreatePropertyDefinition() {
        result := ComCall(19, this, "ptr*", &propertyDefinition := 0, "HRESULT")
        return IFsrmPropertyDefinition(propertyDefinition)
    }

    /**
     * Retrieves the specified property definition.
     * @param {BSTR} propertyName The name of the property definition to retrieve.
     * @returns {IFsrmPropertyDefinition} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpropertydefinition">IFsrmPropertyDefinition</a> interface to the 
     *       retrieved property definition.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-getpropertydefinition
     */
    GetPropertyDefinition(propertyName) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(20, this, "ptr", propertyName, "ptr*", &propertyDefinition := 0, "HRESULT")
        return IFsrmPropertyDefinition(propertyDefinition)
    }

    /**
     * Enumerates the rules of the specified type.
     * @param {Integer} ruleType The type of rules to enumerate. For possible values, see the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmruletype">FsrmRuleType</a> enumeration.
     * 
     * <div class="alert"><b>Note</b>  The <b>FsrmRuleType_Generic</b> type is not a valid type for this method.</div>
     * <div> </div>
     * @param {Integer} options One or more options for enumerating the property definitions. For possible values, see the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * 
     * <div class="alert"><b>Note</b>  The <b>FsrmEnumOptions_Asynchronous</b> option is not supported for this 
     *        method.</div>
     * <div> </div>
     * @returns {IFsrmCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a> interface that contains a 
     *        collection of classification rules. Each item in the collection is a <b>VARIANT</b> of 
     *        type <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant 
     *        for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmrule">IFsrmRule</a> interface. You can then use the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmrule-get_ruletype">IFsrmRule.RuleType</a> property to determine the rule's 
     *        type. Query the <b>IFsrmRule</b> interface for the rule interface to 
     *        use. For example, if <b>RuleType</b> is 
     *        <b>FsrmRuleType_Classification</b>, query the 
     *        <b>IFsrmRule</b> interface for the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmclassificationrule">IFsrmClassificationRule</a> interface.
     * 
     * The collection contains only committed rules; the collection will not contain newly created rules that have 
     *        not been committed.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enumrules
     */
    EnumRules(ruleType, options) {
        result := ComCall(21, this, "int", ruleType, "int", options, "ptr*", &Rules := 0, "HRESULT")
        return IFsrmCollection(Rules)
    }

    /**
     * Creates a rule of the specified type.
     * @param {Integer} ruleType The type of rule to create, set this parameter to <b>FsrmRuleType_Classification</b>. 
     *       For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmruletype">FsrmRuleType</a>.
     * @returns {IFsrmRule} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmrule">IFsrmRule</a> interface to the new rule. Query the 
     *        <b>IFsrmRule</b> interface to get the interface to get the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmclassificationrule">IFsrmClassificationRule</a> interface.
     * 
     * To save the rule, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmRule::Commit</a> 
     *        method.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-createrule
     */
    CreateRule(ruleType) {
        result := ComCall(22, this, "int", ruleType, "ptr*", &Rule := 0, "HRESULT")
        return IFsrmRule(Rule)
    }

    /**
     * Retrieves the specified rule.
     * @param {BSTR} ruleName The name of the rule to retrieve. Must not exceed 100 characters in length.
     * @param {Integer} ruleType The type of the rule to retrieve. For possible types, see the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmruletype">FsrmRuleType</a> enumeration.
     * 
     * <div class="alert"><b>Note</b>  The <b>FsrmRuleType_Generic</b> type is not supported by this method.</div>
     * <div> </div>
     * @returns {IFsrmRule} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmrule">IFsrmRule</a> interface to  the retrieved rule. Query the 
     *       <b>IFsrmRule</b> interface to get the interface for the specified 
     *       type. For example, if <i>ruleType</i> is 
     *       <b>FsrmRuleType_Classification</b>, query the 
     *       <b>IFsrmRule</b> interface for the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmclassificationrule">IFsrmClassificationRule</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-getrule
     */
    GetRule(ruleName, ruleType) {
        ruleName := ruleName is String ? BSTR.Alloc(ruleName).Value : ruleName

        result := ComCall(23, this, "ptr", ruleName, "int", ruleType, "ptr*", &Rule := 0, "HRESULT")
        return IFsrmRule(Rule)
    }

    /**
     * Enumerates the module definitions of the specified type.
     * @param {Integer} moduleType Type of module to enumerate. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmpipelinemoduletype">FsrmPipelineModuleType</a> enumeration.
     * @param {Integer} options One or more options for enumerating the modules. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmenumoptions">FsrmEnumOptions</a> enumeration.
     * 
     * <div class="alert"><b>Note</b>  The <b>FsrmEnumOptions_Asynchronous</b> option is not supported by this method.</div>
     * <div> </div>
     * @returns {IFsrmCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a> interface that contains a 
     *        collection of module definitions. Each item in the collection is a <b>VARIANT</b> of type 
     *        <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for 
     *        the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduledefinition">IFsrmPipelineModuleDefinition</a> 
     *        interface. You can then use the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_moduletype">IFsrmPipelineModuleDefinition.ModuleType</a> 
     *        property to determine the module's type. Query the 
     *        <b>IFsrmPipelineModuleDefinition</b> interface 
     *        for the module interface to use. For example, if 
     *        <b>ModuleType</b> is 
     *        <b>FsrmPipelineModuleType_Classifier</b>, query the 
     *        <b>IFsrmPipelineModuleDefinition</b> interface 
     *        for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmclassifiermoduledefinition">IFsrmClassifierModuleDefinition</a> 
     *        interface.
     * 
     * The collection contains only committed module definitions; the collection will not contain newly created 
     *        module definitions that have not been committed.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enummoduledefinitions
     */
    EnumModuleDefinitions(moduleType, options) {
        result := ComCall(24, this, "int", moduleType, "int", options, "ptr*", &moduleDefinitions := 0, "HRESULT")
        return IFsrmCollection(moduleDefinitions)
    }

    /**
     * Creates a module definition of the specified type.
     * @param {Integer} moduleType The type of module to create (for example, a classifier or storage module). For possible types, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmpipelinemoduletype">FsrmPipelineModuleType</a> enumeration.
     * @returns {IFsrmPipelineModuleDefinition} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduledefinition">IFsrmPipelineModuleDefinition</a> 
     *        interface to the new module definition. Query the 
     *        <b>IFsrmPipelineModuleDefinition</b> interface to 
     *        get the interface for the specified module. For example, if <i>moduleType</i> is 
     *        <b>FsrmPipelineModuleType_Classifier</b>, query the 
     *        <b>IFsrmPipelineModuleDefinition</b> interface 
     *        for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmclassifiermoduledefinition">IFsrmClassifierModuleDefinition</a> 
     *        interface.
     * 
     * To save the module definition, call 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmPipelineModuleDefinition::Commit</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-createmoduledefinition
     */
    CreateModuleDefinition(moduleType) {
        result := ComCall(25, this, "int", moduleType, "ptr*", &moduleDefinition := 0, "HRESULT")
        return IFsrmPipelineModuleDefinition(moduleDefinition)
    }

    /**
     * Retrieves the specified module definition.
     * @param {BSTR} moduleName The name of the module to retrieve. Must not exceed 100 characters in length.
     * @param {Integer} moduleType The type of the module to retrieve. For possible types, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmpipelinemoduletype">FsrmPipelineModuleType</a> enumeration.
     * @returns {IFsrmPipelineModuleDefinition} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpipelinemoduledefinition">IFsrmPipelineModuleDefinition</a> 
     *       interface to  the retrieved module definition. Query the 
     *       <b>IFsrmPipelineModuleDefinition</b> interface to 
     *       get the interface for the specified module. For example, if <i>moduleType</i> is 
     *       <b>FsrmPipelineModuleType_Classifier</b>, query the 
     *       <b>IFsrmPipelineModuleDefinition</b> interface for 
     *       the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmclassifiermoduledefinition">IFsrmClassifierModuleDefinition</a> 
     *       interface.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-getmoduledefinition
     */
    GetModuleDefinition(moduleName, moduleType) {
        moduleName := moduleName is String ? BSTR.Alloc(moduleName).Value : moduleName

        result := ComCall(26, this, "ptr", moduleName, "int", moduleType, "ptr*", &moduleDefinition := 0, "HRESULT")
        return IFsrmPipelineModuleDefinition(moduleDefinition)
    }

    /**
     * Runs classification rules and generates the classification report.
     * @param {Integer} context Specifies the report subdirectory to which the classification report is written. For possible values, see 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmreportgenerationcontext">FsrmReportGenerationContext</a> enumeration. 
     *       To set the report directory, call the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmreports/nf-fsrmreports-ifsrmreportmanager-setoutputdirectory">IFsrmReportManager::SetOutputDirectory</a> 
     *       method.
     * @param {BSTR} reserved Must be <b>NULL</b>.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-runclassification
     */
    RunClassification(context, reserved) {
        reserved := reserved is String ? BSTR.Alloc(reserved).Value : reserved

        result := ComCall(27, this, "int", context, "ptr", reserved, "HRESULT")
        return result
    }

    /**
     * Waits for the specified period of time or until classification has finished running.
     * @param {Integer} waitSeconds The number of seconds to wait for classification and the reports to complete. The method returns when the 
     *       period expires or classification and the reports complete. To wait indefinitely, set the value to 
     *       –1. The value must be in the range from  –1 through 2,147,483.
     * @returns {VARIANT_BOOL} Is <b>VARIANT_TRUE</b> if the reports completed; otherwise, 
     *       <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-waitforclassificationcompletion
     */
    WaitForClassificationCompletion(waitSeconds) {
        result := ComCall(28, this, "int", waitSeconds, "short*", &completed := 0, "HRESULT")
        return completed
    }

    /**
     * Cancels classification if it is running.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-cancelclassification
     */
    CancelClassification() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * Enumerates the properties of the specified file.
     * @param {BSTR} filePath The file that contains the properties that you want to enumerate. You must specify an absolute path to the 
     *       file. You cannot specify a file share.
     * @param {Integer} options The option to use for enumerating the file's properties. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmgetfilepropertyoptions">FsrmGetFilePropertyOptions</a> enumeration.
     * @returns {IFsrmCollection} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nn-fsrm-ifsrmcollection">IFsrmCollection</a> interface that contains a 
     *       collection of file properties. Each item in the collection is a <b>VARIANT</b> of type 
     *       <b>VT_DISPATCH</b>. Query the <b>pdispVal</b> member of the variant for 
     *       the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmproperty">IFsrmProperty</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enumfileproperties
     */
    EnumFileProperties(filePath, options) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath

        result := ComCall(30, this, "ptr", filePath, "int", options, "ptr*", &fileProperties := 0, "HRESULT")
        return IFsrmCollection(fileProperties)
    }

    /**
     * Retrieves the specified property from the file or folder.
     * @param {BSTR} filePath The file that contains the property that you want to retrieve. You must specify an absolute path to the 
     *       file. You cannot specify a file share.
     * @param {BSTR} propertyName The name of the property to retrieve. Must not exceed 100 characters in length.
     * @param {Integer} options The option to use for retrieving the file's property. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmgetfilepropertyoptions">FsrmGetFilePropertyOptions</a> enumeration.
     * @returns {IFsrmProperty} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmproperty">IFsrmProperty</a> interface to  the retrieved 
     *       property.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-getfileproperty
     */
    GetFileProperty(filePath, propertyName, options) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(31, this, "ptr", filePath, "ptr", propertyName, "int", options, "ptr*", &property := 0, "HRESULT")
        return IFsrmProperty(property)
    }

    /**
     * Sets the value of the specified property in the file or folder.
     * @param {BSTR} filePath The file that contains the property that you want to set. You must specify an absolute path to the file. You 
     *       cannot specify a file share.
     * @param {BSTR} propertyName The name of the property whose value you want to set.
     * @param {BSTR} propertyValue The value to set the specified property to.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-setfileproperty
     */
    SetFileProperty(filePath, propertyName, propertyValue) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName
        propertyValue := propertyValue is String ? BSTR.Alloc(propertyValue).Value : propertyValue

        result := ComCall(32, this, "ptr", filePath, "ptr", propertyName, "ptr", propertyValue, "HRESULT")
        return result
    }

    /**
     * Attempts to remove the specified property from the file or folder.
     * @param {BSTR} filePath The file that contains the property that you want to remove. You must specify an absolute path to the file. 
     *       You cannot specify a file share.
     * @param {BSTR} property The name of the property to remove from the file.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-clearfileproperty
     */
    ClearFileProperty(filePath, property) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        property := property is String ? BSTR.Alloc(property).Value : property

        result := ComCall(33, this, "ptr", filePath, "ptr", property, "HRESULT")
        return result
    }
}

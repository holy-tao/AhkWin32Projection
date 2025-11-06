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
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-get_classificationreportformats
     */
    get_ClassificationReportFormats() {
        result := ComCall(7, this, "ptr*", &formats := 0, "HRESULT")
        return formats
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} formats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-put_classificationreportformats
     */
    put_ClassificationReportFormats(formats) {
        result := ComCall(8, this, "ptr", formats, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-get_logging
     */
    get_Logging() {
        result := ComCall(9, this, "int*", &logging := 0, "HRESULT")
        return logging
    }

    /**
     * 
     * @param {Integer} logging 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-put_logging
     */
    put_Logging(logging) {
        result := ComCall(10, this, "int", logging, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-get_classificationreportmailto
     */
    get_ClassificationReportMailTo() {
        mailTo := BSTR()
        result := ComCall(11, this, "ptr", mailTo, "HRESULT")
        return mailTo
    }

    /**
     * 
     * @param {BSTR} mailTo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-put_classificationreportmailto
     */
    put_ClassificationReportMailTo(mailTo) {
        mailTo := mailTo is String ? BSTR.Alloc(mailTo).Value : mailTo

        result := ComCall(12, this, "ptr", mailTo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-get_classificationreportenabled
     */
    get_ClassificationReportEnabled() {
        result := ComCall(13, this, "short*", &reportEnabled := 0, "HRESULT")
        return reportEnabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} reportEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-put_classificationreportenabled
     */
    put_ClassificationReportEnabled(reportEnabled) {
        result := ComCall(14, this, "short", reportEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-get_classificationlastreportpathwithoutextension
     */
    get_ClassificationLastReportPathWithoutExtension() {
        lastReportPath := BSTR()
        result := ComCall(15, this, "ptr", lastReportPath, "HRESULT")
        return lastReportPath
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-get_classificationlasterror
     */
    get_ClassificationLastError() {
        lastError := BSTR()
        result := ComCall(16, this, "ptr", lastError, "HRESULT")
        return lastError
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-get_classificationrunningstatus
     */
    get_ClassificationRunningStatus() {
        result := ComCall(17, this, "int*", &runningStatus := 0, "HRESULT")
        return runningStatus
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {IFsrmCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enumpropertydefinitions
     */
    EnumPropertyDefinitions(options) {
        result := ComCall(18, this, "int", options, "ptr*", &propertyDefinitions := 0, "HRESULT")
        return IFsrmCollection(propertyDefinitions)
    }

    /**
     * 
     * @returns {IFsrmPropertyDefinition} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-createpropertydefinition
     */
    CreatePropertyDefinition() {
        result := ComCall(19, this, "ptr*", &propertyDefinition := 0, "HRESULT")
        return IFsrmPropertyDefinition(propertyDefinition)
    }

    /**
     * 
     * @param {BSTR} propertyName 
     * @returns {IFsrmPropertyDefinition} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-getpropertydefinition
     */
    GetPropertyDefinition(propertyName) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(20, this, "ptr", propertyName, "ptr*", &propertyDefinition := 0, "HRESULT")
        return IFsrmPropertyDefinition(propertyDefinition)
    }

    /**
     * 
     * @param {Integer} ruleType 
     * @param {Integer} options 
     * @returns {IFsrmCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enumrules
     */
    EnumRules(ruleType, options) {
        result := ComCall(21, this, "int", ruleType, "int", options, "ptr*", &Rules := 0, "HRESULT")
        return IFsrmCollection(Rules)
    }

    /**
     * 
     * @param {Integer} ruleType 
     * @returns {IFsrmRule} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-createrule
     */
    CreateRule(ruleType) {
        result := ComCall(22, this, "int", ruleType, "ptr*", &Rule := 0, "HRESULT")
        return IFsrmRule(Rule)
    }

    /**
     * 
     * @param {BSTR} ruleName 
     * @param {Integer} ruleType 
     * @returns {IFsrmRule} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-getrule
     */
    GetRule(ruleName, ruleType) {
        ruleName := ruleName is String ? BSTR.Alloc(ruleName).Value : ruleName

        result := ComCall(23, this, "ptr", ruleName, "int", ruleType, "ptr*", &Rule := 0, "HRESULT")
        return IFsrmRule(Rule)
    }

    /**
     * 
     * @param {Integer} moduleType 
     * @param {Integer} options 
     * @returns {IFsrmCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enummoduledefinitions
     */
    EnumModuleDefinitions(moduleType, options) {
        result := ComCall(24, this, "int", moduleType, "int", options, "ptr*", &moduleDefinitions := 0, "HRESULT")
        return IFsrmCollection(moduleDefinitions)
    }

    /**
     * 
     * @param {Integer} moduleType 
     * @returns {IFsrmPipelineModuleDefinition} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-createmoduledefinition
     */
    CreateModuleDefinition(moduleType) {
        result := ComCall(25, this, "int", moduleType, "ptr*", &moduleDefinition := 0, "HRESULT")
        return IFsrmPipelineModuleDefinition(moduleDefinition)
    }

    /**
     * 
     * @param {BSTR} moduleName 
     * @param {Integer} moduleType 
     * @returns {IFsrmPipelineModuleDefinition} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-getmoduledefinition
     */
    GetModuleDefinition(moduleName, moduleType) {
        moduleName := moduleName is String ? BSTR.Alloc(moduleName).Value : moduleName

        result := ComCall(26, this, "ptr", moduleName, "int", moduleType, "ptr*", &moduleDefinition := 0, "HRESULT")
        return IFsrmPipelineModuleDefinition(moduleDefinition)
    }

    /**
     * 
     * @param {Integer} context 
     * @param {BSTR} reserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-runclassification
     */
    RunClassification(context, reserved) {
        reserved := reserved is String ? BSTR.Alloc(reserved).Value : reserved

        result := ComCall(27, this, "int", context, "ptr", reserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} waitSeconds 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-waitforclassificationcompletion
     */
    WaitForClassificationCompletion(waitSeconds) {
        result := ComCall(28, this, "int", waitSeconds, "short*", &completed := 0, "HRESULT")
        return completed
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-cancelclassification
     */
    CancelClassification() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} filePath 
     * @param {Integer} options 
     * @returns {IFsrmCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-enumfileproperties
     */
    EnumFileProperties(filePath, options) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath

        result := ComCall(30, this, "ptr", filePath, "int", options, "ptr*", &fileProperties := 0, "HRESULT")
        return IFsrmCollection(fileProperties)
    }

    /**
     * 
     * @param {BSTR} filePath 
     * @param {BSTR} propertyName 
     * @param {Integer} options 
     * @returns {IFsrmProperty} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-getfileproperty
     */
    GetFileProperty(filePath, propertyName, options) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(31, this, "ptr", filePath, "ptr", propertyName, "int", options, "ptr*", &property := 0, "HRESULT")
        return IFsrmProperty(property)
    }

    /**
     * 
     * @param {BSTR} filePath 
     * @param {BSTR} propertyName 
     * @param {BSTR} propertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-setfileproperty
     */
    SetFileProperty(filePath, propertyName, propertyValue) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName
        propertyValue := propertyValue is String ? BSTR.Alloc(propertyValue).Value : propertyValue

        result := ComCall(32, this, "ptr", filePath, "ptr", propertyName, "ptr", propertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} filePath 
     * @param {BSTR} property 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager-clearfileproperty
     */
    ClearFileProperty(filePath, property) {
        filePath := filePath is String ? BSTR.Alloc(filePath).Value : filePath
        property := property is String ? BSTR.Alloc(property).Value : property

        result := ComCall(33, this, "ptr", filePath, "ptr", property, "HRESULT")
        return result
    }
}

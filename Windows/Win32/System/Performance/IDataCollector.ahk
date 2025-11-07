#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDataCollectorSet.ahk
#Include .\IValueMap.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Sets and retrieves collector properties using XML, specifies the log file name, and retrieves the location of the log file.This interface is an abstract class from which the following data collectors derive:IAlertDataCollectorIApiTracingDataCollectorIConfigurationDataCollectorIPerformanceCounterDataCollectorITraceDataCollector
 * @remarks
 * 
 * The following example shows the XML that you can use to initialize this object if you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorcollection-createdatacollectorfromxml">IDataCollectorCollection::CreateDataCollectorFromXml</a> property to create one of the derived data collectors. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_xml">IDataCollector::Xml</a> property also returns this XML.
 * 
 * 
 * ```xml
 * 
 *     <FileName/>
 *     <FileNameFormat/>
 *     <FileNameFormatPattern/>
 *     <Index/>
 *     <LatestOutputLocation/>
 *     <LogAppend/>
 *     <LogCircular/>
 *     <LogOverwrite/>
 *     <Name/>
 *     <OutputLocation/>
 * 
 * ```
 * 
 * 
 * Note that the example does not show the property elements of the derived data collector (see each data collector for its XML elements). Include these elements in the data collectors XML as appropriate. The following example shows the XML for the alert data collector. You can specify the elements in any order.
 * 
 * 
 * ```xml
 * <AlertDataCollector>
 *     <FileName/>
 *     <FileNameFormat/>
 *     <FileNameFormatPattern/>
 *     <Index/>
 *     <LatestOutputLocation/>
 *     <LogAppend/>
 *     <LogCircular/>
 *     <LogOverwrite/>
 *     <Name/>
 *     <OutputLocation/>
 *     <Alert/>  <!-- Specify an <Alert> element for each alert -->
 *     <EventLog/>
 *     <SampleInterval/>
 *     <Task/>
 *     <TaskArguments/>
 *     <TaskUserTextArguments/>
 *     <TaskSetWorkingDirectory/>
 *     <TriggerDataCollectorSet/>
 * </AlertDataCollector>
 * ```
 * 
 * 
 * When you specify the XML to create the collector, you can specify only the elements for the properties that you want to set. If you do not specify a property, PLA provides a default value. When you retrieve the XML for the collector, the XML provides all elements, including those from <b>IDataCollector</b>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-idatacollector
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class IDataCollector extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataCollector
     * @type {Guid}
     */
    static IID => Guid("{038374ff-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataCollectorSet", "put_DataCollectorSet", "get_DataCollectorType", "get_FileName", "put_FileName", "get_FileNameFormat", "put_FileNameFormat", "get_FileNameFormatPattern", "put_FileNameFormatPattern", "get_LatestOutputLocation", "put_LatestOutputLocation", "get_LogAppend", "put_LogAppend", "get_LogCircular", "put_LogCircular", "get_LogOverwrite", "put_LogOverwrite", "get_Name", "put_Name", "get_OutputLocation", "get_Index", "put_Index", "get_Xml", "SetXml", "CreateOutputLocation"]

    /**
     * 
     * @returns {IDataCollectorSet} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_datacollectorset
     */
    get_DataCollectorSet() {
        result := ComCall(7, this, "ptr*", &group := 0, "HRESULT")
        return IDataCollectorSet(group)
    }

    /**
     * 
     * @param {IDataCollectorSet} group 
     * @returns {HRESULT} 
     */
    put_DataCollectorSet(group) {
        result := ComCall(8, this, "ptr", group, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_datacollectortype
     */
    get_DataCollectorType() {
        result := ComCall(9, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_filename
     */
    get_FileName() {
        name := BSTR()
        result := ComCall(10, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_filename
     */
    put_FileName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(11, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_filenameformat
     */
    get_FileNameFormat() {
        result := ComCall(12, this, "int*", &format := 0, "HRESULT")
        return format
    }

    /**
     * 
     * @param {Integer} format 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_filenameformat
     */
    put_FileNameFormat(format) {
        result := ComCall(13, this, "int", format, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_filenameformatpattern
     */
    get_FileNameFormatPattern() {
        pattern := BSTR()
        result := ComCall(14, this, "ptr", pattern, "HRESULT")
        return pattern
    }

    /**
     * 
     * @param {BSTR} pattern 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_filenameformatpattern
     */
    put_FileNameFormatPattern(pattern) {
        pattern := pattern is String ? BSTR.Alloc(pattern).Value : pattern

        result := ComCall(15, this, "ptr", pattern, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_latestoutputlocation
     */
    get_LatestOutputLocation() {
        path := BSTR()
        result := ComCall(16, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_latestoutputlocation
     */
    put_LatestOutputLocation(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(17, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_logappend
     */
    get_LogAppend() {
        result := ComCall(18, this, "short*", &append := 0, "HRESULT")
        return append
    }

    /**
     * 
     * @param {VARIANT_BOOL} append 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_logappend
     */
    put_LogAppend(append) {
        result := ComCall(19, this, "short", append, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_logcircular
     */
    get_LogCircular() {
        result := ComCall(20, this, "short*", &circular := 0, "HRESULT")
        return circular
    }

    /**
     * 
     * @param {VARIANT_BOOL} circular 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_logcircular
     */
    put_LogCircular(circular) {
        result := ComCall(21, this, "short", circular, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_logoverwrite
     */
    get_LogOverwrite() {
        result := ComCall(22, this, "short*", &overwrite := 0, "HRESULT")
        return overwrite
    }

    /**
     * 
     * @param {VARIANT_BOOL} overwrite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_logoverwrite
     */
    put_LogOverwrite(overwrite) {
        result := ComCall(23, this, "short", overwrite, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(24, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(25, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_outputlocation
     */
    get_OutputLocation() {
        path := BSTR()
        result := ComCall(26, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_index
     */
    get_Index() {
        result := ComCall(27, this, "int*", &index := 0, "HRESULT")
        return index
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    put_Index(index) {
        result := ComCall(28, this, "int", index, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_xml
     */
    get_Xml() {
        Xml := BSTR()
        result := ComCall(29, this, "ptr", Xml, "HRESULT")
        return Xml
    }

    /**
     * 
     * @param {BSTR} Xml 
     * @returns {IValueMap} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-setxml
     */
    SetXml(Xml) {
        Xml := Xml is String ? BSTR.Alloc(Xml).Value : Xml

        result := ComCall(30, this, "ptr", Xml, "ptr*", &Validation := 0, "HRESULT")
        return IValueMap(Validation)
    }

    /**
     * 
     * @param {VARIANT_BOOL} Latest 
     * @returns {BSTR} 
     */
    CreateOutputLocation(Latest) {
        Location := BSTR()
        result := ComCall(31, this, "short", Latest, "ptr", Location, "HRESULT")
        return Location
    }
}

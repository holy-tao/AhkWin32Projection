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
     * @type {IDataCollectorSet} 
     */
    DataCollectorSet {
        get => this.get_DataCollectorSet()
        set => this.put_DataCollectorSet(value)
    }

    /**
     * @type {Integer} 
     */
    DataCollectorType {
        get => this.get_DataCollectorType()
    }

    /**
     * @type {BSTR} 
     */
    FileName {
        get => this.get_FileName()
        set => this.put_FileName(value)
    }

    /**
     * @type {Integer} 
     */
    FileNameFormat {
        get => this.get_FileNameFormat()
        set => this.put_FileNameFormat(value)
    }

    /**
     * @type {BSTR} 
     */
    FileNameFormatPattern {
        get => this.get_FileNameFormatPattern()
        set => this.put_FileNameFormatPattern(value)
    }

    /**
     * @type {BSTR} 
     */
    LatestOutputLocation {
        get => this.get_LatestOutputLocation()
        set => this.put_LatestOutputLocation(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    LogAppend {
        get => this.get_LogAppend()
        set => this.put_LogAppend(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    LogCircular {
        get => this.get_LogCircular()
        set => this.put_LogCircular(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    LogOverwrite {
        get => this.get_LogOverwrite()
        set => this.put_LogOverwrite(value)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    OutputLocation {
        get => this.get_OutputLocation()
    }

    /**
     * @type {Integer} 
     */
    Index {
        get => this.get_Index()
        set => this.put_Index(value)
    }

    /**
     * @type {BSTR} 
     */
    Xml {
        get => this.get_Xml()
    }

    /**
     * Retrieves the data collector set to which this data collector belongs.
     * @returns {IDataCollectorSet} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-get_datacollectorset
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
     * Retrieves the type of this data collector, for example, a performance data collector.
     * @remarks
     * 
     * PLA sets the type when you create the data collector.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-get_datacollectortype
     */
    get_DataCollectorType() {
        result := ComCall(9, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * Retrieves or sets the base name of the file that will contain the data collector data.
     * @remarks
     * 
     * The actual file name used could be different if you specified formatting options in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_filenameformat">IDataCollector::FileNameFormat</a> property. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_latestoutputlocation">IDataCollector::LatestOutputLocation</a> property contains the actual file name used. 
     * 
     * Do not include the path in the file name; the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_rootpath">IDataCollectorSet::RootPath</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_subdirectory">IDataCollectorSet::Subdirectory</a> properties determine the path to the file.
     * 
     * The file name extension that you specify depends on the type of data collector. The following table shows the correct extension to use for each data collector. If you specify a different extension, PLA will use it. If you do not specify an extension, PLA adds the correct extension to the file. 
     * 
     * <table>
     * <tr>
     * <th>Data collector type</th>
     * <th>Extension to use</th>
     * </tr>
     * <tr>
     * <td>Configuration data collectors</td>
     * <td>.xml</td>
     * </tr>
     * <tr>
     * <td>Performance data collectors</td>
     * <td>Can be .blg, .csv, or .tsv depending on the value of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-iperformancecounterdatacollector-get_logfileformat">IPerformanceCounterDataCollector::LogFileFormat</a> property. </td>
     * </tr>
     * <tr>
     * <td>Trace data collectors</td>
     * <td>.etl</td>
     * </tr>
     * </table>
     *  
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logappend">IDataCollector::LogAppend</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logoverwrite">IDataCollector::LogOverwrite</a> properties determine the action taken if the file already exists.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-get_filename
     */
    get_FileName() {
        name := BSTR()
        result := ComCall(10, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Retrieves or sets the base name of the file that will contain the data collector data.
     * @remarks
     * 
     * The actual file name used could be different if you specified formatting options in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_filenameformat">IDataCollector::FileNameFormat</a> property. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_latestoutputlocation">IDataCollector::LatestOutputLocation</a> property contains the actual file name used. 
     * 
     * Do not include the path in the file name; the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_rootpath">IDataCollectorSet::RootPath</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_subdirectory">IDataCollectorSet::Subdirectory</a> properties determine the path to the file.
     * 
     * The file name extension that you specify depends on the type of data collector. The following table shows the correct extension to use for each data collector. If you specify a different extension, PLA will use it. If you do not specify an extension, PLA adds the correct extension to the file. 
     * 
     * <table>
     * <tr>
     * <th>Data collector type</th>
     * <th>Extension to use</th>
     * </tr>
     * <tr>
     * <td>Configuration data collectors</td>
     * <td>.xml</td>
     * </tr>
     * <tr>
     * <td>Performance data collectors</td>
     * <td>Can be .blg, .csv, or .tsv depending on the value of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-iperformancecounterdatacollector-get_logfileformat">IPerformanceCounterDataCollector::LogFileFormat</a> property. </td>
     * </tr>
     * <tr>
     * <td>Trace data collectors</td>
     * <td>.etl</td>
     * </tr>
     * </table>
     *  
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logappend">IDataCollector::LogAppend</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logoverwrite">IDataCollector::LogOverwrite</a> properties determine the action taken if the file already exists.
     * 
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-put_filename
     */
    put_FileName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(11, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets flags that describe how to decorate the file name.
     * @remarks
     * 
     * PLA appends the decoration to the file name. For example, if you specify <b>plaMonthDayHour</b>, PLA appends the current month, day, and hour values to the file name. If the file name is MyFile, the result could be MyFile110816.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-get_filenameformat
     */
    get_FileNameFormat() {
        result := ComCall(12, this, "int*", &format := 0, "HRESULT")
        return format
    }

    /**
     * Retrieves or sets flags that describe how to decorate the file name.
     * @remarks
     * 
     * PLA appends the decoration to the file name. For example, if you specify <b>plaMonthDayHour</b>, PLA appends the current month, day, and hour values to the file name. If the file name is MyFile, the result could be MyFile110816.
     * 
     * 
     * @param {Integer} format 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-put_filenameformat
     */
    put_FileNameFormat(format) {
        result := ComCall(13, this, "int", format, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the format pattern to use when decorating the file name.
     * @remarks
     * 
     * PLA uses the pattern only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_filenameformat">IDataCollector::FileNameFormat</a> property is set to <b>plaPattern</b>.
     * 
     * PLA appends the decoration to the file name. Use the following pattern characters to define your own pattern. For example, the pattern "MMMM d, yyyy \a\t h:mmTt" could yield "January 31, 2005 at 4:20AM". If the file name is MyFile, the decorated file name would be "MyFile January 31, 2005 at 4:20AM".
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
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-get_filenameformatpattern
     */
    get_FileNameFormatPattern() {
        pattern := BSTR()
        result := ComCall(14, this, "ptr", pattern, "HRESULT")
        return pattern
    }

    /**
     * Retrieves or sets the format pattern to use when decorating the file name.
     * @remarks
     * 
     * PLA uses the pattern only if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_filenameformat">IDataCollector::FileNameFormat</a> property is set to <b>plaPattern</b>.
     * 
     * PLA appends the decoration to the file name. Use the following pattern characters to define your own pattern. For example, the pattern "MMMM d, yyyy \a\t h:mmTt" could yield "January 31, 2005 at 4:20AM". If the file name is MyFile, the decorated file name would be "MyFile January 31, 2005 at 4:20AM".
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
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-put_filenameformatpattern
     */
    put_FileNameFormatPattern(pattern) {
        pattern := pattern is String ? BSTR.Alloc(pattern).Value : pattern

        result := ComCall(15, this, "ptr", pattern, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the fully decorated file name that PLA used the last time it created the file.
     * @remarks
     * 
     * Typically, you do not set this property. When the data collector starts, PLA sets this property using the value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_outputlocation">IDataCollector::OutputLocation</a> property.
     * 
     * You can set this property to empty if the file has been deleted.
     * 
     * For trace data collectors only, you can set this property to the name of the file to use. If it is not set, PLA creates it as it would for any other data collector.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-get_latestoutputlocation
     */
    get_LatestOutputLocation() {
        path := BSTR()
        result := ComCall(16, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * Retrieves or sets the fully decorated file name that PLA used the last time it created the file.
     * @remarks
     * 
     * Typically, you do not set this property. When the data collector starts, PLA sets this property using the value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_outputlocation">IDataCollector::OutputLocation</a> property.
     * 
     * You can set this property to empty if the file has been deleted.
     * 
     * For trace data collectors only, you can set this property to the name of the file to use. If it is not set, PLA creates it as it would for any other data collector.
     * 
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-put_latestoutputlocation
     */
    put_LatestOutputLocation(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(17, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that indicates if PLA should append the collected data to the current file.
     * @remarks
     * 
     * A validation error occurs if this property conflicts with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logcircular">IDataCollector::LogCircular</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logoverwrite">IDataCollector::LogOverwrite</a> properties.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-get_logappend
     */
    get_LogAppend() {
        result := ComCall(18, this, "short*", &append := 0, "HRESULT")
        return append
    }

    /**
     * Retrieves or sets a value that indicates if PLA should append the collected data to the current file.
     * @remarks
     * 
     * A validation error occurs if this property conflicts with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logcircular">IDataCollector::LogCircular</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logoverwrite">IDataCollector::LogOverwrite</a> properties.
     * 
     * 
     * @param {VARIANT_BOOL} append 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-put_logappend
     */
    put_LogAppend(append) {
        result := ComCall(19, this, "short", append, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that indicates if PLA should create a circular file.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-get_logcircular
     */
    get_LogCircular() {
        result := ComCall(20, this, "short*", &circular := 0, "HRESULT")
        return circular
    }

    /**
     * Retrieves or sets a value that indicates if PLA should create a circular file.
     * @param {VARIANT_BOOL} circular 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-put_logcircular
     */
    put_LogCircular(circular) {
        result := ComCall(21, this, "short", circular, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that indicates if PLA should overwrite the current file.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-get_logoverwrite
     */
    get_LogOverwrite() {
        result := ComCall(22, this, "short*", &overwrite := 0, "HRESULT")
        return overwrite
    }

    /**
     * Retrieves or sets a value that indicates if PLA should overwrite the current file.
     * @param {VARIANT_BOOL} overwrite 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-put_logoverwrite
     */
    put_LogOverwrite(overwrite) {
        result := ComCall(23, this, "short", overwrite, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the name of the data collector.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(24, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Retrieves or sets the name of the data collector.
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(25, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Retrieves the decorated file name if PLA were to create it now.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_latestoutputlocation">IDataCollector::LatestOutputLocation</a> property contains the decorated file name used the last time the collector ran.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-get_outputlocation
     */
    get_OutputLocation() {
        path := BSTR()
        result := ComCall(26, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * Retrieves the index value of the data collector. The index value identifies the data collector within the data collector set.
     * @remarks
     * 
     * PLA sets the index value when you add the data collector to a data collector set.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-get_index
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
     * Retrieves an XML string that describes the values of the data collector properties.
     * @remarks
     * 
     * For details on the property elements contained in the XML string, see the Remarks section of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-get_xml
     */
    get_Xml() {
        Xml := BSTR()
        result := ComCall(29, this, "ptr", Xml, "HRESULT")
        return Xml
    }

    /**
     * Sets the property values of those properties included in the XML.
     * @param {BSTR} Xml XML that contains the collector properties to set. For details on specifying the XML string, see the Remarks section of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a>.
     * @returns {IValueMap} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemap">IValueMap</a> interface that you use to retrieve the validation error of each property whose value is not valid. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_count">IValueMap::Count</a> property is zero if there were no errors.
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-idatacollector-setxml
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

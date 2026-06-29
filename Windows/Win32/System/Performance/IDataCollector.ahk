#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\AutoPathFormat.ahk" { AutoPathFormat }
#Import ".\DataCollectorType.ahk" { DataCollectorType }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IValueMap.ahk" { IValueMap }
#Import ".\IDataCollectorSet.ahk" { IDataCollectorSet }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Sets and retrieves collector properties using XML, specifies the log file name, and retrieves the location of the log file.This interface is an abstract class from which the following data collectors derive:IAlertDataCollectorIApiTracingDataCollectorIConfigurationDataCollectorIPerformanceCounterDataCollectorITraceDataCollector
 * @remarks
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
 *     <tr>
 * </AlertDataCollector>
 * ```
 * 
 * 
 * When you specify the XML to create the collector, you can specify only the elements for the properties that you want to set. If you do not specify a property, PLA provides a default value. When you retrieve the XML for the collector, the XML provides all elements, including those from <b>IDataCollector</b>.
 * @see https://learn.microsoft.com/windows/win32/api/pla/nn-pla-idatacollector
 * @namespace Windows.Win32.System.Performance
 */
export default struct IDataCollector extends IDispatch {
    /**
     * The interface identifier for IDataCollector
     * @type {Guid}
     */
    static IID := Guid("{038374ff-098b-11d8-9414-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDataCollector interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DataCollectorSet      : IntPtr
        put_DataCollectorSet      : IntPtr
        get_DataCollectorType     : IntPtr
        get_FileName              : IntPtr
        put_FileName              : IntPtr
        get_FileNameFormat        : IntPtr
        put_FileNameFormat        : IntPtr
        get_FileNameFormatPattern : IntPtr
        put_FileNameFormatPattern : IntPtr
        get_LatestOutputLocation  : IntPtr
        put_LatestOutputLocation  : IntPtr
        get_LogAppend             : IntPtr
        put_LogAppend             : IntPtr
        get_LogCircular           : IntPtr
        put_LogCircular           : IntPtr
        get_LogOverwrite          : IntPtr
        put_LogOverwrite          : IntPtr
        get_Name                  : IntPtr
        put_Name                  : IntPtr
        get_OutputLocation        : IntPtr
        get_Index                 : IntPtr
        put_Index                 : IntPtr
        get_Xml                   : IntPtr
        SetXml                    : IntPtr
        CreateOutputLocation      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDataCollector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDataCollectorSet} 
     */
    DataCollectorSet {
        get => this.get_DataCollectorSet()
        set => this.put_DataCollectorSet(value)
    }

    /**
     * @type {DataCollectorType} 
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
     * @type {AutoPathFormat} 
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
     * Retrieves the type of this data collector, for example, a performance data collector.
     * @remarks
     * PLA sets the type when you create the data collector.
     * @returns {DataCollectorType} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_datacollectortype
     */
    get_DataCollectorType() {
        result := ComCall(9, this, "int*", &type := 0, "HRESULT")
        return type
    }

    /**
     * Retrieves or sets the base name of the file that will contain the data collector data. (Get)
     * @remarks
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_filename
     */
    get_FileName() {
        name := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * Retrieves or sets the base name of the file that will contain the data collector data. (Put)
     * @remarks
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
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_filename
     */
    put_FileName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(11, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets flags that describe how to decorate the file name. (Get)
     * @remarks
     * PLA appends the decoration to the file name. For example, if you specify <b>plaMonthDayHour</b>, PLA appends the current month, day, and hour values to the file name. If the file name is MyFile, the result could be MyFile110816.
     * @returns {AutoPathFormat} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_filenameformat
     */
    get_FileNameFormat() {
        result := ComCall(12, this, "int*", &format := 0, "HRESULT")
        return format
    }

    /**
     * Retrieves or sets flags that describe how to decorate the file name. (Put)
     * @remarks
     * PLA appends the decoration to the file name. For example, if you specify <b>plaMonthDayHour</b>, PLA appends the current month, day, and hour values to the file name. If the file name is MyFile, the result could be MyFile110816.
     * @param {AutoPathFormat} format 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_filenameformat
     */
    put_FileNameFormat(format) {
        result := ComCall(13, this, AutoPathFormat, format, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the format pattern to use when decorating the file name. (Get)
     * @remarks
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_filenameformatpattern
     */
    get_FileNameFormatPattern() {
        pattern := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pattern, "HRESULT")
        return pattern
    }

    /**
     * Retrieves or sets the format pattern to use when decorating the file name. (Put)
     * @remarks
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
     * @param {BSTR} pattern 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_filenameformatpattern
     */
    put_FileNameFormatPattern(pattern) {
        pattern := pattern is String ? BSTR.Alloc(pattern).Value : pattern

        result := ComCall(15, this, BSTR, pattern, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the fully decorated file name that PLA used the last time it created the file. (IDataCollector.get_LatestOutputLocation)
     * @remarks
     * Typically, you do not set this property. When the data collector starts, PLA sets this property using the value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_outputlocation">IDataCollector::OutputLocation</a> property.
     * 
     * You can set this property to empty if the file has been deleted.
     * 
     * For trace data collectors only, you can set this property to the name of the file to use. If it is not set, PLA creates it as it would for any other data collector.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_latestoutputlocation
     */
    get_LatestOutputLocation() {
        _path := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, _path, "HRESULT")
        return _path
    }

    /**
     * Retrieves or sets the fully decorated file name that PLA used the last time it created the file. (IDataCollector.put_LatestOutputLocation)
     * @remarks
     * Typically, you do not set this property. When the data collector starts, PLA sets this property using the value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_outputlocation">IDataCollector::OutputLocation</a> property.
     * 
     * You can set this property to empty if the file has been deleted.
     * 
     * For trace data collectors only, you can set this property to the name of the file to use. If it is not set, PLA creates it as it would for any other data collector.
     * @param {BSTR} _path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_latestoutputlocation
     */
    put_LatestOutputLocation(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(17, this, BSTR, _path, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that indicates if PLA should append the collected data to the current file. (Get)
     * @remarks
     * A validation error occurs if this property conflicts with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logcircular">IDataCollector::LogCircular</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logoverwrite">IDataCollector::LogOverwrite</a> properties.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_logappend
     */
    get_LogAppend() {
        result := ComCall(18, this, VARIANT_BOOL.Ptr, &append := 0, "HRESULT")
        return append
    }

    /**
     * Retrieves or sets a value that indicates if PLA should append the collected data to the current file. (Put)
     * @remarks
     * A validation error occurs if this property conflicts with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logcircular">IDataCollector::LogCircular</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logoverwrite">IDataCollector::LogOverwrite</a> properties.
     * @param {VARIANT_BOOL} append 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_logappend
     */
    put_LogAppend(append) {
        result := ComCall(19, this, VARIANT_BOOL, append, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that indicates if PLA should create a circular file. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_logcircular
     */
    get_LogCircular() {
        result := ComCall(20, this, VARIANT_BOOL.Ptr, &circular := 0, "HRESULT")
        return circular
    }

    /**
     * Retrieves or sets a value that indicates if PLA should create a circular file. (Put)
     * @param {VARIANT_BOOL} circular 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_logcircular
     */
    put_LogCircular(circular) {
        result := ComCall(21, this, VARIANT_BOOL, circular, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that indicates if PLA should overwrite the current file. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_logoverwrite
     */
    get_LogOverwrite() {
        result := ComCall(22, this, VARIANT_BOOL.Ptr, &overwrite := 0, "HRESULT")
        return overwrite
    }

    /**
     * Retrieves or sets a value that indicates if PLA should overwrite the current file. (Put)
     * @param {VARIANT_BOOL} overwrite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_logoverwrite
     */
    put_LogOverwrite(overwrite) {
        result := ComCall(23, this, VARIANT_BOOL, overwrite, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the name of the data collector. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_name
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * Retrieves or sets the name of the data collector. (Put)
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(25, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * Retrieves the decorated file name if PLA were to create it now.
     * @remarks
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_latestoutputlocation">IDataCollector::LatestOutputLocation</a> property contains the decorated file name used the last time the collector ran.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_outputlocation
     */
    get_OutputLocation() {
        _path := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, _path, "HRESULT")
        return _path
    }

    /**
     * Retrieves the index value of the data collector. The index value identifies the data collector within the data collector set.
     * @remarks
     * PLA sets the index value when you add the data collector to a data collector set.
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
     * Retrieves an XML string that describes the values of the data collector properties.
     * @remarks
     * For details on the property elements contained in the XML string, see the Remarks section of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a>.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-get_xml
     */
    get_Xml() {
        Xml := BSTR.Owned()
        result := ComCall(29, this, BSTR.Ptr, Xml, "HRESULT")
        return Xml
    }

    /**
     * Sets the property values of those properties included in the XML. (IDataCollector.SetXml)
     * @remarks
     * If the XML syntax is valid, this API will return S_OK, even if one or more properties are not valid.  Those properties whose values are valid are set. Those properties whose values are not valid are set to their default value.
     * 
     * You can also initialize the collector properties by passing the XML to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorcollection-createdatacollectorfromxml">IDataCollectorCollection::CreateDataCollectorFromXml</a> property when you create the data collector.
     * 
     * The method fails if the collector element specified in the XML does not match the collector type of the interface.
     * 
     * To determine the errors that occurred, retrieve the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemapitem">IValueMapItem</a> interface for each error. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_key">IValueMapItem::Key</a> property contains the XPath of the element in error  (for example, /AlertDataCollector/TaskArguments), the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_value">IValueMapItem::Value</a> property contains the HRESULT associated with the error, and the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemapitem-get_description">IValueMapItem::Description</a> property contains the message text associated with the error.
     * 
     * Typically, any errors that occur will be one of the following HRESULT values.
     * 
     * <table>
     * <tr>
     * <th>Error</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>PLA_S_PROPERTY_IGNORED</td>
     * <td>PLA ignored the property element because the data collector does not contain the specified property.</td>
     * </tr>
     * <tr>
     * <td>PLA_E_PROPERTY_CONFLICT</td>
     * <td>The property conflicts with another property, for example, both <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logappend">LogAppend</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_logcircular">LogCircular</a> are VARIANT_TRUE.</td>
     * </tr>
     * </table>
     * @param {BSTR} Xml XML that contains the collector properties to set. For details on specifying the XML string, see the Remarks section of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a>.
     * @returns {IValueMap} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-ivaluemap">IValueMap</a> interface that you use to retrieve the validation error of each property whose value is not valid. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_count">IValueMap::Count</a> property is zero if there were no errors.
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-idatacollector-setxml
     */
    SetXml(Xml) {
        Xml := Xml is String ? BSTR.Alloc(Xml).Value : Xml

        result := ComCall(30, this, BSTR, Xml, "ptr*", &Validation := 0, "HRESULT")
        return IValueMap(Validation)
    }

    /**
     * 
     * @param {VARIANT_BOOL} Latest 
     * @returns {BSTR} 
     */
    CreateOutputLocation(Latest) {
        _Location := BSTR.Owned()
        result := ComCall(31, this, VARIANT_BOOL, Latest, BSTR.Ptr, _Location, "HRESULT")
        return _Location
    }

    Query(iid) {
        if (IDataCollector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DataCollectorSet := CallbackCreate(GetMethod(implObj, "get_DataCollectorSet"), flags, 2)
        this.vtbl.put_DataCollectorSet := CallbackCreate(GetMethod(implObj, "put_DataCollectorSet"), flags, 2)
        this.vtbl.get_DataCollectorType := CallbackCreate(GetMethod(implObj, "get_DataCollectorType"), flags, 2)
        this.vtbl.get_FileName := CallbackCreate(GetMethod(implObj, "get_FileName"), flags, 2)
        this.vtbl.put_FileName := CallbackCreate(GetMethod(implObj, "put_FileName"), flags, 2)
        this.vtbl.get_FileNameFormat := CallbackCreate(GetMethod(implObj, "get_FileNameFormat"), flags, 2)
        this.vtbl.put_FileNameFormat := CallbackCreate(GetMethod(implObj, "put_FileNameFormat"), flags, 2)
        this.vtbl.get_FileNameFormatPattern := CallbackCreate(GetMethod(implObj, "get_FileNameFormatPattern"), flags, 2)
        this.vtbl.put_FileNameFormatPattern := CallbackCreate(GetMethod(implObj, "put_FileNameFormatPattern"), flags, 2)
        this.vtbl.get_LatestOutputLocation := CallbackCreate(GetMethod(implObj, "get_LatestOutputLocation"), flags, 2)
        this.vtbl.put_LatestOutputLocation := CallbackCreate(GetMethod(implObj, "put_LatestOutputLocation"), flags, 2)
        this.vtbl.get_LogAppend := CallbackCreate(GetMethod(implObj, "get_LogAppend"), flags, 2)
        this.vtbl.put_LogAppend := CallbackCreate(GetMethod(implObj, "put_LogAppend"), flags, 2)
        this.vtbl.get_LogCircular := CallbackCreate(GetMethod(implObj, "get_LogCircular"), flags, 2)
        this.vtbl.put_LogCircular := CallbackCreate(GetMethod(implObj, "put_LogCircular"), flags, 2)
        this.vtbl.get_LogOverwrite := CallbackCreate(GetMethod(implObj, "get_LogOverwrite"), flags, 2)
        this.vtbl.put_LogOverwrite := CallbackCreate(GetMethod(implObj, "put_LogOverwrite"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_OutputLocation := CallbackCreate(GetMethod(implObj, "get_OutputLocation"), flags, 2)
        this.vtbl.get_Index := CallbackCreate(GetMethod(implObj, "get_Index"), flags, 2)
        this.vtbl.put_Index := CallbackCreate(GetMethod(implObj, "put_Index"), flags, 2)
        this.vtbl.get_Xml := CallbackCreate(GetMethod(implObj, "get_Xml"), flags, 2)
        this.vtbl.SetXml := CallbackCreate(GetMethod(implObj, "SetXml"), flags, 3)
        this.vtbl.CreateOutputLocation := CallbackCreate(GetMethod(implObj, "CreateOutputLocation"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DataCollectorSet)
        CallbackFree(this.vtbl.put_DataCollectorSet)
        CallbackFree(this.vtbl.get_DataCollectorType)
        CallbackFree(this.vtbl.get_FileName)
        CallbackFree(this.vtbl.put_FileName)
        CallbackFree(this.vtbl.get_FileNameFormat)
        CallbackFree(this.vtbl.put_FileNameFormat)
        CallbackFree(this.vtbl.get_FileNameFormatPattern)
        CallbackFree(this.vtbl.put_FileNameFormatPattern)
        CallbackFree(this.vtbl.get_LatestOutputLocation)
        CallbackFree(this.vtbl.put_LatestOutputLocation)
        CallbackFree(this.vtbl.get_LogAppend)
        CallbackFree(this.vtbl.put_LogAppend)
        CallbackFree(this.vtbl.get_LogCircular)
        CallbackFree(this.vtbl.put_LogCircular)
        CallbackFree(this.vtbl.get_LogOverwrite)
        CallbackFree(this.vtbl.put_LogOverwrite)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_OutputLocation)
        CallbackFree(this.vtbl.get_Index)
        CallbackFree(this.vtbl.put_Index)
        CallbackFree(this.vtbl.get_Xml)
        CallbackFree(this.vtbl.SetXml)
        CallbackFree(this.vtbl.CreateOutputLocation)
    }
}

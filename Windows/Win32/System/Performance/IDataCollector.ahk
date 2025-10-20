#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<IDataCollectorSet>} group 
     * @returns {HRESULT} 
     */
    get_DataCollectorSet(group) {
        result := ComCall(7, this, "ptr", group, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataCollectorSet>} group 
     * @returns {HRESULT} 
     */
    put_DataCollectorSet(group) {
        result := ComCall(8, this, "ptr", group, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} type 
     * @returns {HRESULT} 
     */
    get_DataCollectorType(type) {
        result := ComCall(9, this, "int*", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_FileName(name) {
        result := ComCall(10, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    put_FileName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(11, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} format 
     * @returns {HRESULT} 
     */
    get_FileNameFormat(format) {
        result := ComCall(12, this, "int*", format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    put_FileNameFormat(format) {
        result := ComCall(13, this, "int", format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pattern 
     * @returns {HRESULT} 
     */
    get_FileNameFormatPattern(pattern) {
        result := ComCall(14, this, "ptr", pattern, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pattern 
     * @returns {HRESULT} 
     */
    put_FileNameFormatPattern(pattern) {
        pattern := pattern is String ? BSTR.Alloc(pattern).Value : pattern

        result := ComCall(15, this, "ptr", pattern, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     */
    get_LatestOutputLocation(path) {
        result := ComCall(16, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @returns {HRESULT} 
     */
    put_LatestOutputLocation(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(17, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} append 
     * @returns {HRESULT} 
     */
    get_LogAppend(append) {
        result := ComCall(18, this, "ptr", append, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} append 
     * @returns {HRESULT} 
     */
    put_LogAppend(append) {
        result := ComCall(19, this, "short", append, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} circular 
     * @returns {HRESULT} 
     */
    get_LogCircular(circular) {
        result := ComCall(20, this, "ptr", circular, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} circular 
     * @returns {HRESULT} 
     */
    put_LogCircular(circular) {
        result := ComCall(21, this, "short", circular, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} overwrite 
     * @returns {HRESULT} 
     */
    get_LogOverwrite(overwrite) {
        result := ComCall(22, this, "ptr", overwrite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} overwrite 
     * @returns {HRESULT} 
     */
    put_LogOverwrite(overwrite) {
        result := ComCall(23, this, "short", overwrite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_Name(name) {
        result := ComCall(24, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(25, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     */
    get_OutputLocation(path) {
        result := ComCall(26, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} index 
     * @returns {HRESULT} 
     */
    get_Index(index) {
        result := ComCall(27, this, "int*", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    put_Index(index) {
        result := ComCall(28, this, "int", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Xml 
     * @returns {HRESULT} 
     */
    get_Xml(Xml) {
        result := ComCall(29, this, "ptr", Xml, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Xml 
     * @param {Pointer<IValueMap>} Validation 
     * @returns {HRESULT} 
     */
    SetXml(Xml, Validation) {
        Xml := Xml is String ? BSTR.Alloc(Xml).Value : Xml

        result := ComCall(30, this, "ptr", Xml, "ptr", Validation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Latest 
     * @param {Pointer<BSTR>} Location 
     * @returns {HRESULT} 
     */
    CreateOutputLocation(Latest, Location) {
        result := ComCall(31, this, "short", Latest, "ptr", Location, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

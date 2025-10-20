#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDataCollector.ahk

/**
 * Logs Win32 calls to Kernel32.dll, Advapi32.dll, Gdi32.dll, and User32.dll.
 * @remarks
 * 
  * The following example shows the XML that you can use to initialize this object if you call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorcollection-createdatacollectorfromxml">CreateDataCollectorFromXml</a> to create it. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_xml">IDataCollector::Xml</a> property also returns this XML.
  * 
  * 
  * ```xml
  * <ApiTracingDataCollector>
  *     <ExcludeApis/>
  *     <ExePath/> 
  *     <IncludeApis/>
  *     <IncludeModules/>
  *     <LogApiNamesOnly/>
  *     <LogApisRecursively/>
  *     <LogFilePath/>
  * </ApiTracingDataCollector>
  * ```
  * 
  * 
  * Note that the example does not show the property elements inherited from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> that you also need to specify.
  * 
  * When you specify the XML to create the collector, you can specify only the elements for the properties that you want to set. If you do not specify a property, PLA provides a default value. When you retrieve the XML for the collector, the XML provides all elements, including those from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-iapitracingdatacollector
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class IApiTracingDataCollector extends IDataCollector{
    /**
     * The interface identifier for IApiTracingDataCollector
     * @type {Guid}
     */
    static IID => Guid("{0383751a-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} logapinames 
     * @returns {HRESULT} 
     */
    get_LogApiNamesOnly(logapinames) {
        result := ComCall(32, this, "ptr", logapinames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} logapinames 
     * @returns {HRESULT} 
     */
    put_LogApiNamesOnly(logapinames) {
        result := ComCall(33, this, "short", logapinames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} logrecursively 
     * @returns {HRESULT} 
     */
    get_LogApisRecursively(logrecursively) {
        result := ComCall(34, this, "ptr", logrecursively, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} logrecursively 
     * @returns {HRESULT} 
     */
    put_LogApisRecursively(logrecursively) {
        result := ComCall(35, this, "short", logrecursively, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} exepath 
     * @returns {HRESULT} 
     */
    get_ExePath(exepath) {
        result := ComCall(36, this, "ptr", exepath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} exepath 
     * @returns {HRESULT} 
     */
    put_ExePath(exepath) {
        exepath := exepath is String ? BSTR.Alloc(exepath).Value : exepath

        result := ComCall(37, this, "ptr", exepath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} logfilepath 
     * @returns {HRESULT} 
     */
    get_LogFilePath(logfilepath) {
        result := ComCall(38, this, "ptr", logfilepath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} logfilepath 
     * @returns {HRESULT} 
     */
    put_LogFilePath(logfilepath) {
        logfilepath := logfilepath is String ? BSTR.Alloc(logfilepath).Value : logfilepath

        result := ComCall(39, this, "ptr", logfilepath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} includemodules 
     * @returns {HRESULT} 
     */
    get_IncludeModules(includemodules) {
        result := ComCall(40, this, "ptr", includemodules, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} includemodules 
     * @returns {HRESULT} 
     */
    put_IncludeModules(includemodules) {
        result := ComCall(41, this, "ptr", includemodules, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} includeapis 
     * @returns {HRESULT} 
     */
    get_IncludeApis(includeapis) {
        result := ComCall(42, this, "ptr", includeapis, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} includeapis 
     * @returns {HRESULT} 
     */
    put_IncludeApis(includeapis) {
        result := ComCall(43, this, "ptr", includeapis, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} excludeapis 
     * @returns {HRESULT} 
     */
    get_ExcludeApis(excludeapis) {
        result := ComCall(44, this, "ptr", excludeapis, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} excludeapis 
     * @returns {HRESULT} 
     */
    put_ExcludeApis(excludeapis) {
        result := ComCall(45, this, "ptr", excludeapis, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LogApiNamesOnly", "put_LogApiNamesOnly", "get_LogApisRecursively", "put_LogApisRecursively", "get_ExePath", "put_ExePath", "get_LogFilePath", "put_LogFilePath", "get_IncludeModules", "put_IncludeModules", "get_IncludeApis", "put_IncludeApis", "get_ExcludeApis", "put_ExcludeApis"]

    /**
     * @type {VARIANT_BOOL} 
     */
    LogApiNamesOnly {
        get => this.get_LogApiNamesOnly()
        set => this.put_LogApiNamesOnly(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    LogApisRecursively {
        get => this.get_LogApisRecursively()
        set => this.put_LogApisRecursively(value)
    }

    /**
     * @type {BSTR} 
     */
    ExePath {
        get => this.get_ExePath()
        set => this.put_ExePath(value)
    }

    /**
     * @type {BSTR} 
     */
    LogFilePath {
        get => this.get_LogFilePath()
        set => this.put_LogFilePath(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    IncludeModules {
        get => this.get_IncludeModules()
        set => this.put_IncludeModules(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    IncludeApis {
        get => this.get_IncludeApis()
        set => this.put_IncludeApis(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    ExcludeApis {
        get => this.get_ExcludeApis()
        set => this.put_ExcludeApis(value)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-get_logapinamesonly
     */
    get_LogApiNamesOnly() {
        result := ComCall(32, this, "short*", &logapinames := 0, "HRESULT")
        return logapinames
    }

    /**
     * 
     * @param {VARIANT_BOOL} logapinames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-put_logapinamesonly
     */
    put_LogApiNamesOnly(logapinames) {
        result := ComCall(33, this, "short", logapinames, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-get_logapisrecursively
     */
    get_LogApisRecursively() {
        result := ComCall(34, this, "short*", &logrecursively := 0, "HRESULT")
        return logrecursively
    }

    /**
     * 
     * @param {VARIANT_BOOL} logrecursively 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-put_logapisrecursively
     */
    put_LogApisRecursively(logrecursively) {
        result := ComCall(35, this, "short", logrecursively, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-get_exepath
     */
    get_ExePath() {
        exepath := BSTR()
        result := ComCall(36, this, "ptr", exepath, "HRESULT")
        return exepath
    }

    /**
     * 
     * @param {BSTR} exepath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-put_exepath
     */
    put_ExePath(exepath) {
        exepath := exepath is String ? BSTR.Alloc(exepath).Value : exepath

        result := ComCall(37, this, "ptr", exepath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-get_logfilepath
     */
    get_LogFilePath() {
        logfilepath := BSTR()
        result := ComCall(38, this, "ptr", logfilepath, "HRESULT")
        return logfilepath
    }

    /**
     * 
     * @param {BSTR} logfilepath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-put_logfilepath
     */
    put_LogFilePath(logfilepath) {
        logfilepath := logfilepath is String ? BSTR.Alloc(logfilepath).Value : logfilepath

        result := ComCall(39, this, "ptr", logfilepath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-get_includemodules
     */
    get_IncludeModules() {
        result := ComCall(40, this, "ptr*", &includemodules := 0, "HRESULT")
        return includemodules
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} includemodules 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-put_includemodules
     */
    put_IncludeModules(includemodules) {
        result := ComCall(41, this, "ptr", includemodules, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-get_includeapis
     */
    get_IncludeApis() {
        result := ComCall(42, this, "ptr*", &includeapis := 0, "HRESULT")
        return includeapis
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} includeapis 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-put_includeapis
     */
    put_IncludeApis(includeapis) {
        result := ComCall(43, this, "ptr", includeapis, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-get_excludeapis
     */
    get_ExcludeApis() {
        result := ComCall(44, this, "ptr*", &excludeapis := 0, "HRESULT")
        return excludeapis
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} excludeapis 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-put_excludeapis
     */
    put_ExcludeApis(excludeapis) {
        result := ComCall(45, this, "ptr", excludeapis, "HRESULT")
        return result
    }
}

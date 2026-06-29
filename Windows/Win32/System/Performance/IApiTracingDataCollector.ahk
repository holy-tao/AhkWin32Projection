#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IDataCollector.ahk" { IDataCollector }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Logs Win32 calls to Kernel32.dll, Advapi32.dll, Gdi32.dll, and User32.dll.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/pla/nn-pla-iapitracingdatacollector
 * @namespace Windows.Win32.System.Performance
 */
export default struct IApiTracingDataCollector extends IDataCollector {
    /**
     * The interface identifier for IApiTracingDataCollector
     * @type {Guid}
     */
    static IID := Guid("{0383751a-098b-11d8-9414-505054503030}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IApiTracingDataCollector interfaces
    */
    struct Vtbl extends IDataCollector.Vtbl {
        get_LogApiNamesOnly    : IntPtr
        put_LogApiNamesOnly    : IntPtr
        get_LogApisRecursively : IntPtr
        put_LogApisRecursively : IntPtr
        get_ExePath            : IntPtr
        put_ExePath            : IntPtr
        get_LogFilePath        : IntPtr
        put_LogFilePath        : IntPtr
        get_IncludeModules     : IntPtr
        put_IncludeModules     : IntPtr
        get_IncludeApis        : IntPtr
        put_IncludeApis        : IntPtr
        get_ExcludeApis        : IntPtr
        put_ExcludeApis        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IApiTracingDataCollector.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Retrieves or sets a value that indicates whether PLA logs only the function name. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-get_logapinamesonly
     */
    get_LogApiNamesOnly() {
        result := ComCall(32, this, VARIANT_BOOL.Ptr, &logapinames := 0, "HRESULT")
        return logapinames
    }

    /**
     * Retrieves or sets a value that indicates whether PLA logs only the function name. (Put)
     * @param {VARIANT_BOOL} logapinames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-put_logapinamesonly
     */
    put_LogApiNamesOnly(logapinames) {
        result := ComCall(33, this, VARIANT_BOOL, logapinames, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that indicates whether API tracing logs calls that are imported directly by the application. (Get)
     * @remarks
     * This property has meaning for x86 architectures only.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-get_logapisrecursively
     */
    get_LogApisRecursively() {
        result := ComCall(34, this, VARIANT_BOOL.Ptr, &logrecursively := 0, "HRESULT")
        return logrecursively
    }

    /**
     * Retrieves or sets a value that indicates whether API tracing logs calls that are imported directly by the application. (Put)
     * @remarks
     * This property has meaning for x86 architectures only.
     * @param {VARIANT_BOOL} logrecursively 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-put_logapisrecursively
     */
    put_LogApisRecursively(logrecursively) {
        result := ComCall(35, this, VARIANT_BOOL, logrecursively, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the path to the executable file whose API calls you want to trace. (Get)
     * @remarks
     * If the executable file is currently running, the trace occurs the next time the executable file runs, not at this time.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-get_exepath
     */
    get_ExePath() {
        exepath := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, exepath, "HRESULT")
        return exepath
    }

    /**
     * Retrieves or sets the path to the executable file whose API calls you want to trace. (Put)
     * @remarks
     * If the executable file is currently running, the trace occurs the next time the executable file runs, not at this time.
     * @param {BSTR} exepath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-put_exepath
     */
    put_ExePath(exepath) {
        exepath := exepath is String ? BSTR.Alloc(exepath).Value : exepath

        result := ComCall(37, this, BSTR, exepath, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the name of the log file that contains the API trace data. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-get_logfilepath
     */
    get_LogFilePath() {
        logfilepath := BSTR.Owned()
        result := ComCall(38, this, BSTR.Ptr, logfilepath, "HRESULT")
        return logfilepath
    }

    /**
     * Retrieves or sets the name of the log file that contains the API trace data. (Put)
     * @param {BSTR} logfilepath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-put_logfilepath
     */
    put_LogFilePath(logfilepath) {
        logfilepath := logfilepath is String ? BSTR.Alloc(logfilepath).Value : logfilepath

        result := ComCall(39, this, BSTR, logfilepath, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the list of modules to include in the trace. (Get)
     * @remarks
     * If you do not set this property, the trace will  include the following modules:
     * 
     * <ul>
     * <li>Advapi32.dll</li>
     * <li>Gdi32.dll</li>
     * <li>Kernel32.dll</li>
     * <li>User32.dll</li>
     * </ul>
     * This property  limits the  trace to a subset of those DLLs. For example, you can use this property to limit the trace to only Kernel32.dll and Advapi32.dll.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-get_includemodules
     */
    get_IncludeModules() {
        result := ComCall(40, this, "ptr*", &includemodules := 0, "HRESULT")
        return includemodules
    }

    /**
     * Retrieves or sets the list of modules to include in the trace. (Put)
     * @remarks
     * If you do not set this property, the trace will  include the following modules:
     * 
     * <ul>
     * <li>Advapi32.dll</li>
     * <li>Gdi32.dll</li>
     * <li>Kernel32.dll</li>
     * <li>User32.dll</li>
     * </ul>
     * This property  limits the  trace to a subset of those DLLs. For example, you can use this property to limit the trace to only Kernel32.dll and Advapi32.dll.
     * @param {Pointer<SAFEARRAY>} includemodules 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-put_includemodules
     */
    put_IncludeModules(includemodules) {
        result := ComCall(41, this, SAFEARRAY.Ptr, includemodules, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the list of functions to include in the trace. (Get)
     * @remarks
     * You can use this property to limit the functions that PLA logs to this list of functions only.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-get_includeapis
     */
    get_IncludeApis() {
        result := ComCall(42, this, "ptr*", &includeapis := 0, "HRESULT")
        return includeapis
    }

    /**
     * Retrieves or sets the list of functions to include in the trace. (Put)
     * @remarks
     * You can use this property to limit the functions that PLA logs to this list of functions only.
     * @param {Pointer<SAFEARRAY>} includeapis 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-put_includeapis
     */
    put_IncludeApis(includeapis) {
        result := ComCall(43, this, SAFEARRAY.Ptr, includeapis, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the list of functions to exclude from the trace. (Get)
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-get_excludeapis
     */
    get_ExcludeApis() {
        result := ComCall(44, this, "ptr*", &excludeapis := 0, "HRESULT")
        return excludeapis
    }

    /**
     * Retrieves or sets the list of functions to exclude from the trace. (Put)
     * @param {Pointer<SAFEARRAY>} excludeapis 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iapitracingdatacollector-put_excludeapis
     */
    put_ExcludeApis(excludeapis) {
        result := ComCall(45, this, SAFEARRAY.Ptr, excludeapis, "HRESULT")
        return result
    }

    Query(iid) {
        if (IApiTracingDataCollector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_LogApiNamesOnly := CallbackCreate(GetMethod(implObj, "get_LogApiNamesOnly"), flags, 2)
        this.vtbl.put_LogApiNamesOnly := CallbackCreate(GetMethod(implObj, "put_LogApiNamesOnly"), flags, 2)
        this.vtbl.get_LogApisRecursively := CallbackCreate(GetMethod(implObj, "get_LogApisRecursively"), flags, 2)
        this.vtbl.put_LogApisRecursively := CallbackCreate(GetMethod(implObj, "put_LogApisRecursively"), flags, 2)
        this.vtbl.get_ExePath := CallbackCreate(GetMethod(implObj, "get_ExePath"), flags, 2)
        this.vtbl.put_ExePath := CallbackCreate(GetMethod(implObj, "put_ExePath"), flags, 2)
        this.vtbl.get_LogFilePath := CallbackCreate(GetMethod(implObj, "get_LogFilePath"), flags, 2)
        this.vtbl.put_LogFilePath := CallbackCreate(GetMethod(implObj, "put_LogFilePath"), flags, 2)
        this.vtbl.get_IncludeModules := CallbackCreate(GetMethod(implObj, "get_IncludeModules"), flags, 2)
        this.vtbl.put_IncludeModules := CallbackCreate(GetMethod(implObj, "put_IncludeModules"), flags, 2)
        this.vtbl.get_IncludeApis := CallbackCreate(GetMethod(implObj, "get_IncludeApis"), flags, 2)
        this.vtbl.put_IncludeApis := CallbackCreate(GetMethod(implObj, "put_IncludeApis"), flags, 2)
        this.vtbl.get_ExcludeApis := CallbackCreate(GetMethod(implObj, "get_ExcludeApis"), flags, 2)
        this.vtbl.put_ExcludeApis := CallbackCreate(GetMethod(implObj, "put_ExcludeApis"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_LogApiNamesOnly)
        CallbackFree(this.vtbl.put_LogApiNamesOnly)
        CallbackFree(this.vtbl.get_LogApisRecursively)
        CallbackFree(this.vtbl.put_LogApisRecursively)
        CallbackFree(this.vtbl.get_ExePath)
        CallbackFree(this.vtbl.put_ExePath)
        CallbackFree(this.vtbl.get_LogFilePath)
        CallbackFree(this.vtbl.put_LogFilePath)
        CallbackFree(this.vtbl.get_IncludeModules)
        CallbackFree(this.vtbl.put_IncludeModules)
        CallbackFree(this.vtbl.get_IncludeApis)
        CallbackFree(this.vtbl.put_IncludeApis)
        CallbackFree(this.vtbl.get_ExcludeApis)
        CallbackFree(this.vtbl.put_ExcludeApis)
    }
}

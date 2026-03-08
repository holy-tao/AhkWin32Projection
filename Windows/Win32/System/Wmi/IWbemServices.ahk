#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWbemObjectSink.ahk
#Include .\IEnumWbemClassObject.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used by clients and providers to access WMI services. The interface is implemented by WMI and WMI providers, and is the primary WMI interface.
 * @remarks
 * Providers that implement the 
 * <b>IWbemServices</b> interface must follow the documented semantics of each method that they implement; and providers must support the specified error return codes. WMI implements all of the methods, and typically, each provider implements a small subset of the available functionality on the interface. Providers must return WBEM_E_PROVIDER_NOT_CAPABLE for any method that  they do not implement.
 * 
 * All outbound interface pointers from any 
 * <b>IWbemServices</b> method should be initialized to <b>NULL</b> before calling the interface method. For example, 
 * calls to the <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-getobject">IWbemServices::GetObject</a> method return an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> interface pointer that should be pre-initialized to <b>NULL</b> before the <b>IWbemServices::GetObject</b> method  call.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbemservices
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemServices
     * @type {Guid}
     */
    static IID => Guid("{9556dc99-828c-11cf-a37e-00aa003240c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenNamespace", "CancelAsyncCall", "QueryObjectSink", "GetObject", "GetObjectAsync", "PutClass", "PutClassAsync", "DeleteClass", "DeleteClassAsync", "CreateClassEnum", "CreateClassEnumAsync", "PutInstance", "PutInstanceAsync", "DeleteInstance", "DeleteInstanceAsync", "CreateInstanceEnum", "CreateInstanceEnumAsync", "ExecQuery", "ExecQueryAsync", "ExecNotificationQuery", "ExecNotificationQueryAsync", "ExecMethod", "ExecMethodAsync"]

    /**
     * The IWbemServices::OpenNamespace method provides the caller with a new IWbemServices pointer that has the specified child namespace as its operating context.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemlocator-connectserver">IWbemLocator::ConnectServer</a> method can also be used to open the same namespace. The only difference is that the 
     * <b>OpenNamespace</b> method allows you to place relative object paths in the <i>Namespace</i> parameter to open child namespaces recursively; 
     * <b>IWbemLocator::ConnectServer</b> requires a full object path. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/describing-a-wmi-namespace-object-path">Describing a WMI Namespace Object Path</a>.
     * 
     * For example, if the current namespace associated with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> interface pointer is root, then using Default in the <i>Namespace</i> parameter yields a new pointer bound to the root\default namespace.
     * 
     * The namespace is closed when <b>Release</b> is called and the reference count reaches 0 (zero).
     * @param {BSTR} strNamespace Path to the target namespace. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/creating-hierarchies-within-wmi">Creating Hierarchies within WMI</a>. This namespace can only be relative to the current namespace associated with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> interface pointer. This parameter cannot be an absolute path or <b>NULL</b>.
     * @param {Integer} lFlags This parameter can be set to 0 to make this a synchronous call. To make this a semisynchronous call, set <i>lFlags</i> to <b>WBEM_FLAG_RETURN_IMMEDIATELY</b>, provide a valid pointer for the <i>ppResult</i> parameter, and this call will return immediately. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @param {IWbemContext} pCtx Reserved. This parameter must be <b>NULL</b>.
     * @param {Pointer<IWbemServices>} ppWorkingNamespace Receives the object that represents the new namespace context. The returned pointer has a positive reference count. The caller must call <b>Release</b> on this pointer when it is no longer needed. This pointer is set to <b>NULL</b> when there are errors. If this parameter is specified, then <i>ppResult</i> must be <b>NULL</b>.
     * @param {Pointer<IWbemCallResult>} ppResult Typically <b>NULL</b>. If not <b>NULL</b>, then <i>ppWorkingNamespace</i> must be <b>NULL</b>. In this case, the parameter receives a pointer to a new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcallresult">IWbemCallResult</a> object. If the <i>lFlags</i> parameter is set to <b>WBEM_FLAG_RETURN_IMMEDIATELY</b> this call returns immediately. Then the caller can periodically poll the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemcallresult-getresultservices">IWbemCallResult::GetResultServices</a> method until the pointer for the requested namespace becomes available. This parameter is set to point to <b>NULL</b> when there is an error and a new object is not returned.
     * 
     * <div class="alert"><b>Note</b>  It is important to note that when you use this parameter, you must set <i>ppResult</i> to point to <b>NULL</b> before calling the method. This is a COM rule.</div>
     * <div> </div>
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * On failure, you can obtain any available information from the COM function <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>.
     * 
     * COM-specific error codes may also be returned if network problems cause you to lose the remote connection to Windows Management.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-opennamespace
     */
    OpenNamespace(strNamespace, lFlags, pCtx, ppWorkingNamespace, ppResult) {
        strNamespace := strNamespace is String ? BSTR.Alloc(strNamespace).Value : strNamespace

        result := ComCall(3, this, "ptr", strNamespace, "int", lFlags, "ptr", pCtx, "ptr*", ppWorkingNamespace, "ptr*", ppResult, "HRESULT")
        return result
    }

    /**
     * The IWbemServices::CancelAsyncCall method cancels any currently pending asynchronous calls based on the IWbemObjectSink pointer, which was originally passed to the asynchronous method.
     * @remarks
     * Because the call-back to the sink might not be returned at the same authentication level as the client requires, it is recommended that you use semisynchronous instead of asynchronous communication.  For more information, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>. Calling <b>CancelAsyncCall</b> from within an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a> can interfere with the WMI state and is not recommended.
     * 
     * In the case of a method call such as <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-execmethodasync">ExecMethodAsync</a>, only the client end of the call is canceled. The implementing provider is not  notified that the call was canceled and  runs to completion.
     * 
     * For more information on how to use asynchronous calls, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-an-asynchronous-call-with-c--">Making an Asynchronous Call with C++</a> and <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/receiving-asynchronous-event-notifications">Receiving Asynchronous Event Notifications</a>
     * @param {IWbemObjectSink} pSink Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a> implementation provided by the client to any of the asynchronous methods of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * On failure, you can obtain available information from the COM function <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>.
     * 
     * COM-specific error codes can also be returned if network problems cause you to lose the remote connection to Windows Management.
     * 
     * <div class="alert"><b>Note</b>  If 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">SetStatus</a> has not been called on the application's sink by the time WMI processes 
     * <b>CancelAsyncCall</b>, WMI calls 
     * <b>SetStatus</b> on that sink with <b>WBEM_E_CALL_CANCELLED</b> as the value for the <i>hResult</i> parameter.</div>
     * <div> </div>
     * Timing, and the nature of an asynchronous operation, can affect whether WMI is able to cancel the operation. Only lengthy queries are likely to be successfully canceled before they have completed. Faster operations, such as asynchronous deletions or modifications, typically complete before WMI can process a 
     * <b>CancelAsyncCall</b> call. So while 
     * <b>CancelAsyncCall</b> attempts to cancel the current operation, sometimes all that can be done is to release the 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a> pointer.
     * 
     * <div class="alert"><b>Note</b>  It is possible to make numerous asynchronous calls using the same object sink. In this case, the 
     * <b>CancelAsyncCall</b> method cancels all asynchronous calls sharing this object sink. It is strongly recommended that you create one instance of an object sink for each  outstanding asynchronous call.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-cancelasynccall
     */
    CancelAsyncCall(pSink) {
        result := ComCall(4, this, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * The IWbemServices::QueryObjectSink method allows the caller to obtain a notification handler that is exported by Windows Management.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @returns {IWbemObjectSink} Receives the interface pointer to the notification handler. This is set to point to <b>NULL</b> when there is an error. The returned pointer has a positive reference count, and the caller must call <b>IWbemServices::Release</b> on the pointer when it is no longer needed. A <b>NULL</b> value can be returned if no notification handler is available. This is not an error.
     * 
     * <div class="alert"><b>Note</b>  The value of the <i>ppResponseHandler</i> parameter cannot be <b>NULL</b> when it is passed to this method.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-queryobjectsink
     */
    QueryObjectSink(lFlags) {
        result := ComCall(5, this, "int", lFlags, "ptr*", &ppResponseHandler := 0, "HRESULT")
        return IWbemObjectSink(ppResponseHandler)
    }

    /**
     * The IWbemServices::GetObject method retrieves a class or instance. This method only retrieves objects from the namespace associated with the current IWbemServices object.
     * @param {BSTR} strObjectPath Path of the object to retrieve. If this is <b>NULL</b>, an empty object is returned that can become a new class. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/creating-a-class">Creating a Class</a>.
     * @param {Integer} lFlags The following flags affect the behavior of this method.
     * @param {IWbemContext} pCtx Typically <b>NULL</b>. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that may be used by the provider that is producing the requested class or instance. The values in the context object must be specified in the documentation for the provider in question. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {Pointer<IWbemClassObject>} ppObject If not <b>NULL</b>, this receives the object, if it is found. The returned object has a positive reference count. The caller must use <b>Release</b> when the object is no longer needed. In all cases of error, this parameter is set to point to <b>NULL</b>.
     * @param {Pointer<IWbemCallResult>} ppCallResult If <b>NULL</b>, this parameter is not used. If the <i>lFlags</i> parameter contains <b>WBEM_FLAG_RETURN_IMMEDIATELY</b>, this call returns immediately with <b>WBEM_S_NO_ERROR</b>. The <i>ppCallResult</i> parameter receives a pointer to a new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcallresult">IWbemCallResult</a> object, which can then be polled to obtain the result using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemcallresult-getcallstatus">GetCallStatus</a> method. The caller can call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemcallresult-getresultobject">IWbemCallResult::GetResultObject</a> to retrieve the object when it becomes available.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * On failure, you can obtain any available information from the COM function <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>.
     * 
     * COM-specific error codes also may be returned if network problems cause you to lose the remote connection to Windows Management.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-getobject
     */
    GetObject(strObjectPath, lFlags, pCtx, ppObject, ppCallResult) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath

        result := ComCall(6, this, "ptr", strObjectPath, "int", lFlags, "ptr", pCtx, "ptr*", ppObject, "ptr*", ppCallResult, "HRESULT")
        return result
    }

    /**
     * The IWbemServices::GetObjectAsync method retrieves an object, either a class definition or instance, based on its path.
     * @remarks
     * When implementing an instance provider, you should use the object path parser sample code in the WMI section of the PSDK to parse the object path for recognizing which object the client requests. Further, a provider that supports a derived class need only supply the values for the local properties of the class, rather than the inherited properties. WMI requests that the provider of the base class handle inherited properties.
     * 
     * When implementing a class provider, 
     * <b>GetObjectAsync</b> must determine which class is being requested by parsing the class name object path stored in the <i>strObjectPath</i> parameter. The 
     * <b>GetObjectAsync</b> method then either builds the class dynamically or takes the class from a private cache. Then, 
     * <b>GetObjectAsync</b> sends the class to WMI using the 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a> pointer pointed to by the <i>pResponseHandler</i> parameter. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a> method is called to indicate the end of the result set. It can also be called with no intervening calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> if error conditions occur.
     * 
     * Because the call-back might not be returned at the same authentication level as the client requires, it is recommended that you use semisynchronous instead of asynchronous communication. If you require asynchronous communication, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * 
     * For more information about using methods semisynchronously, see <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-getobject">IWbemServices::GetObject</a> and <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @param {BSTR} strObjectPath Path of the object to retrieve. For an instance provider, <i>StrObjectPath</i> can be in the following format:
     * 
     * <ul>
     * <li>Namespace:Class.Key = "Value"</li>
     * <li>Namespace:Class = "Value"</li>
     * <li>Namespace:Class.Key = "Value", Key2 = "Value2"</li>
     * </ul>
     * Specifying the namespace before the class is optional. Object paths without namespaces refer to instances in the current namespace. If necessary, you can substitute the single-quotation mark character (') for the double-quotation mark character (") to delimit the start and end of string property types.
     * 
     * If this is <b>NULL</b>, an empty object, which can become a new class, is returned. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/creating-a-class">Creating a Class</a>.
     * @param {Integer} lFlags The following flags affect the behavior of this method.
     * @param {IWbemContext} pCtx Typically <b>NULL</b>. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that can be used by the provider that produces the requested class or instance. The values in the context object must be specified in the documentation for the provider in question. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {IWbemObjectSink} pResponseHandler Pointer to the caller's implementation of 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a>. This handler receives the requested object when it becomes available through the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> method. The <i>pObjParam</i> parameter contains the object. If any error code is returned, then the supplied 
     * <b>IWbemObjectSink</b> pointer is not used. If <b>WBEM_S_NO_ERROR</b> is returned, then the user's 
     * <b>IWbemObjectSink</b> implementation is called to indicate the result of the operation. Windows Management only calls AddRef to the pointer in cases where <b>WBEM_S_NO_ERROR</b> returns. In cases where an error code returns, the reference count is the same as on entry. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * On failure, you can obtain any available information from the COM function <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a><b>GetErrorInfo</b>.
     * 
     * COM-specific error codes can also be returned if network problems cause you to lose the remote connection to Windows Management.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-getobjectasync
     */
    GetObjectAsync(strObjectPath, lFlags, pCtx, pResponseHandler) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath

        result := ComCall(7, this, "ptr", strObjectPath, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "HRESULT")
        return result
    }

    /**
     * The IWbemServices::PutClass method creates a new class or updates an existing one. The class specified by the pObject parameter must have been correctly initialized with all of the required property values.
     * @param {IWbemClassObject} pObject Must point to a valid class definition. The reference count is not changed.
     * @param {Integer} lFlags The following flags affect the behavior of this method.
     * @param {IWbemContext} pCtx Typically <b>NULL</b>. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object required by the dynamic class provider that is producing the class instances. The values in the context object must be specified in the documentation for the provider in question. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {Pointer<IWbemCallResult>} ppCallResult If <b>NULL</b>, this parameter is not used. If the <i>lFlags</i> parameter contains <b>WBEM_FLAG_RETURN_IMMEDIATELY</b>, this call returns immediately with <b>WBEM_S_NO_ERROR</b>. The <i>ppCallResult</i> parameter receives a pointer to a new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcallresult">IWbemCallResult</a> object, which can then be polled to obtain the result using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemcallresult-getcallstatus">IWbemCallResult::GetCallStatus</a> method.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * On failure, you can obtain any available information from the COM function <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>.
     * 
     * COM-specific error codes also may be returned if network problems cause you to lose the remote connection to Windows Management.
     * 
     * <div class="alert"><b>Note</b>  Unpredictable behavior will result if you change class definitions while they are in use by clients or providers. The 
     * <b>IWbemServices::PutClass</b> method should only be used to create or update a class when there are no clients or providers currently using the class.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-putclass
     */
    PutClass(pObject, lFlags, pCtx, ppCallResult) {
        result := ComCall(8, this, "ptr", pObject, "int", lFlags, "ptr", pCtx, "ptr*", ppCallResult, "HRESULT")
        return result
    }

    /**
     * The IWbemServices::PutClassAsync method creates a new class, or updates an existing one.
     * @remarks
     * If multiple class providers are installed for one particular class, WMI will not recognize which class 
     *     provider is capable of creating that class.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a> method is 
     *     called to indicate the end of the result set. It may also be called with no intervening calls to 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> if error conditions 
     *     occur.
     * 
     * Because the call-back might not be returned at the same authentication level as the client requires, it is 
     *      recommended that you use semisynchronous instead of asynchronous communication. If you require asynchronous 
     *      communication, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * 
     * For more information about using methods semisynchronously, see 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putclass">IWbemServices::PutClass</a> and 
     *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @param {IWbemClassObject} pObject Pointer to the object containing the class definition.
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx Typically <b>NULL</b>. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that may be used by the provider that is receiving the requested class. The values in the context object must be specified in the documentation for the provider in question. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {IWbemObjectSink} pResponseHandler Pointer to the caller's implementation of 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a>. This handler receives the status of the 
     * <b>Put</b> request when the status becomes available using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">SetStatus</a> method. If any error code is returned, then the supplied 
     * <b>IWbemObjectSink</b> pointer is not used. If <b>WBEM_S_NO_ERROR</b> is returned, then the user's 
     * <b>IWbemObjectSink</b> implementation is called to indicate the result of the operation. Windows Management only calls <b>AddRef</b> to the pointer in cases where <b>WBEM_S_NO_ERROR</b> returns. In cases where an error code returns, the reference count is the same as on entry. For a detailed explanation of this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * Other status or error codes are reported to the object sink specified by the <i>pReponseHandler</i> parameter.
     * 
     * COM-specific error codes also may be returned if network problems cause you to lose the remote connection to Windows Management.
     * 
     * Note that if 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putinstanceasync">PutInstanceAsync</a> returns <b>WBEM_S_NO_ERROR</b>, WMI waits for a result from the 
     * <b>SetStatus</b> method of the response handler. WMI waits indefinitely on a local connection or until a remote connection time-out occurs.
     * 
     * Because returning <b>WBEM_E_FAILED</b> causes other providers to not have a chance to create the class, it should only be returned when the class provider has failed in a way that might later succeed.
     * 
     * <div class="alert"><b>Note</b>  Unpredictable behavior will result if you change class definitions while they are in use by clients or providers. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putclass">IWbemServices::PutClass</a> method should only be used to create or update a class when there are no clients or providers currently using the class.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-putclassasync
     */
    PutClassAsync(pObject, lFlags, pCtx, pResponseHandler) {
        result := ComCall(9, this, "ptr", pObject, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "HRESULT")
        return result
    }

    /**
     * The IWbemServices::DeleteClass method deletes the specified class from the current namespace.
     * @param {BSTR} strClass Name of the class targeted for deletion.
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx Typically <b>NULL</b>. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that may be used by the provider deleting the class. The values in the context object must be specified in the documentation for the provider in question. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {Pointer<IWbemCallResult>} ppCallResult If <b>NULL</b>, this parameter is not used. If <i>ppCallResult</i> is specified, it must be set to point to <b>NULL</b> on entry. If the <i>lFlags</i> parameter contains <b>WBEM_FLAG_RETURN_IMMEDIATELY</b>, this call returns immediately with <b>WBEM_S_NO_ERROR</b>. The <i>ppCallResult</i> parameter receives a pointer to a new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcallresult">IWbemCallResult</a> object, which can then be polled to obtain the result using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemcallresult-getcallstatus">GetCallStatus</a> method.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * On failure, you can obtain any available information from the COM function <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>.
     * 
     * COM-specific error codes may also be returned if network problems cause you to lose the remote connection to Windows Management.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-deleteclass
     */
    DeleteClass(strClass, lFlags, pCtx, ppCallResult) {
        strClass := strClass is String ? BSTR.Alloc(strClass).Value : strClass

        result := ComCall(10, this, "ptr", strClass, "int", lFlags, "ptr", pCtx, "ptr*", ppCallResult, "HRESULT")
        return result
    }

    /**
     * The IWbemServices::DeleteClassAsync method deletes the specified class from the current namespace.
     * @remarks
     * If a dynamic instance provider is associated with the class, the provider is unregistered, and is no longer called for that class. Any classes that derive from the deleted class are also deleted, and their associated providers become unregistered. All outstanding static instances of the specified class and its subclasses are also deleted when the class is deleted.
     * 
     * If the class is provided by a dynamic class provider, the success of the deletion depends on whether class deletion is supported by that provider.
     * 
     * <div class="alert"><b>Note</b>  Standard system classes cannot be deleted.</div>
     * <div> </div>
     * Because the call-back might not be returned at the same authentication level as the client requires, it is recommended that you use semisynchronous instead of asynchronous communication. If you require asynchronous communication, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * 
     * For more information about using methods semisynchronously, see <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-deleteclass">IWbemServices::DeleteClass</a> and <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @param {BSTR} strClass Name of the class targeted for deletion.
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx Typically <b>NULL</b>. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that may be used by the provider deleting the class. The values in the context object must be specified in the documentation for the provider in question. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {IWbemObjectSink} pResponseHandler Pointer to an implementation of 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a> implemented by the caller. This handler receives the status of the deletion request when it becomes available through the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a> method. If any error code is returned, then the supplied 
     * <b>IWbemObjectSink</b> pointer is not used. If <b>WBEM_S_NO_ERROR</b> is returned, then the user's 
     * <b>IWbemObjectSink</b> implementation is called to indicate the result of the operation. Windows Management only calls <b>AddRef</b> on the pointer in cases where <b>WBEM_S_NO_ERROR</b> returns. In cases where an error code returns, the reference count is the same as on entry. For a detailed explanation of this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * All other return codes are provided to the object sink specified by the <i>pReponseHandler</i> parameter through the 
     * <b>SetStatus</b> method. Error conditions, such as when the class does not exist or the user does not have permission to delete classes, are reported to the handler. They are not reported in the return code of this method.
     * 
     * COM-specific error codes also may be returned if network problems cause you to lose the remote connection to Windows Management.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-deleteclassasync
     */
    DeleteClassAsync(strClass, lFlags, pCtx, pResponseHandler) {
        strClass := strClass is String ? BSTR.Alloc(strClass).Value : strClass

        result := ComCall(11, this, "ptr", strClass, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "HRESULT")
        return result
    }

    /**
     * The IWbemServices::CreateClassEnum method returns an enumerator for all classes that satisfy selection criteria.
     * @param {BSTR} strSuperclass If not <b>NULL</b> or blank, specifies a parent class name. Only classes that are subclasses of this class are returned in the enumerator. If it is <b>NULL</b> or blank, and <i>lFlags</i> is WBEM_FLAG_SHALLOW, only the top-level classes are returned (that is, classes that have no parent class). If it is <b>NULL</b> or blank and <i>lFlags</i> is <b>WBEM_FLAG_DEEP</b>, all classes within the namespace are returned.
     * @param {Integer} lFlags The following flags affect the behavior of this method. The suggested value for this parameter is WBEM_FLAG_RETURN_IMMEDIATELY and WBEM_FLAG_FORWARD_ONLY for best performance.
     * @param {IWbemContext} pCtx Typically <b>NULL</b>. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that can be used by the provider that is providing the requested classes. The values in the context object must be specified in the documentation for the provider. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @returns {IEnumWbemClassObject} Receives the pointer to the enumerator. The returned object has a positive reference count. The caller must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the pointer when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-createclassenum
     */
    CreateClassEnum(strSuperclass, lFlags, pCtx) {
        strSuperclass := strSuperclass is String ? BSTR.Alloc(strSuperclass).Value : strSuperclass

        result := ComCall(12, this, "ptr", strSuperclass, "int", lFlags, "ptr", pCtx, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumWbemClassObject(ppEnum)
    }

    /**
     * The IWbemServices::CreateClassEnumAsync method returns an enumeration of all classes that the class provider supports.
     * @remarks
     * Because the callback might not be returned at the same authentication level as the client requires, it is recommended that you use semisynchronous instead of asynchronous communication. If you require asynchronous communication, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * 
     * For more information about using methods semisynchronously, see <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-createclassenum">IWbemServices::CreateClassEnum</a> and <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @param {BSTR} strSuperclass If not <b>NULL</b> or blank, this parameter specifies a parent class name. Only classes that are subclasses of this class are returned in the enumerator. If <b>NULL</b> or blank, and <i>lFlags</i> is <b>WBEM_FLAG_SHALLOW</b>, only top-level classes—those that have no parent class—are returned. If it is <b>NULL</b> or blank and <i>lFlags</i> is <b>WBEM_FLAG_DEEP</b>, all classes within the namespace are returned.
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx Typically <b>NULL</b>. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that can be used by the provider that returns the requested classes. The values in the context object must be specified in the documentation for the provider. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {IWbemObjectSink} pResponseHandler Pointer to the caller implementation of 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a>. This handler receives the objects as they become available by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> method. When no  objects are available, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a> method is called by WMI. If any error code is returned, then the supplied 
     * <b>IWbemObjectSink</b> pointer is not used. If WBEM_S_NO_ERROR is returned, then the user 
     * <b>IWbemObjectSink</b> implementation is called to indicate the result of the operation. WMI only calls <b>AddRef</b> on the pointer when <b>WBEM_S_NO_ERROR</b> returns. When an error code returns, the reference count is the same as no entry. For a detailed explanation of this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. On failure, you can obtain available information from the COM function <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>. COM-specific error codes  can be returned if network problems cause you to lose the remote connection to WMI. Note that if 
     * <b>CreateClassEnumAsync</b> returns WBEM_S_NO_ERROR, WMI waits for a result from the 
     * <b>SetStatus</b> method of the response handler. WMI waits indefinitely on a local connection or until a remote connection time-out occurs. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-createclassenumasync
     */
    CreateClassEnumAsync(strSuperclass, lFlags, pCtx, pResponseHandler) {
        strSuperclass := strSuperclass is String ? BSTR.Alloc(strSuperclass).Value : strSuperclass

        result := ComCall(13, this, "ptr", strSuperclass, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "HRESULT")
        return result
    }

    /**
     * The IWbemServices::PutInstance method creates or updates an instance of an existing class. The instance is written to the WMI repository.
     * @remarks
     * Applications and providers call 
     * <b>PutInstance</b> to create or update an instance of an existing class. Depending on how the <i>pCtx</i> parameter is set, either some or all of the properties of the instance are updated. For more information about how to support partial instance updating, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putinstanceasync">IWbemServices::PutInstanceAsync</a>. For more information about requesting a partial instance update, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/modifying-an-instance-property">Modifying an Instance Property</a>.
     * 
     * The 
     * <b>PutInstance</b> method supports creating instances and updating instances only. It does not support moving instances. That is, a caller cannot set the <i>pInst</i> parameter to an instance that has a key that is the same as another instance in a sibling class. For example, suppose <b>ClassA</b> is the base class to <b>ClassB</b> and <b>ClassC</b>. The <b>ClassA</b> class defines the <b>KeyProp</b> property as its key and <b>ClassB</b> has an instance that has <b>KeyProp</b> set to 1. To create an instance of <b>ClassC</b> with <b>KeyProp</b> set to 1, an application must first delete the <b>ClassB</b> instance by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-deleteinstance">DeleteInstance</a> and then save the <b>ClassC</b> instance with 
     * <b>PutInstance</b>.
     * 
     * When the instance pointed to by <i>pInst</i> belongs to a subclass, Windows Management calls all of the providers responsible for the classes from which the subclass derives. All of these providers must succeed for the original 
     * <b>PutInstance</b> request to succeed. The provider supporting the topmost class in the hierarchy is called first. The calling order continues with the subclass of the topmost class and proceeds from top to bottom until Windows Management reaches the provider for the class owning the instance pointed to by <i>pInst</i>.
     * 
     * Windows Management does not call the providers for any of the child classes of an instance. Therefore, if an application wants to change the values of inherited properties, the application must call 
     * <b>PutInstance</b> on the full instance of the child class rather than a corresponding instance of the parent class.
     * 
     * When an application must update an instance that belongs to a class hierarchy, the <i>pInst</i> parameter must point to the instance containing the properties to be modified. That is, consider a target instance that belongs to <b>ClassB</b>. The <b>ClassB</b> instance derives from <b>ClassA</b>, and <b>ClassA</b> defines the property <b>PropA</b>. If an application wants to make a change to the value of <b>PropA</b> in the <b>ClassB</b> instance, it must set <i>pInst</i> to that instance rather than an instance of <b>ClassA</b>.
     * 
     * Calling 
     * <b>PutInstance</b> on an instance of an abstract class is not allowed.
     * @param {IWbemClassObject} pInst Pointer to the instance to be written. The caller cannot make assumptions about the reference count at the completion of this call.
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx Typically <b>NULL</b>, indicating that every property in the instance is to be updated. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object containing more information about the instance. The data in the context object must be documented by the provider responsible for the instance. A non-<b>NULL</b><b>IWbemContext</b> object can indicate whether support exists for partial-instance updates.
     * 
     * For more information about how to support full and partial-instance updates, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putinstanceasync">IWbemServices::PutInstanceAsync</a>. For more information about requesting a full or partial-instance update operation, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/modifying-an-instance-property">Modifying an Instance Property</a>.
     * @param {Pointer<IWbemCallResult>} ppCallResult If <b>NULL</b>, this parameter is not used. If the <i>lFlags</i> parameter contains <b>WBEM_FLAG_RETURN_IMMEDIATELY</b>, this call returns immediately with <b>WBEM_S_NO_ERROR</b>. The <i>ppCallResult</i> parameter then receives a pointer to a new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcallresult">IWbemCallResult</a> object, which can be polled with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemcallresult-getcallstatus">IWbemCallResult::GetCallStatus</a> to obtain the result.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * COM-specific error codes also may be returned if network problems cause you to lose the remote connection to Windows Management.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-putinstance
     */
    PutInstance(pInst, lFlags, pCtx, ppCallResult) {
        result := ComCall(14, this, "ptr", pInst, "int", lFlags, "ptr", pCtx, "ptr*", ppCallResult, "HRESULT")
        return result
    }

    /**
     * The IWbemServices::PutInstanceAsync method asynchronously creates or updates an instance of an existing class. Update confirmation or error reporting is provided through the IWbemObjectSink interface implemented by the caller.
     * @remarks
     * Clients that call 
     * <b>PutInstanceAsync</b> must always expect the results of the call to be reported using their 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> method.
     * 
     * When the instance pointed to by <i>pInst</i> belongs to a class that is derived from other classes, the success of 
     * <b>PutInstanceAsync</b> depends on the success of the providers responsible for the parent classes. For example, if <i>pInst</i> belongs to <b>ClassB</b> and <b>ClassB</b> derives from <b>ClassA</b>, a call to the 
     * <b>PutInstanceAsync</b> method implemented by the provider for <b>ClassA</b> must succeed for the update operation on <b>ClassB</b> to succeed. For more information, see Remarks in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putinstance">IWbemServices::PutInstance</a>.
     * 
     * When implementing an instance provider, if the instance has a key property set to <b>NULL</b>, 
     * <b>PutInstanceAsync</b> should choose a value guaranteed to be unique within the class. When WMI services a request to update an instance with a <b>NULL</b> key property, it internally generates a <b>GUID</b> and assigns it to the key property. Further, when the instance being updated belongs to a child class, the success of the operation is dependent on the success of a 
     * <b>PutInstanceAsync</b> call to each of the providers responsible for the classes higher in the hierarchy. Do not return <b>WBEM_S_NO_ERROR</b> until you are sure that all of the other providers have succeeded. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putinstance">IWbemServices::PutInstance</a>.
     * 
     * Instance providers supporting a partial update must check for the existence of the <b>__PUT_EXTENSIONS</b> context value. A system context value is a value defined by WMI to have specific meanings, is set by the client application, and is supported by an instance provider. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> interface provides access to the system context values and other provider-specific context values. The following list lists the context values that support partial-instance update operations.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a> method is called to indicate the end of the result set. It may also be called with no intervening calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> if error conditions occur.
     * 
     * Because the call-back might not be returned at the same authentication level as the client requires, it is recommended that you use semisynchronous instead of asynchronous communication. If you require asynchronous communication, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * 
     * For more information about using methods semisynchronously, see <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putinstance">IWbemServices::PutInstance</a> and <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * 
     * <table>
     * <tr>
     * <th>System context value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>__PUT_EXTENSIONS</b>
     * 
     * (<b>VT_BOOL</b>)
     * 
     * </td>
     * <td>
     * The client application has set one or more of the other system context values to provide more information about the update operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>__PUT_EXT_STRICT_NULLS</b>
     * 
     * (<b>VT_BOOL</b>)
     * 
     * </td>
     * <td>
     * The instance provider must force the setting of properties to <b>VT_NULL</b> when appropriate and raise an error on failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>__PUT_EXT_PROPERTIES</b>
     * 
     * (<b>VT_ARRAY</b> | <b>VT_BSTR</b>)
     * 
     * </td>
     * <td>
     * Contains a list of the properties to update. The instance provider should ignore all other properties.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>__PUT_EXT_ATOMIC</b>
     * 
     * (<b>VT_BOOL</b>)
     * 
     * </td>
     * <td>
     * All updates must succeed or the instance provider must revert back. There can be no partial success.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * When implementing an instance provider, you should respond to a <b>NULL</b> property in <i>pCtx</i> in the following manner:
     * 
     * <ul>
     * <li>If the property type is <b>VT_NULL</b>, the provider can either ignore the property without making a change or fail the operation.</li>
     * <li>If the property type is not <b>VT_NULL</b> and the property cannot be updated, the provider should return an error, because the provider is obligated to update the property with the new value.</li>
     * </ul>
     * If <i>pCtx</i> is not <b>NULL</b> and points to valid context information, the caller application is requesting a partial-instance update. As before, an instance providers that does not support partial-instance updating should fail the operation by returning <b>WBEM_E_PROVIDER_NOT_CAPABLE</b>.
     * 
     * When implementing an async operation, the async operation not complete until you release any <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a>'s you have performed on <i>pResponseHandler</i>.  This is the case even if you call <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">SetStatus</a> on <i>pResponseHander</i>. If <i>pResponseHandler</i> is leaked, any sync or semi-sync clients will also not complete and possibly stop responding, depending on your implementation.
     * 
     * Even in catastrophic cases, you must release the references for decoupled providers. This is because in sync and semi-sync cases, the WMI service owns the implementation of <i>pResponseHandler</i>: even if your decoupled provider's process exits, the clients will still not be responding.
     * @param {IWbemClassObject} pInst Pointer to the instance to be written to the WMI repository. The caller cannot make assumptions about the 
     *     reference count at the completion of this call.
     * @param {Integer} lFlags Specifies whether the caller wants the instance created if the instance does not currently exist.
     * 
     * When implementing an instance provider, you can choose to support a limited number of the flags in 
     *        <i>lFlags</i> by returning <b>WBEM_E_PROVIDER_NOT_CAPABLE</b>.
     * @param {IWbemContext} pCtx Pointer describing if the client is requesting a partial-instance update or full-instance update. A partial-instance update modifies a subset of the properties of the instance. In contrast, a full-instance update modifies all of the properties. If <b>NULL</b>, this parameter indicates that the caller application is requesting a full-instance update. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object required by the dynamic class provider that is producing the class instances. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {IWbemObjectSink} pResponseHandler Pointer to the caller's implementation of 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a>. This handler receives the status of this call when it becomes available using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a> method. If any error code is returned, then the supplied 
     * <b>IWbemObjectSink</b> pointer is not used. If <b>WBEM_S_NO_ERROR</b> is returned, then the user's 
     * <b>IWbemObjectSink</b> implementation is called to indicate the result of the operation. Windows Management only calls <b>AddRef</b> on the pointer in cases where <b>WBEM_S_NO_ERROR</b> returns. In cases where an error code returns, the reference count is the same as on entry. For more information about how to make asynchronous calls, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * Note that if 
     * <b>PutInstanceAsync</b> returns <b>WBEM_S_NO_ERROR</b>, WMI waits for a result from the 
     * <b>SetStatus</b> method of the response handler. WMI waits indefinitely on a local connection or until a remote connection time-out occurs.
     * 
     * COM-specific error codes also may be returned if network problems cause you to lose the remote connection to Windows Management.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-putinstanceasync
     */
    PutInstanceAsync(pInst, lFlags, pCtx, pResponseHandler) {
        result := ComCall(15, this, "ptr", pInst, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "HRESULT")
        return result
    }

    /**
     * The IWbemServices::DeleteInstance method deletes an instance of an existing class in the current namespace.
     * @remarks
     * The 
     * <b>IWbemServices::DeleteInstance</b> method is called to delete an existing instance in the current namespace. Instances in other namespaces cannot be deleted. When 
     * <b>DeleteInstance</b> is called to delete an instance that belongs to a class in a hierarchy, Windows Management calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-deleteinstanceasync">DeleteInstanceAsync</a> method for all of the providers responsible for non-abstract classes in the hierarchy. That is, if the <i>strObjectPath</i> parameter identifies an instance of ClassB, and ClassB derives from ClassA, a non-abstract class, and is the parent class of ClassC and ClassD, also non-abstract classes, the providers for all four classes are called.
     * 
     * Windows Management calls each provider with an object path that is modified to point to their class. For example, if <i>strObjectPath</i> for the original call is set to "ClassB.k=1", the call to the provider of ClassA would set <i>strObjectPath</i> to "ClassA.k=1".
     * 
     * The success of a 
     * <b>DeleteInstance</b> call depends only on the success of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-deleteinstanceasync">DeleteInstanceAsync</a> call to the provider of the topmost non-abstract class. A non-abstract class has an abstract class as its parent. If the provider for any one of such classes succeeds, the operation succeeds; if all such classes fail, the operation fails.
     * 
     * For example, assume that ClassX is the base class for the following hierarchy:
     * 
     * <ol>
     * <li>ClassA derives from ClassX.</li>
     * <li>ClassB derives from ClassA.</li>
     * <li>ClassC and ClassD derive from ClassB.</li>
     * </ol>
     * If ClassX is the only abstract class in the hierarchy and the <i>strObjectPath</i> parameter in 
     * <b>DeleteInstance</b> points to an instance of ClassB, only the provider for ClassA needs to succeed in its 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-deleteinstanceasync">DeleteInstanceAsync</a> call.
     * 
     * If ClassX, ClassA, and ClassB are all abstract and the <i>strObjectPath</i> parameter in 
     * <b>DeleteInstance</b> again points to an instance of ClassB, either the provider for ClassC or the provider for ClassD must succeed.
     * @param {BSTR} strObjectPath Valid <b>BSTR</b> containing the object path to the instance to be deleted.
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx Typically NULL. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that may be used by the provider that is deleting the instance. The values in the context object must be specified in the documentation for the provider in question.
     * @param {Pointer<IWbemCallResult>} ppCallResult If NULL, this parameter is not used. If <i>ppCallResult</i> is specified, it must be set to point to <b>NULL</b> on entry. If the <i>lFlags</i> parameter contains <b>WBEM_FLAG_RETURN_IMMEDIATELY</b>, this call returns immediately with <b>WBEM_S_NO_ERROR</b>. The <i>ppCallResult</i> parameter receives a pointer to a new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcallresult">IWbemCallResult</a> object, which can then be polled to obtain the result using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemcallresult-getcallstatus">GetCallStatus</a> method.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * On failure, you can obtain any available information from the COM function <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>.
     * 
     * COM-specific error codes also may be returned if network problems cause you to lose the remote connection to Windows Management.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-deleteinstance
     */
    DeleteInstance(strObjectPath, lFlags, pCtx, ppCallResult) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath

        result := ComCall(16, this, "ptr", strObjectPath, "int", lFlags, "ptr", pCtx, "ptr*", ppCallResult, "HRESULT")
        return result
    }

    /**
     * The IWbemServices::DeleteInstanceAsync method asynchronously deletes an instance of an existing class in the current namespace. The confirmation or failure of the operation is reported through the IWbemObjectSink interface implemented by the caller.
     * @remarks
     * An instance provider can report success or failure with either the return code from 
     * <b>DeleteInstanceAsync</b> or through a call to 
     * <b>SetStatus</b> made through <i>pResponseHandler</i>. If sent to 
     * <b>SetStatus</b>, the return code sent to the sink through <i>pResponseHandler</i> takes precedence. Because the callback might not be returned at the same authentication level as the client requires, it is recommended that you use semisynchronous instead of asynchronous communication. If you require asynchronous communication, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * 
     * For more information about using methods semisynchronously, see <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-deleteinstance">IWbemServices::DeleteInstance</a> and <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @param {BSTR} strObjectPath Valid <b>BSTR</b> that contains the 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/describing-an-instance-object-path">object path</a> of the object to be deleted.
     * @param {Integer} lFlags <b>WBEM_FLAG_SEND_STATUS</b> registers with Windows Management a request to receive intermediate status reports through the client's implementation of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a>. Provider implementation must support intermediate status reporting, for this flag to change behavior. Note that the <b>WBEM_FLAG_USE_AMENDED_QUALIFIERS</b> flag cannot be used here.
     * @param {IWbemContext} pCtx Typically <b>NULL</b>. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that may be used by the provider that is deleting the instance. The values in the context object must be specified in the documentation for the provider in question.
     * @param {IWbemObjectSink} pResponseHandler Pointer to the caller's implementation of 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a>. This handler receives the status of the delete operation as it becomes available through the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">SetStatus</a> method. If any error code is returned, then the supplied 
     * <b>IWbemObjectSink</b> pointer is not used. If <b>WBEM_S_NO_ERROR</b> is returned, then the user's 
     * <b>IWbemObjectSink</b> implementation is called to indicate the result of the operation. Windows Management only calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the pointer in cases where <b>WBEM_S_NO_ERROR</b> returns. In cases where an error code returns, the reference count is the same as on entry. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * On failure, you can obtain any available information from the COM function <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>.
     * 
     * If 
     * <b>DeleteInstanceAsync</b> returns <b>WBEM_S_NO_ERROR</b>, WMI waits for a result from the 
     * <b>SetStatus</b> method of the response handler. WMI waits indefinitely on a local connection, or until a remote connection time-out occurs.
     * 
     * Other error conditions are reported asynchronously to the object sink supplied by the <i>pResponseHandler</i> parameter.
     * 
     * COM-specific error codes also may be returned if network problems cause you to lose the remote connection to Windows Management.
     * 
     * <div class="alert"><b>Note</b>  Clients that call 
     * <b>DeleteInstanceAsync</b> must always expect the results of the call to be reported using their 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> method.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  When the instance pointed to by <i>strObjectPath</i> belongs to a class that is a member of a class hierarchy, the success of 
     * <b>DeleteInstanceAsync</b> depends on the topmost non-abstract provider. For a detailed explanation of the dependencies involved that determine the success of this operation, see Remarks in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-deleteinstance">IWbemServices::DeleteInstance</a>.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-deleteinstanceasync
     */
    DeleteInstanceAsync(strObjectPath, lFlags, pCtx, pResponseHandler) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath

        result := ComCall(17, this, "ptr", strObjectPath, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "HRESULT")
        return result
    }

    /**
     * The IWbemServices::CreateInstanceEnum method creates an enumerator that returns the instances of a specified class according to user-specified selection criteria.
     * @remarks
     * It is not an error for the returned enumerator to have zero elements.
     * @param {BSTR} strFilter Valid <b>BSTR</b> containing the name of the class for which instances are desired. This parameter cannot be <b>NULL</b>.
     * @param {Integer} lFlags The following flags affect the behavior of this method. The suggested value for this parameter is <b>WBEM_FLAG_RETURN_IMMEDIATELY</b> and <b>WBEM_FLAG_FORWARD_ONLY</b> for best performance.
     * @param {IWbemContext} pCtx Typically <b>NULL</b>. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that may be used by the provider that is providing the requested instances. The values in the context object must be specified in the documentation for the provider in question. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @returns {IEnumWbemClassObject} Receives the pointer to the enumerator, which has a positive reference count. The caller must call <b>IUnknown::Release</b> on the pointer after it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-createinstanceenum
     */
    CreateInstanceEnum(strFilter, lFlags, pCtx) {
        strFilter := strFilter is String ? BSTR.Alloc(strFilter).Value : strFilter

        result := ComCall(18, this, "ptr", strFilter, "int", lFlags, "ptr", pCtx, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumWbemClassObject(ppEnum)
    }

    /**
     * The IWbemServices::CreateInstanceEnumAsync method creates an enumerator that asynchronously returns the instances of a specified class according to user-specified selection criteria.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a> method is called to indicate the end of the result set. It may also be called with no intervening calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> if error conditions occur.
     * 
     * Because the callback might not be returned at the same authentication level as the client requires, it is recommended that you use semisynchronous instead of asynchronous communication.
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-createinstanceenum">IWbemServices::CreateInstanceEnum</a> and <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @param {BSTR} strFilter Valid <b>BSTR</b> containing the name of the class for which instances are desired. This parameter cannot be <b>NULL</b>.
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx Typically NULL. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that may be used by the provider that is returning the requested instances. The values in the context object must be specified in the documentation for the provider in question. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {IWbemObjectSink} pResponseHandler Pointer to the caller's implementation of 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a>. This handler receives the objects as they become available. If any error code is returned, then the supplied 
     * <b>IWbemObjectSink</b> pointer is not used. If <b>WBEM_S_NO_ERROR</b> is returned, then the user's 
     * <b>IWbemObjectSink</b> implementation will be called to indicate the result of the operation. Windows Management only calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the pointer in cases where <b>WBEM_S_NO_ERROR</b> returns. In cases where an error code returns, the reference count is the same as on entry. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * On failure, you can obtain more information from the COM function <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>.
     * 
     * COM-specific error codes also may be returned if network problems cause you to lose the remote connection to Windows Management.
     * 
     * An instance provider can report success or failure with either the return code from 
     * <b>CreateInstanceEnumAsync</b>, or through a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">SetStatus</a> made through <i>pResponseHandler</i>. If you choose to call 
     * <b>SetStatus</b>, the return code sent through <i>pResponseHandler</i> takes precedence.
     * 
     * If 
     * <b>CreateInstanceEnumAsync</b> returns <b>WBEM_S_NO_ERROR</b>, WMI waits for a result from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">SetStatus</a> method of the response handler. WMI waits indefinitely on a local connection, or until a remote connection time-out occurs.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-createinstanceenumasync
     */
    CreateInstanceEnumAsync(strFilter, lFlags, pCtx, pResponseHandler) {
        strFilter := strFilter is String ? BSTR.Alloc(strFilter).Value : strFilter

        result := ComCall(19, this, "ptr", strFilter, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "HRESULT")
        return result
    }

    /**
     * The IWbemServices::ExecQuery method executes a query to retrieve objects.
     * @remarks
     * The 
     * <b>IWbemServices::ExecQuery</b> method processes the query specified in the <i>strQuery</i> parameter and creates an enumerator through which the caller can access the query results. The enumerator is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-ienumwbemclassobject">IEnumWbemClassObject</a> interface; the query results are instances of class objects made available through the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> interface.
     * 
     * There are limits to the number of "AND" and "OR" keywords that can be used in WQL queries.  Large numbers of WQL keywords used in a complex query can cause WMI to return the <b>WBEM_E_QUOTA_VIOLATION</b> error code as an <b>HRESULT</b> value.  The limit of WQL keywords depends on how complex the query is.
     * @param {BSTR} strQueryLanguage Valid <b>BSTR</b> that contains one of the query languages supported by Windows Management. This must be "WQL", the acronym for WMI Query Language.
     * @param {BSTR} strQuery Valid <b>BSTR</b> that contains the text of the query. This parameter cannot be <b>NULL</b>. For more information on building WMI query strings, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/querying-with-wql">Querying with WQL</a> and the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/wql-sql-for-wmi">WQL</a> reference.
     * @param {Integer} lFlags The following flags affect the behavior of this method. The suggested value for this parameter is <b>WBEM_FLAG_RETURN_IMMEDIATELY</b> and <b>WBEM_FLAG_FORWARD_ONLY</b> for best performance.
     * @param {IWbemContext} pCtx Typically <b>NULL</b>. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that can be used by the provider that is providing the requested classes or instances. The values in the context object must be specified in the documentation for the provider in question. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @returns {IEnumWbemClassObject} If no error occurs, this receives the enumerator that allows the caller to retrieve the instances in the result set of the query. It is not an error for the query to have a result set with 0 instances. This is determined only by attempting to iterate through the instances. This object returns with a positive reference count. The caller must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> when the object is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-execquery
     */
    ExecQuery(strQueryLanguage, strQuery, lFlags, pCtx) {
        strQueryLanguage := strQueryLanguage is String ? BSTR.Alloc(strQueryLanguage).Value : strQueryLanguage
        strQuery := strQuery is String ? BSTR.Alloc(strQuery).Value : strQuery

        result := ComCall(20, this, "ptr", strQueryLanguage, "ptr", strQuery, "int", lFlags, "ptr", pCtx, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumWbemClassObject(ppEnum)
    }

    /**
     * The IWbemServices::ExecQueryAsync method executes a query to retrieve objects asynchronously.
     * @remarks
     * There are limits to the number of AND and OR keywords that can be used in WQL queries.  Large numbers of WQL keywords used in a complex query can cause WMI to return the <b>WBEM_E_QUOTA_VIOLATION</b> error code as an <b>HRESULT</b> value.  The limit of WQL keywords depends on how complex the query is.
     * 
     * The caller's <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> method can be called to report intermittent status. The <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a> method is called to indicate the end of the result set.
     * 
     * When   a provider does not support query processing, WMI can support it. However, a provider implementation of query processing is probably more efficient than the WMI version. To support queries, your instance provider must implement the 
     * <b>ExecQueryAsync</b> method. If a provider supports 
     * <b>ExecQueryAsync</b>, WMI sends a simple unary SELECT query directly to the provider through the <i>strQuery</i> parameter and the provider must parse the query and return the relevant instances. The provider must parse the query because WMI does not modify the query—even when the query is written in WQL.
     * 
     * To use WMI for query processing, do not set the <b>QuerySupportLevels</b> property in your <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/--instanceproviderregistration">__InstanceProviderRegistration</a>. When you do this, WMI calls your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-createinstanceenumasync">CreateInstanceEnumAsync</a> and post filters the results so that the caller only gets those instances that meet the query criteria.
     * 
     * The following example shows a typical instance provider implementation of 
     * <b>ExecQueryAsync</b>. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a> method is called to indicate the end of the result set. It may also be called with no intervening calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> if error conditions occur.
     * 
     * Because the call-back might not be returned at the same authentication level as the client requires, it is recommended that you use semisynchronous instead of asynchronous communication. If you require asynchronous communication, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-execquery">IWbemServices::ExecQuery</a> and <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * 
     * 
     * ```cpp
     * HRESULT CStdProvider::ExecQueryAsync( 
     *             // [in]  BSTR strQueryLanguage,
     *             // [in]  BSTR strQuery,
     *             // [in]  long lFlags,
     *             // [in]  IWbemContext __RPC_FAR *pCtx,
     *             // [in]  IWbemObjectSink __RPC_FAR *pResponseHandler
     *             )
     * {
     *    IWbemClassObject *pClass = 0;
     * 
     * // Parse the query.
     * //   You must implement ParseQuery().
     *     if (!ParseQuery(strQuery))  return WBEM_E_PROVIDER_NOT_CAPABLE;   
     * 
     * // Assume there is an IWbemServices pointer (m_pSvc) available to 
     * // retrieve the class definition.
     *     
     *     HRESULT hRes = m_pSvc->GetObject(L"ClassName", 0, NULL, &pClass, 0);
     *     if (FAILED(hRes))
     *         return hRes;
     * 
     * // Call a method to determine number of instances returned.
     * // You need to implement the GetNumberInst function.
     *     int iNumInst = GetNumberInst();
     * 
     * // Now loop through the private source and create each   
     * // instance which is part of the result set of the query.
     *     for (int iCnt = 0 ; iCnt < iNumInst ; iCnt++)
     *     {
     * // Prepare an empty object to receive the class definition.
     *          IWbemClassObject *pNextInst = 0;
     *          hRes = pClass->SpawnInstance(0, &pNextInst);
     * 
     * // Create the instance.
     * //   You must implement FillInst().
     *          //FillInst(pNextInst, iCnt); 
     * 
     * // Deliver the class to WMI.
     *          pResponseHandler->Indicate(1, &pNextInst);
     *          pNextInst->Release( );
     *     }
     * 
     * // Clean up memory
     *     pClass->Release();
     *   
     * // Send finish message to WMI.
     * 
     *     pResponseHandler->SetStatus(0, hRes, 0, 0);
     * 
     *     return hRes;
     * }
     * ```
     * 
     * 
     * In the previous example, the instance provider acquires a thread from WMI to perform the necessary synching operations. You can call the sink <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method and create another thread to deliver the objects in the result set. Creating another thread allows the current thread to return to WMI without depleting the thread pool. Whether the provider chooses the single thread design or the dual thread design depends on how long the provider plans to use the WMI thread. There are no fixed rules. Experimentation can help you determine how your design affects WMI performance.
     * 
     * <div class="alert"><b>Note</b>  When providers implement 
     * <b>ExecQueryAsync</b>, they are expected by default to return the correct result set based on the query. If a provider cannot return the correct result set easily, it may return a superset of the results and request that WMI do post-filtering before delivering the objects to the client to ensure that the result set is correct. To do this, the provider calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">SetStatus</a> on the sink provided to its 
     * <b>ExecQueryAsync</b> implementation, with the following flags.</div>
     * <div> </div>
     * 
     * ```cpp
     * // The pSink variable is of type IWbemObjectSink*
     * pSink->SetStatus(WBEM_STATUS_REQUIREMENTS,
     *     WBEM_REQUIREMENTS_START_POSTFILTER, 0, 0);
     * ```
     * 
     * 
     * <div class="alert"><b>Note</b>  Any objects subsequently sent to the WMI service are filtered. The provider can turn off post-filtering in mid-stream by using the following call.</div>
     * <div> </div>
     * 
     * ```cpp
     * // The pSink variable is of type IWbemObjectSink*
     * pSink->SetStatus(WBEM_STATUS_REQUIREMENTS, 
     *     WBEM_REQUIREMENTS_STOP_POSTFILTER, 0, 0);
     * ```
     * @param {BSTR} strQueryLanguage Valid <b>BSTR</b> that contains one of the query languages that Windows Management Instrumentation (WMI) supports. This must be "WQL".
     * @param {BSTR} strQuery Valid <b>BSTR</b> that contains the text of the query. This cannot be 
     *    <b>NULL</b>. When you implement an instance provider, your provider can  refuse the query 
     *    because it is too complex. When a provider determines that a query is too complex, WMI can retry the provider with 
     *    a simple  query, or  choose to retrieve and enumerate the superset of the query instances.
     * 
     * For more information on building WMI query strings, see 
     *    <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/querying-with-wql">Querying with WQL</a> and the 
     *    <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/wql-sql-for-wmi">WQL</a> reference.
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx Typically <b>NULL</b>. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that the provider can use to  return the requested classes or instances. The values in the context object must be specified in the documentation for the provider. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {IWbemObjectSink} pResponseHandler Pointer to the caller's implementation of 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a>. This handler receives the objects in the query result set as they become available. If any error code is returned, then the supplied 
     * <b>IWbemObjectSink</b> pointer is not used. If <b>WBEM_S_NO_ERROR</b> is returned, then the user's 
     * <b>IWbemObjectSink</b> implementation is called to indicate the result of the operation. Windows Management Instrumentation (WMI) calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> with the objects any number of times, followed by a single call to <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a> to indicate the final status.
     * 
     * WMI only calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> to the pointer when <b>WBEM_S_NO_ERROR</b> returns. When an error code returns, the reference count is the same as on entry. For a detailed explanation of asynchronous calling methods, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * When there is a  failure, you can obtain   information from the COM function <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>.
     * 
     * Other error codes are returned to the object sink specified by the <i>pResponseHandler</i> parameter.
     * 
     * COM-specific error codes might be returned if network problems cause you to lose the remote connection to WMI.
     * 
     * When finished, an instance provider can report success or failure with either the return code from 
     * <b>ExecQueryAsync</b> or through a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">SetStatus</a> made through <i>pResponseHandler</i>. If you choose to call 
     * <b>SetStatus</b>, the return code sent through <i>pResponseHandler</i> takes precedence.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-execqueryasync
     */
    ExecQueryAsync(strQueryLanguage, strQuery, lFlags, pCtx, pResponseHandler) {
        strQueryLanguage := strQueryLanguage is String ? BSTR.Alloc(strQueryLanguage).Value : strQueryLanguage
        strQuery := strQuery is String ? BSTR.Alloc(strQuery).Value : strQuery

        result := ComCall(21, this, "ptr", strQueryLanguage, "ptr", strQuery, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "HRESULT")
        return result
    }

    /**
     * The IWbemServices::ExecNotificationQuery method executes a query to receive events. The call returns immediately, and the user can poll the returned enumerator for events as they arrive. Releasing the returned enumerator cancels the query.
     * @remarks
     * There are limits to the number of <b>AND</b> and <b>OR</b> keywords that can be used in WQL queries.  Large numbers of WQL keywords used in a complex query can cause WMI to return the WBEM_E_QUOTA_VIOLATION error code as an <b>HRESULT</b> value.  The limit of WQL keywords depends on how complex the query is.
     * @param {BSTR} strQueryLanguage Valid <b>BSTR</b> that contains one of the query languages supported by Windows Management. This cannot be <b>NULL</b>. Currently, only the 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/querying-with-wql">WMI Query Language</a> (WQL) is supported.
     * @param {BSTR} strQuery Valid <b>BSTR</b> that contains the text of the event-related query. This cannot be <b>NULL</b>. For more information on building WMI query strings, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/querying-with-wql">Querying with WQL</a> and the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/wql-sql-for-wmi">WQL</a> reference.
     * @param {Integer} lFlags This parameter must be set to both <b>WBEM_FLAG_RETURN_IMMEDIATELY</b> and <b>WBEM_FLAG_FORWARD_ONLY</b> or the call fails.
     * @param {IWbemContext} pCtx Typically <b>NULL</b>. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that can be used by the provider that provides the requested events. The values in the context object must be specified in the documentation for the provider in question. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @returns {IEnumWbemClassObject} If no error occurs, this parameter receives the enumerator that allows the caller to retrieve the instances in the result set of the query. The caller periodically calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-ienumwbemclassobject-next">IEnumWbemClassObject::Next</a> to see if any events are available. Notice that, in this usage, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-ienumwbemclassobject-reset">Reset</a> does not move the enumerator back to the beginning of the event sequence; it has no effect. The parameter can continue to receive events until <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> is called on the returned enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-execnotificationquery
     */
    ExecNotificationQuery(strQueryLanguage, strQuery, lFlags, pCtx) {
        strQueryLanguage := strQueryLanguage is String ? BSTR.Alloc(strQueryLanguage).Value : strQueryLanguage
        strQuery := strQuery is String ? BSTR.Alloc(strQuery).Value : strQuery

        result := ComCall(22, this, "ptr", strQueryLanguage, "ptr", strQuery, "int", lFlags, "ptr", pCtx, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumWbemClassObject(ppEnum)
    }

    /**
     * The IWbemServices::ExecNotificationQueryAsync method performs the same task as IWbemServices::ExecNotificationQuery except that events are supplied to the specified response handler until CancelAsyncCall is called to stop the event notification.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a> method is called to indicate the end of the result set. It may also be called with no intervening calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> if error conditions occur.
     * 
     * Because the call-back might not be returned at the same authentication level as the client requires, it is recommended that you use semisynchronous instead of asynchronous communication. If you require asynchronous communication, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * 
     * For more information about using methods semisynchronously, see <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-execnotificationquery">IWbemServices::ExecNotificationQuery</a> and <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * 
     * There are limits to the number of <b>AND</b> and <b>OR</b> keywords that can be used in WQL queries.  Large numbers of WQL keywords used in a complex query can cause WMI to return the <b>WBEM_E_QUOTA_VIOLATION</b> error code as an <b>HRESULT</b> value.  The limit of WQL keywords depends on how complex the query is.
     * @param {BSTR} strQueryLanguage Valid <b>BSTR</b> that contains one of the query languages supported by Windows Management. This must be "WQL".
     * @param {BSTR} strQuery Valid <b>BSTR</b> that contains the text of the event-related query. This cannot be <b>NULL</b>. For more information on building WMI query strings, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/querying-with-wql">Querying with WQL</a> and the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/wql-sql-for-wmi">WQL</a> reference.
     * @param {Integer} lFlags This parameter can be the following value.
     * @param {IWbemContext} pCtx Typically <b>NULL</b>. Otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that may be used by the provider that is returning the requested events. The values in the context object must be specified in the documentation for the provider in question. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {IWbemObjectSink} pResponseHandler Pointer to the caller's implementation of 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a>. This handler receives the objects in the query result set as they become available. To cease receiving events, the caller must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-cancelasynccall">IWbemServices::CancelAsyncCall</a> using the same pointer value for <i>pResponseHandler</i>. As events become available, the supplied 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> implementation is called to deliver the event objects. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a> method is not called at any time, because there is no final or terminating condition. The call executes indefinitely until canceled. If any error code is returned, then the supplied 
     * <b>IWbemObjectSink</b> pointer is not used. If <b>WBEM_S_NO_ERROR</b> is returned, then the user's 
     * <b>IWbemObjectSink</b> implementation is called to indicate the result of the operation. Windows Management only calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the pointer in cases where <b>WBEM_S_NO_ERROR</b> returns. In cases where an error code returns, the reference count is the same as on entry. For a detailed explanation of this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * On failure, you can obtain any available information from the COM function <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>.
     * 
     * Other error codes are returned to the object sink specified by the <i>pResponseHandler</i> parameter.
     * 
     * COM-specific error codes also can be returned if network problems cause you to lose the remote connection to Windows Management.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-execnotificationqueryasync
     */
    ExecNotificationQueryAsync(strQueryLanguage, strQuery, lFlags, pCtx, pResponseHandler) {
        strQueryLanguage := strQueryLanguage is String ? BSTR.Alloc(strQueryLanguage).Value : strQueryLanguage
        strQuery := strQuery is String ? BSTR.Alloc(strQuery).Value : strQuery

        result := ComCall(23, this, "ptr", strQueryLanguage, "ptr", strQuery, "int", lFlags, "ptr", pCtx, "ptr", pResponseHandler, "HRESULT")
        return result
    }

    /**
     * Executes a method exported by a CIM object.
     * @remarks
     * If <i>ppOutParams</i> is not <b>NULL</b>, the client can determine the method's return value type by examining the <b>ReturnValue</b> property of the object pointed to by <i>ppOutParams</i>.
     * @param {BSTR} strObjectPath Valid <b>BSTR</b> containing the 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/describing-a-class-object-path">object path</a> of the object for which the method is executed.
     * @param {BSTR} strMethodName Name of the method for the object.
     * @param {Integer} lFlags This parameter can be set to 0 to make this a synchronous call. To make this a semisynchronous call, set <i>lFlags</i> to <b>WBEM_FLAG_RETURN_IMMEDIATELY</b>, provide a valid pointer for the <i>ppCallResult</i> parameter, and this call returns immediately. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * @param {IWbemContext} pCtx Typically <b>NULL</b>;  otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that may be used by the provider executing the method. The values in the context object must be specified in the documentation for the provider in question. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {IWbemClassObject} pInParams May be <b>NULL</b> if no in-parameters are required to execute the method. Otherwise, this points to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> that contains the properties acting as inbound parameters for the method execution. The contents of the object are method-specific, and are part of the specification for the provider in question. For more information about constructing input parameters, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/creating-parameters-objects-in-c--">Creating Parameters Objects in C++</a>.
     * @param {Pointer<IWbemClassObject>} ppOutParams If not <b>NULL</b>, receives a pointer to the outbound parameters and return values for the method execution. The contents of this object are method-specific, and are part of the specification for the provider in question. The caller must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the returned object when it is no longer required.
     * @param {Pointer<IWbemCallResult>} ppCallResult If <b>NULL</b>, this is not used. If <i>ppCallResult</i> is specified, it must be set to point to <b>NULL</b> on entry. In this case, the call returns immediately with <b>WBEM_S_NO_ERROR</b>. The <i>ppCallResult</i> parameter receives a pointer to a new 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcallresult">IWbemCallResult</a> object, which must be polled to obtain the result of the method execution using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemcallresult-getcallstatus">GetCallStatus</a> method. The out parameters for the call are available by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemcallresult-getresultobject">IWbemCallResult::GetResultObject</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * On failure, you can obtain any available information from the COM function <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>.
     * 
     * COM-specific error codes also may be returned if network problems cause you to lose the remote connection to Windows Management.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-execmethod
     */
    ExecMethod(strObjectPath, strMethodName, lFlags, pCtx, pInParams, ppOutParams, ppCallResult) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath
        strMethodName := strMethodName is String ? BSTR.Alloc(strMethodName).Value : strMethodName

        result := ComCall(24, this, "ptr", strObjectPath, "ptr", strMethodName, "int", lFlags, "ptr", pCtx, "ptr", pInParams, "ptr*", ppOutParams, "ptr*", ppCallResult, "HRESULT")
        return result
    }

    /**
     * Asynchronously executes a method exported by a CIM object.
     * @remarks
     * A single method provider can supply methods for many classes and instances. Method providers have to deal with a maximum of three return values.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a> method is called to indicate the end of the result set. It may also be called with no intervening calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> if error conditions occur.
     * 
     * Because the call-back might not be returned at the same authentication level as the client requires, it is recommended that you use semisynchronous instead of asynchronous communication. If you require asynchronous communication, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/calling-a-method">Calling a Method</a>.
     * 
     * <table>
     * <tr>
     * <th>Return values</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <b>ExecMethodAsync</b> (required)
     * 
     * </td>
     * <td>
     * Indicates whether or not the input parameters for the method that are pointed to by the <b>pInParams</b> parameter are valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Invoked method (optional)
     * 
     * </td>
     * <td>
     * Dependent on the method. The return value is placed in the <b>ReturnValue</b> property of the 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/--parameters">__PARAMETERS</a> instance representing the out parameters and returned through a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">Indicate</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Invoked method out parameters (optional)
     * 
     * </td>
     * <td>
     * Dependent on the method. Out parameters are placed in non-system properties of a 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/--parameters">__PARAMETERS</a> instance and returned through 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">Indicate</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BSTR} strObjectPath Valid <b>BSTR</b> containing the 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/describing-a-class-object-path">object path</a> of the object for which the method is to be executed. You can invoke a static method using either a class name or an object path to an instance. The method provider can parse the object path parameter to determine the class and instance that contain the method definition.
     * @param {BSTR} strMethodName Name of the method for the object.
     * @param {Integer} lFlags <b>WBEM_FLAG_SEND_STATUS</b> registers with Windows Management a request to receive intermediate status reports through the clients implementation of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a>. Provider implementation must support intermediate status reporting for this flag to change behavior. Note that the <b>WBEM_FLAG_USE_AMENDED_QUALIFIERS</b> flag cannot be used here.
     * @param {IWbemContext} pCtx Typically <b>NULL</b>;  otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that may be used by the provider executing the method. The values in the context object must be specified in the documentation for the provider in question. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {IWbemClassObject} pInParams Can be <b>NULL</b> if no inbound parameters are required to execute the method. Otherwise, this points to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> object that contains the properties acting as inbound parameters for the method execution. The contents of the object are method-specific, and are part of the specification for the provider in question. However, the most common object is an instance of the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/--parameters">__Parameters</a> system class. For each input parameter to the method to be called, there is one non-system property. Method providers ignore the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/standard-wmi-qualifiers">ID</a> qualifiers attached to each parameter in the method, which are typically used only by browsers and similar applications.
     * @param {IWbemObjectSink} pResponseHandler Cannot be <b>NULL</b>. The object sink receives the result of the method call. The outbound parameters are sent to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a>. The most common returned object is an instance of the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/--parameters">__Parameters</a> system class. For more information about return codes, see the Remarks section. When implementing a method provider, you should call 
     * <b>Indicate</b> to return output parameter information before calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">IWbemObjectSink::SetStatus</a> to report the final status.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * On failure, you can obtain any available information from the COM function <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>.
     * 
     * Other errors are reported asynchronously to the object sink supplied in the <i>pReponseHandler</i> parameter.
     * 
     * COM-specific error codes also may be returned if network problems cause you to lose the remote connection to WMI.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemservices-execmethodasync
     */
    ExecMethodAsync(strObjectPath, strMethodName, lFlags, pCtx, pInParams, pResponseHandler) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath
        strMethodName := strMethodName is String ? BSTR.Alloc(strMethodName).Value : strMethodName

        result := ComCall(25, this, "ptr", strObjectPath, "ptr", strMethodName, "int", lFlags, "ptr", pCtx, "ptr", pInParams, "ptr", pResponseHandler, "HRESULT")
        return result
    }
}

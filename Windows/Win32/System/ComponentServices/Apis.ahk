#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ComponentServices {

;@region Constants

    /**
     * @type {String}
     */
    static TRACKER_STARTSTOP_EVENT => "Global\COM+ Tracker Push Event"

    /**
     * @type {String}
     */
    static TRACKER_INIT_EVENT => "Global\COM+ Tracker Init Event"

    /**
     * @type {Integer (UInt32)}
     */
    static GUID_STRING_SIZE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static DATA_NOT_AVAILABLE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static MTXDM_E_ENLISTRESOURCEFAILED => 2147803392

    /**
     * @type {Integer (UInt32)}
     */
    static CRR_NO_REASON_SUPPLIED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CRR_LIFETIME_LIMIT => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static CRR_ACTIVATION_LIMIT => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static CRR_CALL_LIMIT => 4294967293

    /**
     * @type {Integer (UInt32)}
     */
    static CRR_MEMORY_LIMIT => 4294967292

    /**
     * @type {Integer (UInt32)}
     */
    static CRR_RECYCLED_FROM_UI => 4294967291
;@endregion Constants

;@region Methods
    /**
     * Retrieves a reference to the default context of the specified apartment.
     * @param {Integer} aptType 
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface that is being requested on the default context. Typically, the caller requests IID_IObjectContext. The default context does not support all of the normal object context interfaces.
     * @param {Pointer<Void>} ppv A reference to the interface specified by riid on the default context. If the object's component is non-configured, (that is, the object's component has not been imported into a COM+ application), or if the <b>CoGetDefaultContext</b> function is called from a constructor or an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> method, this parameter is set to a <b>NULL</b> pointer.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_NOTINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is not in an initialized apartment.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object context does not support the interface specified by <i>riid</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetdefaultcontext
     * @since windows5.1.2600
     */
    static CoGetDefaultContext(aptType, riid, ppv) {
        result := DllCall("OLE32.dll\CoGetDefaultContext", "int", aptType, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an activity to do synchronous or asynchronous batch work that can use COM+ services without needing to create a COM+ component.
     * @param {Pointer<IUnknown>} pIUnknown A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the object, created from the <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> class, that contains the configuration information for the services to be used within the activity created by <b>CoCreateActivity</b>.
     * @param {Pointer<Guid>} riid The ID of the interface to be returned through the <i>ppObj</i> parameter. This parameter should always be IID_IServiceActivity so that a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iserviceactivity">IServiceActivity</a> is returned.
     * @param {Pointer<Void>} ppObj A pointer to the interface  of an activity object. The activity object is automatically created by the call to <b>CoCreateActivity</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_SXS_CONFIG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The side-by-side assembly configuration of the <a href="/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> object is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_THREADPOOL_CONFIG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The thread pool configuration of the <a href="/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> object is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_TRACKER_CONFIG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The tracker configuration of the <a href="/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> object is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_PARTITION_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have access permissions for the COM+ partition.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-cocreateactivity
     * @since windows5.1.2600
     */
    static CoCreateActivity(pIUnknown, riid, ppObj) {
        result := DllCall("comsvcs.dll\CoCreateActivity", "ptr", pIUnknown, "ptr", riid, "ptr", ppObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Used to enter code that can then use COM+ services.
     * @param {Pointer<IUnknown>} pConfigObject A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the object, created from the <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> class, that contains the configuration information for the services to be used within the enclosed code.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_FAIL, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_SXS_CONFIG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The side-by-side assembly configuration of the <a href="/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> object is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_THREADPOOL_CONFIG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The thread pool configuration of the <a href="/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> object is invalid. The thread apartment model cannot be reconfigured by calling <a href="/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_TRACKER_CONFIG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The tracker configuration of the <a href="/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> object is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_PARTITION_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have access permissions for the COM+ partition.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-coenterservicedomain
     * @since windows5.1.2600
     */
    static CoEnterServiceDomain(pConfigObject) {
        result := DllCall("comsvcs.dll\CoEnterServiceDomain", "ptr", pConfigObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Used to leave code that uses COM+ services.
     * @remarks
     * 
     * Code that is enclosed between calls to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a> and <b>CoLeaveServiceDomain</b> runs in its own context and behaves as though it were a method that is called from an object created within the context.
     * 
     * <b>CoLeaveServiceDomain</b> triggers the server and then the client side policies as if a method call was returning. The current context is then popped from the context stack, and the context that was running when <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a> was called becomes the current context.
     * 
     * Because of their efficient design and because no thread marshaling is involved, using <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a> and <b>CoLeaveServiceDomain</b> involves significantly reduced overhead as compared to an equivalent method call.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a> and <b>CoLeaveServiceDomain</b> are particularly useful in applications, which can use these functions to access COM+ services without needing to create a component to do so.
     * 
     * 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a> and <b>CoLeaveServiceDomain</b> pairs can be nested. It is up to the user to make sure that the pairs of calls are balanced so that every call to <b>CoLeaveServiceDomain</b> matches a previous call to <b>CoEnterServiceDomain</b>.
     * 
     * 
     * @param {Pointer<IUnknown>} pUnkStatus If you want to know the status of the transaction that is completed by the call, this must be a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of an object that implements the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-itransactionstatus">ITransactionStatus</a> interface. If the enclosed code did not use transactions or if you do not need to know the transaction status, this parameter should be <b>NULL</b>. This parameter is ignored if it is non-<b>NULL</b> and if no transactions were used in the service domain.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-coleaveservicedomain
     * @since windows5.1.2600
     */
    static CoLeaveServiceDomain(pUnkStatus) {
        DllCall("comsvcs.dll\CoLeaveServiceDomain", "ptr", pUnkStatus)
    }

    /**
     * Determines whether the installed version of COM+ supports special features provided to manage serviced components (managed objects).
     * @param {Pointer<UInt32>} dwExts Indicates whether the installed version of COM+ supports managed extensions. A value of 1 indicates that it does, while a value of 0 indicates that it does not.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-getmanagedextensions
     * @since windows5.1.2600
     */
    static GetManagedExtensions(dwExts) {
        result := DllCall("comsvcs.dll\GetManagedExtensions", "uint*", dwExts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * SafeRef function
     * @param {Pointer<Guid>} rid A reference to the IID of the interface that the current object wants to pass to another object or client.
     * @param {Pointer<IUnknown>} pUnk A reference to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the current object.
     * @returns {Pointer<Void>} If the function succeds, the return value is a pointer to the specified interface that can be passed outside the current object's context. Otherwise, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-saferef
     * @since windows5.0
     */
    static SafeRef(rid, pUnk) {
        result := DllCall("comsvcs.dll\SafeRef", "ptr", rid, "ptr", pUnk, "CDecl ptr")
        return result
    }

    /**
     * Recycles the calling process.
     * @param {Integer} lReasonCode The reason code that explains why a process was recycled. The following codes are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_NO_REASON_SUPPLIED"></a><a id="crr_no_reason_supplied"></a><dl>
     * <dt><b>CRR_NO_REASON_SUPPLIED</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reason is not specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_LIFETIME_LIMIT"></a><a id="crr_lifetime_limit"></a><dl>
     * <dt><b>CRR_LIFETIME_LIMIT</b></dt>
     * <dt>xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified number of minutes that an application runs before recycling was reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_ACTIVATION_LIMIT"></a><a id="crr_activation_limit"></a><dl>
     * <dt><b>CRR_ACTIVATION_LIMIT</b></dt>
     * <dt>0xFFFFFFFE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified number of activations was reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_CALL_LIMIT"></a><a id="crr_call_limit"></a><dl>
     * <dt><b>CRR_CALL_LIMIT</b></dt>
     * <dt>0xFFFFFFFD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified number of calls to configured objects in the application was reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_MEMORY_LIMIT"></a><a id="crr_memory_limit"></a><dl>
     * <dt><b>CRR_MEMORY_LIMIT</b></dt>
     * <dt>0xFFFFFFFC</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified memory usage that a process cannot exceed was reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_RECYCLED_FROM_UI"></a><a id="crr_recycled_from_ui"></a><dl>
     * <dt><b>CRR_RECYCLED_FROM_UI</b></dt>
     * <dt>xFFFFFFFB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An administrator decided to recycle the process through the Component Services administration tool.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-recyclesurrogate
     * @since windows5.0
     */
    static RecycleSurrogate(lReasonCode) {
        result := DllCall("comsvcs.dll\RecycleSurrogate", "int", lReasonCode, "CDecl int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an activity in a single-threaded apartment to do synchronous or asynchronous batch work.
     * @param {Pointer<Guid>} riid The ID of the interface to be returned by the <i>ppObj</i> parameter. This parameter should always be IID_IMTSActivity so that a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imtsactivity">IMTSActivity</a> is returned.
     * @param {Pointer<Void>} ppobj A pointer to the interface of an activity object. The activity object is automatically created by the call to <b>MTSCreateActivity</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-mtscreateactivity
     * @since windows5.0
     */
    static MTSCreateActivity(riid, ppobj) {
        result := DllCall("comsvcs.dll\MTSCreateActivity", "ptr", riid, "ptr", ppobj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the dispenser manager's IDispenserManager interface.
     * @param {Pointer<IDispenserManager>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//mtxdm/nf-mtxdm-getdispensermanager
     * @since windows5.0
     */
    static GetDispenserManager(param0) {
        result := DllCall("MTxDM.dll\GetDispenserManager", "ptr", param0, "CDecl int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}

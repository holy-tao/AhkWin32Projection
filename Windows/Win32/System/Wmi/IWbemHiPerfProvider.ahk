#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWbemRefresher.ahk
#Include .\IWbemObjectAccess.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables providers to supply refreshable objects and enumerators.
 * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nn-wbemprov-iwbemhiperfprovider
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemHiPerfProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemHiPerfProvider
     * @type {Guid}
     */
    static IID => Guid("{49353c93-516b-11d1-aea6-00c04fb68820}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryInstances", "CreateRefresher", "CreateRefreshableObject", "StopRefreshing", "CreateRefreshableEnum", "GetObjects"]

    /**
     * Returns instances of the specified class using the supplied IWbemObjectSink instance.
     * @param {IWbemServices} pNamespace An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> pointer back to WMI that can service any request from the provider. The provider should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on this pointer if it  needs to call back to WMI during  execution.
     * @param {PWSTR} wszClass Pointer to a <b>WCHAR</b> string that specifies the class whose instances are returned.
     * @param {Integer} lFlags Integer that contains the flags.
     * @param {IWbemContext} pCtx Typically <b>NULL</b>; otherwise, a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that is required by one or more dynamic class providers. The values in the context object must be specified in the  provider documentation. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {IWbemObjectSink} pSink Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/iwbemobjectsink">IWbemObjectSink</a> implementation that is provided by the client to any of the asynchronous methods of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> that indicates the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * 
     * HiPerf providers can report success or failure either through the return code from 
     * <b>QueryInstances</b> or through a call to the 
     * <a href="/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-setstatus">SetStatus</a> method of <i>pResponseHandler</i>. If you call the 
     * <b>SetStatus</b> method, the return code sent through <i>pResponseHandler</i> takes precedence over the 
     * <b>QueryInstances</b> return code.
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbemhiperfprovider-queryinstances
     */
    QueryInstances(pNamespace, wszClass, lFlags, pCtx, pSink) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := ComCall(3, this, "ptr", pNamespace, "ptr", wszClass, "int", lFlags, "ptr", pCtx, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * Creates a refresher.
     * @param {IWbemServices} pNamespace An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> pointer back into Windows Management, which can service any request made by the provider. The provider should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on this pointer if it is going to call back into Windows Management during its execution.
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @returns {IWbemRefresher} Pointer to hold the reference to the provider's implementation of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemrefresher">IWbemRefresher</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbemhiperfprovider-createrefresher
     */
    CreateRefresher(pNamespace, lFlags) {
        result := ComCall(4, this, "ptr", pNamespace, "int", lFlags, "ptr*", &ppRefresher := 0, "HRESULT")
        return IWbemRefresher(ppRefresher)
    }

    /**
     * Requests a refreshable instance object.
     * @param {IWbemServices} pNamespace An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> pointer back into Windows Management, which can service any request made by the provider. If the pointer must call back into WMI during its execution, the provider calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on it.
     * @param {IWbemObjectAccess} pTemplate Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemobjectaccess">IWbemObjectAccess</a> object that contains the template.
     * @param {IWbemRefresher} pRefresher Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemrefresher">IWbemRefresher</a> object that contains a refresher obtained by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nf-wbemprov-iwbemhiperfprovider-createrefresher">IWbemHiPerfProvider::CreateRefresher</a>.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @param {IWbemContext} pContext Typically <b>NULL</b>; otherwise, a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that is required by one or more dynamic class providers. The values in the context object must be specified in the specific provider documentation. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {Pointer<IWbemObjectAccess>} ppRefreshable Pointer that holds the reference to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemobjectaccess">IWbemObjectAccess</a> object, which will contain the refreshable object.
     * @param {Pointer<Integer>} plId Pointer to an integer returned by the provider that uniquely identifies this refreshable object.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbemhiperfprovider-createrefreshableobject
     */
    CreateRefreshableObject(pNamespace, pTemplate, pRefresher, lFlags, pContext, ppRefreshable, plId) {
        plIdMarshal := plId is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", pNamespace, "ptr", pTemplate, "ptr", pRefresher, "int", lFlags, "ptr", pContext, "ptr*", ppRefreshable, plIdMarshal, plId, "HRESULT")
        return result
    }

    /**
     * Stops refreshing the object or enumerator corresponding to the supplied identifier.
     * @param {IWbemRefresher} pRefresher A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemrefresher">IWbemRefresher</a> object that contains a refresher obtained by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nf-wbemprov-iwbemhiperfprovider-createrefresher">IWbemHiPerfProvider::CreateRefresher</a>.
     * @param {Integer} lId An integer containing a refresher identifier that uniquely identifies the object to stop refreshing.
     * @param {Integer} lFlags An integer containing the flags.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbemhiperfprovider-stoprefreshing
     */
    StopRefreshing(pRefresher, lId, lFlags) {
        result := ComCall(6, this, "ptr", pRefresher, "int", lId, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * Creates a new refreshable enumeration.
     * @param {IWbemServices} pNamespace An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> pointer back into Windows Management, which can service any requests made by the provider. If <i>pNamespace</i> must call back into Windows Management during its execution, the provider calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on this pointer.
     * @param {PWSTR} wszClass Constant, <b>null</b>-terminated string of 16-bit, Unicode characters that contains the name of the class, whose instances are refreshed in the <i>pHiPerfEnum </i> parameter.
     * @param {IWbemRefresher} pRefresher Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemrefresher">IWbemRefresher</a> object that contains a refresher obtained by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nf-wbemprov-iwbemhiperfprovider-createrefresher">IWbemHiPerfProvider::CreateRefresher</a>.
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @param {IWbemContext} pContext Typically <b>NULL</b>; otherwise, a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object required by one or more dynamic class providers. The values in the context object must be specified in the specific provider's documentation. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {IWbemHiPerfEnum} pHiPerfEnum Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemhiperfenum">IWbemHiPerfEnum</a> object that contains the high-performance enumeration.
     * @returns {Integer} Pointer to an integer returned by the provider that uniquely identifies the refreshable enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbemhiperfprovider-createrefreshableenum
     */
    CreateRefreshableEnum(pNamespace, wszClass, pRefresher, lFlags, pContext, pHiPerfEnum) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := ComCall(7, this, "ptr", pNamespace, "ptr", wszClass, "ptr", pRefresher, "int", lFlags, "ptr", pContext, "ptr", pHiPerfEnum, "int*", &plId := 0, "HRESULT")
        return plId
    }

    /**
     * Inserts the non-key properties of the objects in the supplied array.
     * @param {IWbemServices} pNamespace An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> pointer back into Windows Management, which can service any request made by the provider. The provider should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on this pointer if it is going to call back into Windows Management during its execution.
     * @param {Integer} lNumObjects Integer that contains the number of objects you are retrieving.
     * @param {Integer} lFlags Reserved. This parameter must be 0.
     * @param {IWbemContext} pContext Typically <b>NULL</b>; otherwise, a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that is required by one or more dynamic class providers. The values in the context object must be specified in specific provider documentation. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI.</a>.
     * @returns {IWbemObjectAccess} Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemobjectaccess">IWbemObjectAccess</a> objects. The <b>GetObjects</b> method inserts the key properties of each object into this array.
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbemhiperfprovider-getobjects
     */
    GetObjects(pNamespace, lNumObjects, lFlags, pContext) {
        result := ComCall(8, this, "ptr", pNamespace, "int", lNumObjects, "ptr*", &apObj := 0, "int", lFlags, "ptr", pContext, "HRESULT")
        return IWbemObjectAccess(apObj)
    }
}

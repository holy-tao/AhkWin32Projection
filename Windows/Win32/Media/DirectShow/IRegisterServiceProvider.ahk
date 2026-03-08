#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IRegisterServiceProvider interface registers an object as a service with the Filter Graph Manager. For more information, see IRegisterServiceProvider::RegisterService.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iregisterserviceprovider
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IRegisterServiceProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRegisterServiceProvider
     * @type {Guid}
     */
    static IID => Guid("{7b3a2f01-0751-48dd-b556-004785171c54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterService"]

    /**
     * The RegisterService method registers an object as a service.
     * @remarks
     * A service is an interface that a client discovers through the COM <b>IServiceProvider::QueryService</b> method, instead of through the usual <b>IUnknown::QueryInterface</b> method. The difference between the two methods is that <b>QueryInterface</b> returns an interface on the original object, whereas <b>QueryService</b> may return an interface on another object. (More precisely, <b>QueryInterface</b> guarantees that you can query the original interface and the returned interface for <b>IUnknown</b>, and you will get back identical pointers. <b>QueryService</b> does not have this guarantee.)
     * 
     * The <c>RegisterService</c> method enables you to register a service with the Filter Graph Manager. Other objects can then use the <b>IServiceProvider</b> interface to retrieve your object. This facilitates communication between separate COM objects, using the Filter Graph Manager as the central communication point.
     * 
     * A service is identified by a GUID, called the service identifier (SID). One service can support multiple interfaces. To register the service, call <c>RegisterService</c>, as shown in the following code:
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * DEFINE_GUID(SID_MyService, ....);
     * IRegisterServiceProvider *pRSP;
     * hr = pGraph-&gt;QueryInterface(IID_IRegisterServiceProvider, (void**)&amp;pRSP);
     * if (SUCCEEDED(hr))
     * {
     *     IUnknown pServiceObj;
     *     MyCreateServiceHelper(SID_MyService, &amp;pServiceObj);
     *     pRSP-&gt;RegisterService(SID_MyService, pServiceObj);
     *     pRSP-&gt;Release();
     *     pServiceObj-&gt;Release();
     * }
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * This example assumes that MyCreateServiceHelper is a helper function that creates the service object. A client could get a pointer to the service object by calling <b>IServiceProvider::QueryService</b>:
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * IServiceProvider *pSP;
     * hr = pGraph-&gt;QueryInterface(IID_IServiceProvider, (void**)&amp;pSP);
     * if (SUCCEEDED(hr))
     * {
     *     ISomeInterface *pService;
     *     hr = pSP-&gt;QueryService(SID_MyService, IID_ISomeInterface, (void**)&amp;pService);
     *     pSP-&gt;Release();
     *     if (SUCCEEDED(hr))
     *     {
     *         pService-&gt;SomeMethod();
     *         pService-&gt;Release();
     *     }
     * };
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * To unregister the service, call <c>RegisterService</c> with a <b>NULL</b> pointer in the second parameter:
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * pRSP-&gt;RegisterService(SID_MyService, NULL);
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * When the Filter Graph Manager is released, it unregisters all services.
     * 
     * The Filter Graph Manager keeps a reference count on the service object until the service is unregistered. To prevent circular reference counts, the service object should not hold a reference count on the Filter Graph Manager. For example, you cannot use the destructor method of the service object to unregister the service, because as long as the service holds a reference count on the Filter Graph Manager, the destructor will never be called. One solution is to create a separate object that registers and unregisters the service. Or, you can simply release the service object after you register it and let the Filter Graph Manager control its lifetime.
     * @param {Pointer<Guid>} guidService Service identifier (SID) of the service.
     * @param {IUnknown} pUnkObject Pointer to the <b>IUnknown</b> interface of the service object, or <b>NULL</b> to unregister the service.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iregisterserviceprovider-registerservice
     */
    RegisterService(guidService, pUnkObject) {
        result := ComCall(3, this, "ptr", guidService, "ptr", pUnkObject, "HRESULT")
        return result
    }
}

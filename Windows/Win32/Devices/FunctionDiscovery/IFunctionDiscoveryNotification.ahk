#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is implemented by the client program to support asynchronous queries and is called by Function Discovery to notify the client program when a function instance that meets the query parameters has been added or removed.
 * @remarks
 * 
 * This interface must be implemented by the client program in order to receive notifications from Function Discovery. The address of the client program's implementation is passed to one of the query methods to enable notifications for function instances which meet the query parameters.
 * 
 *  Function Discovery calls the client program's <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onupdate">IFunctionDiscoveryNotification::OnUpdate</a> method to perform the actual notification, which is generated for a function instance when it is added or removed. <div class="alert"><b>Note</b>  Some Function discovery providers will also generate a notification when a function instance is modified by changing a category or one or more properties assigned to it.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IFunctionDiscoveryNotification extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFunctionDiscoveryNotification
     * @type {Guid}
     */
    static IID => Guid("{5f6c1ba8-5330-422e-a368-572b244d3f87}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUpdate", "OnError", "OnEvent"]

    /**
     * 
     * @param {Integer} enumQueryUpdateAction 
     * @param {Integer} fdqcQueryContext 
     * @param {IFunctionInstance} pIFunctionInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onupdate
     */
    OnUpdate(enumQueryUpdateAction, fdqcQueryContext, pIFunctionInstance) {
        result := ComCall(3, this, "int", enumQueryUpdateAction, "uint", fdqcQueryContext, "ptr", pIFunctionInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @param {Integer} fdqcQueryContext 
     * @param {PWSTR} pszProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onerror
     */
    OnError(hr, fdqcQueryContext, pszProvider) {
        pszProvider := pszProvider is String ? StrPtr(pszProvider) : pszProvider

        result := ComCall(4, this, "int", hr, "uint", fdqcQueryContext, "ptr", pszProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEventID 
     * @param {Integer} fdqcQueryContext 
     * @param {PWSTR} pszProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onevent
     */
    OnEvent(dwEventID, fdqcQueryContext, pszProvider) {
        pszProvider := pszProvider is String ? StrPtr(pszProvider) : pszProvider

        result := ComCall(5, this, "uint", dwEventID, "uint", fdqcQueryContext, "ptr", pszProvider, "HRESULT")
        return result
    }
}

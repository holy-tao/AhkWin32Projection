#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFunctionInstance.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implements the asynchronous query for a function instance based on category and subcategory.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancequery-execute">Execute</a> method must be invoked by the client program before any data can be retrieved from the query object.
 * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancequery
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IFunctionInstanceQuery extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFunctionInstanceQuery
     * @type {Guid}
     */
    static IID => Guid("{6242bc6b-90ec-4b37-bb46-e229fd84ed95}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Execute"]

    /**
     * Performs the query defined by IFunctionDiscovery::CreateInstanceQuery.
     * @remarks
     * This method must be must be invoked by the client program to retrieve data from the query object. When called, this method performs the following: 
     * 
     * <ol>
     * <li>Retrieves the function instance.</li>
     * <li>Initiates the update notification mechanism if the address of the client program's <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> callback routine is provided to <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-createinstancequery">IFunctionDiscovery::CreateInstanceQuery</a>.</li>
     * </ol>
     * Function Discovery network providers only return function instances through the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> interface.  They return no function instances directly when this method is invoked. Instead, <b>Execute</b> simply initiates an entirely asynchronous retrieval operation and returns E_PENDING to indicate that the results will be returned asynchronously.   Notifications must be used to retrieve function instances from Function Discovery network providers.
     * 
     * If <b>Execute</b> is called twice on the same query object, the first query is terminated before the second query executes.
     * @returns {IFunctionInstance} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface pointer that receives the requested function instance.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancequery-execute
     */
    Execute() {
        result := ComCall(3, this, "ptr*", &ppIFunctionInstance := 0, "HRESULT")
        return IFunctionInstance(ppIFunctionInstance)
    }
}

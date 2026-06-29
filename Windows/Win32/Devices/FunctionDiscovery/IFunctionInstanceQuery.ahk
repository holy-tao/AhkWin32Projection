#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IFunctionInstance.ahk" { IFunctionInstance }

/**
 * Implements the asynchronous query for a function instance based on category and subcategory.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancequery-execute">Execute</a> method must be invoked by the client program before any data can be retrieved from the query object.
 * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancequery
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 */
export default struct IFunctionInstanceQuery extends IUnknown {
    /**
     * The interface identifier for IFunctionInstanceQuery
     * @type {Guid}
     */
    static IID := Guid("{6242bc6b-90ec-4b37-bb46-e229fd84ed95}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFunctionInstanceQuery interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Execute : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFunctionInstanceQuery.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

    Query(iid) {
        if (IFunctionInstanceQuery.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Execute := CallbackCreate(GetMethod(implObj, "Execute"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Execute)
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IFaxInboundRoutingMethod interface defines a configuration object used by a fax client application to retrieve information about an individual fax inbound routing method on a connected fax server.
 * @remarks
 * A default implementation of <b>IFaxInboundRoutingMethod</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethod">FaxInboundRoutingMethod</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxinboundroutingmethod
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxInboundRoutingMethod extends IDispatch {
    /**
     * The interface identifier for IFaxInboundRoutingMethod
     * @type {Guid}
     */
    static IID := Guid("{45700061-ad9d-4776-a8c4-64065492cf4b}")

    /**
     * The class identifier for FaxInboundRoutingMethod
     * @type {Guid}
     */
    static CLSID := Guid("{4b9fd75c-0194-4b72-9ce5-02a8205ac7d4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxInboundRoutingMethod interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name                  : IntPtr
        get_GUID                  : IntPtr
        get_FunctionName          : IntPtr
        get_ExtensionFriendlyName : IntPtr
        get_ExtensionImageName    : IntPtr
        get_Priority              : IntPtr
        put_Priority              : IntPtr
        Refresh                   : IntPtr
        Save                      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxInboundRoutingMethod.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    GUID {
        get => this.get_GUID()
    }

    /**
     * @type {BSTR} 
     */
    FunctionName {
        get => this.get_FunctionName()
    }

    /**
     * @type {BSTR} 
     */
    ExtensionFriendlyName {
        get => this.get_ExtensionFriendlyName()
    }

    /**
     * @type {BSTR} 
     */
    ExtensionImageName {
        get => this.get_ExtensionImageName()
    }

    /**
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * The IFaxInboundRoutingMethod::get_Name property is a null-terminated string that contains the user-friendly name associated with the inbound fax routing method. The string is suitable for display to users.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_name
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * The IFaxInboundRoutingMethod::get_GUID property is a null-terminated string that specifies the GUID that uniquely identifies the fax routing method.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_guid
     */
    get_GUID() {
        pbstrGUID := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrGUID, "HRESULT")
        return pbstrGUID
    }

    /**
     * The IFaxInboundRoutingMethod::get_FunctionName property is a null-terminated string that contains the name of the function that executes a specific fax routing procedure.
     * @remarks
     * The fax routing extension DLL identified by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethod-extensionimagename-vb">IFaxInboundRoutingMethod::get_ExtensionImageName</a> property defines and exports the function.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_functionname
     */
    get_FunctionName() {
        pbstrFunctionName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrFunctionName, "HRESULT")
        return pbstrFunctionName
    }

    /**
     * The IFaxInboundRoutingMethod::get_ExtensionFriendlyName property is the user-friendly name for the fax routing extension that exports the inbound fax routing method.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_extensionfriendlyname
     */
    get_ExtensionFriendlyName() {
        pbstrExtensionFriendlyName := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrExtensionFriendlyName, "HRESULT")
        return pbstrExtensionFriendlyName
    }

    /**
     * The IFaxInboundRoutingMethod::get_ExtensionImageName property is a null-terminated string that contains the executable image name (DLL path and file name) of the fax routing extension that exports the fax routing method.
     * @remarks
     * The path can include valid environment variables, for example, <c>%SYSTEMDRIVE%</code> and <code>%SYSTEMROOT%</c>.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_extensionimagename
     */
    get_ExtensionImageName() {
        pbstrExtensionImageName := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrExtensionImageName, "HRESULT")
        return pbstrExtensionImageName
    }

    /**
     * The Priority property is a value associated with the order in which the fax service calls the routing method when the service receives a fax job. (Get)
     * @remarks
     * Valid values for this property are 1 through <i>n</i>, where 1 is the highest priority.
     * 
     * You should assign a unique priority value to each routing method. After you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethod-save-vb">IFaxInboundRoutingMethod::Save</a> method, the fax service sorts the routing methods by priority. If two routing methods have the same priority, the fax service will choose which will have a higher priority.
     * 
     * If you want a particular routing method to have the lowest possible priority, specify a very large value, such as 999999, and then call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethod-save-vb">IFaxInboundRoutingMethod::Save</a> method.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_priority
     */
    get_Priority() {
        result := ComCall(12, this, "int*", &plPriority := 0, "HRESULT")
        return plPriority
    }

    /**
     * The Priority property is a value associated with the order in which the fax service calls the routing method when the service receives a fax job. (Put)
     * @remarks
     * Valid values for this property are 1 through <i>n</i>, where 1 is the highest priority.
     * 
     * You should assign a unique priority value to each routing method. After you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethod-save-vb">IFaxInboundRoutingMethod::Save</a> method, the fax service sorts the routing methods by priority. If two routing methods have the same priority, the fax service will choose which will have a higher priority.
     * 
     * If you want a particular routing method to have the lowest possible priority, specify a very large value, such as 999999, and then call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethod-save-vb">IFaxInboundRoutingMethod::Save</a> method.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @param {Integer} lPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-put_priority
     */
    put_Priority(lPriority) {
        result := ComCall(13, this, "int", lPriority, "HRESULT")
        return result
    }

    /**
     * The IFaxInboundRoutingMethod::Refresh method refreshes IFaxInboundRoutingMethod interface information from the fax server.
     * @remarks
     * When the <b>IFaxInboundRoutingMethod::Refresh</b> method is called, any configuration changes made after the last <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethod-save-vb">IFaxInboundRoutingMethod::Save</a> method call are lost.
     * 
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-refresh
     */
    Refresh() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * The IFaxInboundRoutingMethod::Save method saves the IFaxInboundRoutingMethod interface's data.
     * @remarks
     * To use this method, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farMANAGE_CONFIG</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access rights.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-save
     */
    Save() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFaxInboundRoutingMethod.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_GUID := CallbackCreate(GetMethod(implObj, "get_GUID"), flags, 2)
        this.vtbl.get_FunctionName := CallbackCreate(GetMethod(implObj, "get_FunctionName"), flags, 2)
        this.vtbl.get_ExtensionFriendlyName := CallbackCreate(GetMethod(implObj, "get_ExtensionFriendlyName"), flags, 2)
        this.vtbl.get_ExtensionImageName := CallbackCreate(GetMethod(implObj, "get_ExtensionImageName"), flags, 2)
        this.vtbl.get_Priority := CallbackCreate(GetMethod(implObj, "get_Priority"), flags, 2)
        this.vtbl.put_Priority := CallbackCreate(GetMethod(implObj, "put_Priority"), flags, 2)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_GUID)
        CallbackFree(this.vtbl.get_FunctionName)
        CallbackFree(this.vtbl.get_ExtensionFriendlyName)
        CallbackFree(this.vtbl.get_ExtensionImageName)
        CallbackFree(this.vtbl.get_Priority)
        CallbackFree(this.vtbl.put_Priority)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.Save)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxInboundRoutingMethod interface defines a configuration object used by a fax client application to retrieve information about an individual fax inbound routing method on a connected fax server.
 * @remarks
 * 
 * A default implementation of <b>IFaxInboundRoutingMethod</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethod">FaxInboundRoutingMethod</a> object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxinboundroutingmethod
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxInboundRoutingMethod extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxInboundRoutingMethod
     * @type {Guid}
     */
    static IID => Guid("{45700061-ad9d-4776-a8c4-64065492cf4b}")

    /**
     * The class identifier for FaxInboundRoutingMethod
     * @type {Guid}
     */
    static CLSID => Guid("{4b9fd75c-0194-4b72-9ce5-02a8205ac7d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_GUID", "get_FunctionName", "get_ExtensionFriendlyName", "get_ExtensionImageName", "get_Priority", "put_Priority", "Refresh", "Save"]

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
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * The IFaxInboundRoutingMethod::get_GUID property is a null-terminated string that specifies the GUID that uniquely identifies the fax routing method.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_guid
     */
    get_GUID() {
        pbstrGUID := BSTR()
        result := ComCall(8, this, "ptr", pbstrGUID, "HRESULT")
        return pbstrGUID
    }

    /**
     * The IFaxInboundRoutingMethod::get_FunctionName property is a null-terminated string that contains the name of the function that executes a specific fax routing procedure.
     * @remarks
     * 
     * The fax routing extension DLL identified by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethod-extensionimagename-vb">IFaxInboundRoutingMethod::get_ExtensionImageName</a> property defines and exports the function.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_functionname
     */
    get_FunctionName() {
        pbstrFunctionName := BSTR()
        result := ComCall(9, this, "ptr", pbstrFunctionName, "HRESULT")
        return pbstrFunctionName
    }

    /**
     * The IFaxInboundRoutingMethod::get_ExtensionFriendlyName property is the user-friendly name for the fax routing extension that exports the inbound fax routing method.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_extensionfriendlyname
     */
    get_ExtensionFriendlyName() {
        pbstrExtensionFriendlyName := BSTR()
        result := ComCall(10, this, "ptr", pbstrExtensionFriendlyName, "HRESULT")
        return pbstrExtensionFriendlyName
    }

    /**
     * The IFaxInboundRoutingMethod::get_ExtensionImageName property is a null-terminated string that contains the executable image name (DLL path and file name) of the fax routing extension that exports the fax routing method.
     * @remarks
     * 
     * The path can include valid environment variables, for example, <c>%SYSTEMDRIVE%</code> and <code>%SYSTEMROOT%</c>.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_extensionimagename
     */
    get_ExtensionImageName() {
        pbstrExtensionImageName := BSTR()
        result := ComCall(11, this, "ptr", pbstrExtensionImageName, "HRESULT")
        return pbstrExtensionImageName
    }

    /**
     * The Priority property is a value associated with the order in which the fax service calls the routing method when the service receives a fax job.
     * @remarks
     * 
     * Valid values for this property are 1 through <i>n</i>, where 1 is the highest priority.
     * 
     * You should assign a unique priority value to each routing method. After you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethod-save-vb">IFaxInboundRoutingMethod::Save</a> method, the fax service sorts the routing methods by priority. If two routing methods have the same priority, the fax service will choose which will have a higher priority.
     * 
     * If you want a particular routing method to have the lowest possible priority, specify a very large value, such as 999999, and then call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethod-save-vb">IFaxInboundRoutingMethod::Save</a> method.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_priority
     */
    get_Priority() {
        result := ComCall(12, this, "int*", &plPriority := 0, "HRESULT")
        return plPriority
    }

    /**
     * The Priority property is a value associated with the order in which the fax service calls the routing method when the service receives a fax job.
     * @remarks
     * 
     * Valid values for this property are 1 through <i>n</i>, where 1 is the highest priority.
     * 
     * You should assign a unique priority value to each routing method. After you call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethod-save-vb">IFaxInboundRoutingMethod::Save</a> method, the fax service sorts the routing methods by priority. If two routing methods have the same priority, the fax service will choose which will have a higher priority.
     * 
     * If you want a particular routing method to have the lowest possible priority, specify a very large value, such as 999999, and then call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingmethod-save-vb">IFaxInboundRoutingMethod::Save</a> method.
     * 
     * To read or to write to this property, a user must have the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/ne-faxcomex-fax_access_rights_enum">farQUERY_CONFIG</a> access right.
     * 
     * 
     * @param {Integer} lPriority 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxinboundroutingmethod-put_priority
     */
    put_Priority(lPriority) {
        result := ComCall(13, this, "int", lPriority, "HRESULT")
        return result
    }

    /**
     * The IFaxInboundRoutingMethod::Refresh method refreshes IFaxInboundRoutingMethod interface information from the fax server.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxinboundroutingmethod-refresh
     */
    Refresh() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * The IFaxInboundRoutingMethod::Save method saves the IFaxInboundRoutingMethod interface's data.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nf-faxcomex-ifaxinboundroutingmethod-save
     */
    Save() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}

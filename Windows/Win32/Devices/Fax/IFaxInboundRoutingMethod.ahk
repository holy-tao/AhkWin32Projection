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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_guid
     */
    get_GUID() {
        pbstrGUID := BSTR()
        result := ComCall(8, this, "ptr", pbstrGUID, "HRESULT")
        return pbstrGUID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_functionname
     */
    get_FunctionName() {
        pbstrFunctionName := BSTR()
        result := ComCall(9, this, "ptr", pbstrFunctionName, "HRESULT")
        return pbstrFunctionName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_extensionfriendlyname
     */
    get_ExtensionFriendlyName() {
        pbstrExtensionFriendlyName := BSTR()
        result := ComCall(10, this, "ptr", pbstrExtensionFriendlyName, "HRESULT")
        return pbstrExtensionFriendlyName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_extensionimagename
     */
    get_ExtensionImageName() {
        pbstrExtensionImageName := BSTR()
        result := ComCall(11, this, "ptr", pbstrExtensionImageName, "HRESULT")
        return pbstrExtensionImageName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_priority
     */
    get_Priority() {
        result := ComCall(12, this, "int*", &plPriority := 0, "HRESULT")
        return plPriority
    }

    /**
     * 
     * @param {Integer} lPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-put_priority
     */
    put_Priority(lPriority) {
        result := ComCall(13, this, "int", lPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-refresh
     */
    Refresh() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-save
     */
    Save() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_name
     */
    get_Name(pbstrName) {
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrGUID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_guid
     */
    get_GUID(pbstrGUID) {
        result := ComCall(8, this, "ptr", pbstrGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFunctionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_functionname
     */
    get_FunctionName(pbstrFunctionName) {
        result := ComCall(9, this, "ptr", pbstrFunctionName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrExtensionFriendlyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_extensionfriendlyname
     */
    get_ExtensionFriendlyName(pbstrExtensionFriendlyName) {
        result := ComCall(10, this, "ptr", pbstrExtensionFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrExtensionImageName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_extensionimagename
     */
    get_ExtensionImageName(pbstrExtensionImageName) {
        result := ComCall(11, this, "ptr", pbstrExtensionImageName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxinboundroutingmethod-get_priority
     */
    get_Priority(plPriority) {
        result := ComCall(12, this, "int*", plPriority, "HRESULT")
        return result
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

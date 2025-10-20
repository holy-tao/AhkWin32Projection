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
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(7, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrGUID 
     * @returns {HRESULT} 
     */
    get_GUID(pbstrGUID) {
        result := ComCall(8, this, "ptr", pbstrGUID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFunctionName 
     * @returns {HRESULT} 
     */
    get_FunctionName(pbstrFunctionName) {
        result := ComCall(9, this, "ptr", pbstrFunctionName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrExtensionFriendlyName 
     * @returns {HRESULT} 
     */
    get_ExtensionFriendlyName(pbstrExtensionFriendlyName) {
        result := ComCall(10, this, "ptr", pbstrExtensionFriendlyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrExtensionImageName 
     * @returns {HRESULT} 
     */
    get_ExtensionImageName(pbstrExtensionImageName) {
        result := ComCall(11, this, "ptr", pbstrExtensionImageName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plPriority 
     * @returns {HRESULT} 
     */
    get_Priority(plPriority) {
        result := ComCall(12, this, "int*", plPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPriority 
     * @returns {HRESULT} 
     */
    put_Priority(lPriority) {
        result := ComCall(13, this, "int", lPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

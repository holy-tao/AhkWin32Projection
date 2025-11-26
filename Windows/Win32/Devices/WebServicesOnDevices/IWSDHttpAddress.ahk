#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDTransportAddress.ahk

/**
 * Provides access to the individual components of an HTTP address.
 * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nn-wsdbase-iwsdhttpaddress
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDHttpAddress extends IWSDTransportAddress{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDHttpAddress
     * @type {Guid}
     */
    static IID => Guid("{d09ac7bd-2a3e-4b85-8605-2737ff3e4ea0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSecure", "SetSecure", "GetPath", "SetPath"]

    /**
     * Retrieves the status on whether TLS secure sessions are enabled for this address.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TLS secure sessions are enabled for this address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TLS secure sessions are disabled for this address.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdhttpaddress-getsecure
     */
    GetSecure() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Enables or disables TLS secure sessions for this address.
     * @param {BOOL} fSecure <b>TRUE</b> to enable TLS secure session communications for this address, <b>FALSE</b> to disable TLS.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdhttpaddress-setsecure
     */
    SetSecure(fSecure) {
        result := ComCall(11, this, "int", fSecure, "HRESULT")
        return result
    }

    /**
     * Gets the URI path for this address.
     * @returns {PWSTR} Pointer to the URI path for this address. Do not release this object.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdhttpaddress-getpath
     */
    GetPath() {
        result := ComCall(12, this, "ptr*", &ppszPath := 0, "HRESULT")
        return ppszPath
    }

    /**
     * Sets the URI path for this address.
     * @param {PWSTR} pszPath The URI path to use for this address.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The length in characters of <i>pszPath</i> exceeds WSD_MAX_TEXT_LENGTH (8192). 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdhttpaddress-setpath
     */
    SetPath(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(13, this, "ptr", pszPath, "HRESULT")
        return result
    }
}

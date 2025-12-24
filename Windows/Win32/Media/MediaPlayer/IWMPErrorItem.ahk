#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPErrorItem interface provides a way to access error information.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmperroritem
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPErrorItem extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPErrorItem
     * @type {Guid}
     */
    static IID => Guid("{3614c646-3b3b-4de7-a81e-930e3f2127b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_errorCode", "get_errorDescription", "get_errorContext", "get_remedy", "get_customUrl"]

    /**
     */
    errorCode {
        get => this.get_errorCode()
    }

    /**
     */
    errorDescription {
        get => this.get_errorDescription()
    }

    /**
     */
    errorContext {
        get => this.get_errorContext()
    }

    /**
     */
    remedy {
        get => this.get_remedy()
    }

    /**
     */
    customUrl {
        get => this.get_customUrl()
    }

    /**
     * The get_errorCode method retrieves the current error code.
     * @param {Pointer<Integer>} phr Pointer to a <b>long</b> containing the error code.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmperroritem-get_errorcode
     */
    get_errorCode(phr) {
        phrMarshal := phr is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, phrMarshal, phr, "HRESULT")
        return result
    }

    /**
     * The get_errorDescription method retrieves a description of the error.
     * @param {Pointer<BSTR>} pbstrDescription Pointer to a <b>BSTR</b> containing the description.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmperroritem-get_errordescription
     */
    get_errorDescription(pbstrDescription) {
        result := ComCall(8, this, "ptr", pbstrDescription, "HRESULT")
        return result
    }

    /**
     * The get_errorContext method retrieves a value indicating the context of the error.
     * @param {Pointer<VARIANT>} pvarContext Pointer to a <b>VARIANT</b> containing the error context.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmperroritem-get_errorcontext
     */
    get_errorContext(pvarContext) {
        result := ComCall(9, this, "ptr", pvarContext, "HRESULT")
        return result
    }

    /**
     * Reserved for future use.
     * @param {Pointer<Integer>} plRemedy Pointer to a <b>long</b> containing the remedy.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmperroritem-get_remedy
     */
    get_remedy(plRemedy) {
        plRemedyMarshal := plRemedy is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plRemedyMarshal, plRemedy, "HRESULT")
        return result
    }

    /**
     * The get_customUrl method retrieves the URL of a website that displays specific information about codec download failure.
     * @param {Pointer<BSTR>} pbstrCustomUrl Pointer to a <b>BSTR</b> containing the custom url.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmperroritem-get_customurl
     */
    get_customUrl(pbstrCustomUrl) {
        result := ComCall(11, this, "ptr", pbstrCustomUrl, "HRESULT")
        return result
    }
}

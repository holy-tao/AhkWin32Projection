#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFActivate.ahk
#Include .\IMFOutputPolicy.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables other components in the protected media path (PMP) to use the input protection system provided by an input trust authorities (ITA).
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfinputtrustauthority
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFInputTrustAuthority extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFInputTrustAuthority
     * @type {Guid}
     */
    static IID => Guid("{d19f8e98-b126-4446-890c-5dcb7ad71453}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDecrypter", "RequestAccess", "GetPolicy", "BindAccess", "UpdateAccess", "Reset"]

    /**
     * Retrieves a decrypter transform.
     * @param {Pointer<Guid>} riid Interface identifier (IID) of the interface being requested. Currently this value must be IID_IMFTransform, which requests the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface.
     * @returns {Pointer<Void>} Receives a pointer to the interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfinputtrustauthority-getdecrypter
     */
    GetDecrypter(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Requests permission to perform a specified action on the stream.
     * @param {Integer} Action The requested action, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfpolicymanager_action">MFPOLICYMANAGER_ACTION</a> enumeration.
     * @returns {IMFActivate} Receives the value <b>NULL</b> or a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. The <b>IMFActivate</b> interface is used to create a content enabler object. The caller must release the interface. For more information, see Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfinputtrustauthority-requestaccess
     */
    RequestAccess(Action) {
        result := ComCall(4, this, "int", Action, "ptr*", &ppContentEnablerActivate := 0, "HRESULT")
        return IMFActivate(ppContentEnablerActivate)
    }

    /**
     * Retrieves the policy that defines which output protection systems are allowed for this stream, and the configuration data for each protection system.
     * @param {Integer} Action The action that will be performed on this stream, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfpolicymanager_action">MFPOLICYMANAGER_ACTION</a> enumeration.
     * @returns {IMFOutputPolicy} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfoutputpolicy">IMFOutputPolicy</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfinputtrustauthority-getpolicy
     */
    GetPolicy(Action) {
        result := ComCall(5, this, "int", Action, "ptr*", &ppPolicy := 0, "HRESULT")
        return IMFOutputPolicy(ppPolicy)
    }

    /**
     * Notifies the input trust authority (ITA) that a requested action is about to be performed.
     * @param {Pointer<MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS>} pParam Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mfinputtrustauthority_access_params">MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS</a> structure that contains parameters for the <b>BindAccess</b> action.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfinputtrustauthority-bindaccess
     */
    BindAccess(pParam) {
        result := ComCall(6, this, "ptr", pParam, "HRESULT")
        return result
    }

    /**
     * Notifies the input trust authority (ITA) when the number of output trust authorities (OTAs) that will perform a specified action has changed.
     * @param {Pointer<MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS>} pParam Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mfinputtrustauthority_access_params">MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS</a> structure that contains parameters for the <b>UpdateAccess</b> action.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfinputtrustauthority-updateaccess
     */
    UpdateAccess(pParam) {
        result := ComCall(7, this, "ptr", pParam, "HRESULT")
        return result
    }

    /**
     * Resets the input trust authority (ITA) to its initial state.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfinputtrustauthority-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}

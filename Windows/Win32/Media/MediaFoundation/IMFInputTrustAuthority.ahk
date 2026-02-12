#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFActivate.ahk
#Include .\IMFOutputPolicy.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables other components in the protected media path (PMP) to use the input protection system provided by an input trust authorities (ITA).
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfinputtrustauthority
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
     * @remarks
     * The decrypter should be created in a disabled state, where any calls to <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">IMFTransform::ProcessOutput</a> automatically fail. After the input trust authority (ITA) has verified that it is running inside the protected media path (PMP), the ITA should enable the decrypter.
     * 
     * An ITA is not required to provide a decrypter. If the source content is not encrypted, the method should return MF_E_NOT_PROTECTED. The PMP will then proceed without using a decrypter for that stream.
     * 
     * The ITA must create a new instance of its decrypter for each call to <b>GetDecrypter</b>. Do not return multiple references to the same decrypter. They must be separate instances because the Media Session might place them in two different branches of the topology.
     * @param {Pointer<Guid>} riid Interface identifier (IID) of the interface being requested. Currently this value must be IID_IMFTransform, which requests the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface.
     * @returns {Pointer<Void>} Receives a pointer to the interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfinputtrustauthority-getdecrypter
     */
    GetDecrypter(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Requests permission to perform a specified action on the stream.
     * @remarks
     * This method verifies whether the user has permission to perform a specified action on the stream. The ITA does any work needed to verify the user's right to perform the action, such as checking licenses.
     * 
     * To verify the user's rights, the ITA might need to perform additional steps that require interaction with the user or consent from the user. For example, it might need to acquire a new license or individualize a DRM component. In that case, the ITA creates an activation object for a content enabler and returns the activation object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface in the <i>ppContentEnablerActivate</i> parameter. The activation object is responsible for creating a content enabler that exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentenabler">IMFContentEnabler</a> interface. The content enabler is used as follows:
     * 
     * <ol>
     * <li>
     * The Media Session returns the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> pointer to the application.
     * 
     * </li>
     * <li>
     * The application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> to activate the content enabler.
     * 
     * </li>
     * <li>
     * The application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentenabler">IMFContentEnabler</a> methods to perform whatever actions are needed, such as individualization or obtaining a license. The content enabler object must encapsulate this functionality through the <b>IMFContentEnabler</b> interface.
     * 
     * </li>
     * <li>
     * The Media Session calls <b>RequestAccess</b> again.
     * 
     * </li>
     * </ol>
     * The return value signals whether the user has permission to perform the action:
     * 
     * <ul>
     * <li>
     * If the user already has permission to perform the action, the method returns S_OK and sets *<i>ppContentEnablerActivate</i> to <b>NULL</b>.
     * 
     * </li>
     * <li>
     * If the user does not have permission, the method returns a failure code and sets *<i>ppContentEnablerActivate</i> to <b>NULL</b>.
     * 
     * </li>
     * <li>
     * If the ITA must perform additional steps that require interaction with the user, the method returns a failure code and returns the content enabler's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> pointer in <i>ppContentEnablerActivate</i>.
     * 
     * </li>
     * </ul>
     * The Media Session will not allow the action unless this method returns S_OK. However, a return value of S_OK does not guarantee that the action will be performed, because some other failure might occur after this method is called. When the action is definitely about to happen, the Media Session calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfinputtrustauthority-bindaccess">IMFInputTrustAuthority::BindAccess</a>.
     * 
     * A stream can go to multiple outputs, so this method might be called multiple times with different actions, once for every output.
     * @param {Integer} Action The requested action, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfpolicymanager_action">MFPOLICYMANAGER_ACTION</a> enumeration.
     * @returns {IMFActivate} Receives the value <b>NULL</b> or a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. The <b>IMFActivate</b> interface is used to create a content enabler object. The caller must release the interface. For more information, see Remarks.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfinputtrustauthority-requestaccess
     */
    RequestAccess(Action) {
        result := ComCall(4, this, "int", Action, "ptr*", &ppContentEnablerActivate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFActivate(ppContentEnablerActivate)
    }

    /**
     * Retrieves the policy that defines which output protection systems are allowed for this stream, and the configuration data for each protection system.
     * @param {Integer} Action The action that will be performed on this stream, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfpolicymanager_action">MFPOLICYMANAGER_ACTION</a> enumeration.
     * @returns {IMFOutputPolicy} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfoutputpolicy">IMFOutputPolicy</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfinputtrustauthority-getpolicy
     */
    GetPolicy(Action) {
        result := ComCall(5, this, "int", Action, "ptr*", &ppPolicy := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFOutputPolicy(ppPolicy)
    }

    /**
     * Notifies the input trust authority (ITA) that a requested action is about to be performed.
     * @remarks
     * Before calling this method, the Media Session calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfinputtrustauthority-requestaccess">IMFInputTrustAuthority::RequestAccess</a> to request an action. The <b>BindAccess</b> method notifies the ITA that the action is definitely about to occur, so that the ITA can update its internal state as needed. If the method returns a failure code, the Media Session cancels the action.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfinputtrustauthority-bindaccess
     */
    BindAccess(pParam) {
        result := ComCall(6, this, "ptr", pParam, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the input trust authority (ITA) when the number of output trust authorities (OTAs) that will perform a specified action has changed.
     * @remarks
     * The ITA can update its internal state if needed. If the method returns a failure code, the Media Session cancels the action.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfinputtrustauthority-updateaccess
     */
    UpdateAccess(pParam) {
        result := ComCall(7, this, "ptr", pParam, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Resets the input trust authority (ITA) to its initial state.
     * @remarks
     * When this method is called, the ITA should disable any decrypter that was returned in the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfinputtrustauthority-getdecrypter">IMFInputTrustAuthority::GetDecrypter</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfinputtrustauthority-reset
     */
    Reset() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

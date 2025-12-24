#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables playback of protected content by providing the application with a pointer to a content enabler object.
 * @remarks
 * 
 * A <i>content enabler</i> is an object that performs some action that is required to play a piece of protected content. For example, the action might be obtaining a DRM license. Content enablers expose the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentenabler">IMFContentEnabler</a> interface, which defines a generic mechanism for content enabler. Content enablers are created inside the protected media path (PMP) process. However, they must be invoked from the application process. Therefore, the <b>IMFContentProtectionManager</b> interface provides a way for the PMP Media Session to notify the application.
 * 
 * To use this interface, do the following:
 * 
 * <ol>
 * <li>
 * Implement the interface in your application.
 * 
 * </li>
 * <li>
 * Create an attribute store by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateattributes">MFCreateAttributes</a>.
 * 
 * </li>
 * <li>
 * Set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-session-content-protection-manager-attribute">MF_SESSION_CONTENT_PROTECTION_MANAGER</a> attribute on the attribute store. The attribute value is a pointer to your <b>IMFContentProtectionManager</b> implementation.
 * 
 * </li>
 * <li>
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatepmpmediasession">MFCreatePMPMediaSession</a> and pass the attribute store in the <i>pConfiguration</i> parameter.
 * 
 * </li>
 * </ol>
 * If the content requires a content enabler, the application's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfcontentprotectionmanager-beginenablecontent">BeginEnableContent</a> method is called. Usually this method called during the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasession-settopology">IMFMediaSession::SetTopology</a> operation, before the Media Session raises the <a href="https://docs.microsoft.com/windows/desktop/medfound/mesessiontopologyset">MESessionTopologySet</a> event. The application might receive multiple <b>BeginEnableContent</b> calls for a single piece of content. The MESessionTopologySet event signals that the content-enabling process is complete for the current topology. The <b>BeginEnableContent</b> method can also be called outside of the <b>SetTopology</b> operation, but less commonly.
 * 
 * Many content enablers send machine-specific data to the network, which can have privacy implications. One of the purposes of the <b>IMFContentProtectionManager</b> interface is to give applications an opportunity to display information to the user and enable to user to opt in or out of the process.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfcontentprotectionmanager
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFContentProtectionManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFContentProtectionManager
     * @type {Guid}
     */
    static IID => Guid("{acf92459-6a61-42bd-b57c-b43e51203cb0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginEnableContent", "EndEnableContent"]

    /**
     * Begins an asynchronous request to perform a content enabling action.
     * @param {IMFActivate} pEnablerActivate Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface of a content enabler object. To create the content enabler, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> and request the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentenabler">IMFContentEnabler</a> interface. The application should use the methods in <b>IMFContentEnabler</b> to complete the content enabling action.
     * @param {IMFTopology} pTopo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the pending topology.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. When the operation is complete, the application should call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> on the callback.
     * @param {IUnknown} punkState Reserved. Currently this parameter is always <b>NULL</b>.
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
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfcontentprotectionmanager-beginenablecontent
     */
    BeginEnableContent(pEnablerActivate, pTopo, pCallback, punkState) {
        result := ComCall(3, this, "ptr", pEnablerActivate, "ptr", pTopo, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * Ends an asynchronous request to perform a content enabling action. This method is called by the protected media path (PMP) to complete an asynchronous call to IMFContentProtectionManager::BeginEnableContent.
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. This pointer is the same value that the application passed to the caller's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfcontentprotectionmanager-endenablecontent
     */
    EndEnableContent(pResult) {
        result := ComCall(4, this, "ptr", pResult, "HRESULT")
        return result
    }
}

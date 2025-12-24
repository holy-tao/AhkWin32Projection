#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleWindow.ahk

/**
 * Provides a direct channel of communication between an in-place object and the associated application's outer-most frame window and the document window within the application that contains the embedded object.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleinplaceactiveobject
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceActiveObject extends IOleWindow{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleInPlaceActiveObject
     * @type {Guid}
     */
    static IID => Guid("{00000117-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TranslateAccelerator", "OnFrameWindowActivate", "OnDocWindowActivate", "ResizeBorder", "EnableModeless"]

    /**
     * Processes menu accelerator-key messages from the container's message queue. This method should only be used for objects created by a DLL object application.
     * @param {Pointer<MSG>} lpmsg A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a> structure for the message that might need to be translated.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message was not translated.
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
     * The specified parameter values are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IThere is insufficient memory available for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplaceactiveobject-translateaccelerator
     */
    TranslateAccelerator(lpmsg) {
        result := ComCall(5, this, "ptr", lpmsg, "HRESULT")
        return result
    }

    /**
     * Notifies the object when the container's top-level frame window is activated or deactivated.
     * @param {BOOL} fActivate The state of the container's top-level frame window. This parameter is <b>TRUE</b> if the window is activating and <b>FALSE</b> if it is deactivating.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplaceactiveobject-onframewindowactivate
     */
    OnFrameWindowActivate(fActivate) {
        result := ComCall(6, this, "int", fActivate, "HRESULT")
        return result
    }

    /**
     * Notifies the active in-place object when the container's document window is activated or deactivated.
     * @param {BOOL} fActivate The state of the MDI child document window. If this parameter is <b>TRUE</b>, the window is in the act of activating; if it is <b>FALSE</b>, it is in the act of deactivating.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplaceactiveobject-ondocwindowactivate
     */
    OnDocWindowActivate(fActivate) {
        result := ComCall(7, this, "int", fActivate, "HRESULT")
        return result
    }

    /**
     * Alerts the object that it needs to resize its border space.
     * @param {Pointer<RECT>} prcBorder A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the new outer rectangle within which the object can request border space for its tools.
     * @param {IOleInPlaceUIWindow} pUIWindow A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceuiwindow">IOleInPlaceUIWindow</a> interface pointer for the frame or document window object whose border has changed.
     * @param {BOOL} fFrameWindow This parameter is <b>TRUE</b> if the frame window object is calling <b>IOleInPlaceActiveObject::ResizeBorder</b>; otherwise, it is <b>FALSE</b>.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified parameter values are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory available for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplaceactiveobject-resizeborder
     */
    ResizeBorder(prcBorder, pUIWindow, fFrameWindow) {
        result := ComCall(8, this, "ptr", prcBorder, "ptr", pUIWindow, "int", fFrameWindow, "HRESULT")
        return result
    }

    /**
     * Enables or disables modeless dialog boxes when the container creates or destroys a modal dialog box.
     * @param {BOOL} fEnable Indicates whether to enable modeless dialog box windows (<b>TRUE</b>) or disable them <b>FALSE</b>.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-ioleinplaceactiveobject-enablemodeless
     */
    EnableModeless(fEnable) {
        result := ComCall(9, this, "int", fEnable, "HRESULT")
        return result
    }
}

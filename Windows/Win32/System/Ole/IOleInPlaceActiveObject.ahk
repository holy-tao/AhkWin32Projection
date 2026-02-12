#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleWindow.ahk

/**
 * Provides a direct channel of communication between an in-place object and the associated application's outer-most frame window and the document window within the application that contains the embedded object.
 * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nn-oleidl-ioleinplaceactiveobject
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
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Active in-place objects must always be given the first chance at translating accelerator keystrokes. You can provide this opportunity by calling <b>IOleInPlaceActiveObject::TranslateAccelerator</b> from your container's message loop before doing any other translation. You should apply your own translation only when this method returns S_FALSE.
     * 
     * If you call <b>IOleInPlaceActiveObject::TranslateAccelerator</b> for an object that is not created by a DLL object application, the default object handler returns S_FALSE.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * An object created by an EXE object application gets keystrokes from its own message pump, so the container does not get those messages.
     * 
     * If you need to implement this method, you can do so by simply wrapping the call to the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/cbasepropertypage-translateaccelerator">TranslateAccelerator</a> function.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceactiveobject-translateaccelerator
     */
    TranslateAccelerator(lpmsg) {
        result := ComCall(5, this, "ptr", lpmsg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the object when the container's top-level frame window is activated or deactivated.
     * @param {BOOL} fActivate The state of the container's top-level frame window. This parameter is <b>TRUE</b> if the window is activating and <b>FALSE</b> if it is deactivating.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceactiveobject-onframewindowactivate
     */
    OnFrameWindowActivate(fActivate) {
        result := ComCall(6, this, "int", fActivate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the active in-place object when the container's document window is activated or deactivated.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Call <b>IOleInPlaceActiveObject::OnDocWindowActivate</b> when the MDI child document window is activated or deactivated and the object is currently the active object for the document.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * You should include code in this method that installs frame-level tools during object activation. These tools include the shared composite menu and/or optional toolbars and frame adornments. You should then take focus. When deactivating, the object should remove the frame-level tools. Note that if you do not call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceuiwindow-setborderspace">IOleInPlaceUIWindow::SetBorderSpace</a> with pborderwidths set to <b>NULL</b>, you can avoid having to renegotiate border space.
     * 
     * While executing <b>IOleInPlaceActiveObject::OnDocWindowActivate</b>, do not make calls to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountincomingarchive-getmessage-vb">GetMessage</a> functions, or a dialog box. Doing so may cause the system to deadlock. There are further restrictions on which OLE interface methods and functions can be called from within <b>IOleInPlaceActiveObject::OnDocWindowActivate</b>.
     * @param {BOOL} fActivate The state of the MDI child document window. If this parameter is <b>TRUE</b>, the window is in the act of activating; if it is <b>FALSE</b>, it is in the act of deactivating.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceactiveobject-ondocwindowactivate
     */
    OnDocWindowActivate(fActivate) {
        result := ComCall(7, this, "int", fActivate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Alerts the object that it needs to resize its border space.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * <b>IOleInPlaceActiveObject::ResizeBorder</b> is called by the top-level container's document or frame window object when the border space allocated to the object should change. Because the active in-place object is not informed about which window has changed (the frame- or document-level window), <b>IOleInPlaceActiveObject::ResizeBorder</b> must be passed the pointer to the window's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceuiwindow">IOleInPlaceUIWindow</a> interface.
     * 
     * 
     * <h3><a id="Notes_to_Implemeters"></a><a id="notes_to_implemeters"></a><a id="NOTES_TO_IMPLEMETERS"></a>Notes to Implementers</h3>
     * In most cases, resizing only requires that you grow, shrink, or scale your object's frame adornments. However, for more complicated adornments, you may be required to renegotiate for border space with calls to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleinplaceuiwindow-setborderspace">IOleInPlaceUIWindow::SetBorderSpace</a> and <b>IOleInPlaceUIWindow::SetBorderSpace</b>.
     * 
     * <div class="alert"><b>Note</b>  While executing <b>IOleInPlaceActiveObject::ResizeBorder</b>, do not make calls to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountincomingarchive-getmessage-vb">GetMessage</a> functions, or a dialog box. Doing so may cause the system to deadlock. There are further restrictions on which OLE interface methods and functions can be called from within <b>IOleInPlaceActiveObject::ResizeBorder</b>.</div>
     * <div> </div>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceactiveobject-resizeborder
     */
    ResizeBorder(prcBorder, pUIWindow, fFrameWindow) {
        result := ComCall(8, this, "ptr", prcBorder, "ptr", pUIWindow, "int", fFrameWindow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables or disables modeless dialog boxes when the container creates or destroys a modal dialog box.
     * @param {BOOL} fEnable Indicates whether to enable modeless dialog box windows (<b>TRUE</b>) or disable them <b>FALSE</b>.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-ioleinplaceactiveobject-enablemodeless
     */
    EnableModeless(fEnable) {
        result := ComCall(9, this, "int", fEnable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

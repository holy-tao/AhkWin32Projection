#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IDropSource interface is one of the interfaces you implement to provide drag-and-drop operations in your application.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-idropsource
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IDropSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDropSource
     * @type {Guid}
     */
    static IID => Guid("{00000121-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryContinueDrag", "GiveFeedback"]

    /**
     * Determines whether a drag-and-drop operation should be continued, canceled, or completed. You do not call this method directly. The OLE DoDragDrop function calls this method during a drag-and-drop operation.
     * @param {BOOL} fEscapePressed Indicates whether the Esc key has been pressed since the previous call to <b>QueryContinueDrag</b> or to <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a> if this is the first call to <b>QueryContinueDrag</b>. A <b>TRUE</b> value indicates the end user has pressed the escape key; a <b>FALSE</b> value indicates it has not been pressed.
     * @param {Integer} grfKeyState The current state of the keyboard modifier keys on the keyboard. Possible values can be a combination of any of the flags MK_CONTROL, MK_SHIFT, MK_ALT, MK_BUTTON, MK_LBUTTON, MK_MBUTTON, and MK_RBUTTON.
     * @returns {HRESULT} This method can return the following values.
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
     * The drag operation should continue. This result occurs if no errors are detected, the mouse button starting the drag-and-drop operation has not been released, and the Esc key has not been detected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRAGDROP_S_DROP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drop operation should occur completing the drag operation. This result occurs if <i>grfKeyState</i> indicates that the key that started the drag-and-drop operation has been released.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRAGDROP_S_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drag operation should be canceled with no drop operation occurring. This result occurs if <i>fEscapePressed</i> is <b>TRUE</b>, indicating the Esc key has been pressed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-idropsource-querycontinuedrag
     */
    QueryContinueDrag(fEscapePressed, grfKeyState) {
        result := ComCall(3, this, "int", fEscapePressed, "uint", grfKeyState, "int")
        return result
    }

    /**
     * Enables a source application to give visual feedback to the end user during a drag-and-drop operation by providing the DoDragDrop function with an enumeration value specifying the visual effect.
     * @param {Integer} dwEffect The <a href="https://docs.microsoft.com/windows/desktop/com/dropeffect-constants">DROPEFFECT</a> value returned by the most recent call to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragenter">IDropTarget::DragEnter</a>, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragover">IDropTarget::DragOver</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragleave">IDropTarget::DragLeave</a>.
     * @returns {HRESULT} This method returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRAGDROP_S_USEDEFAULTCURSORS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates successful completion of the method, and requests OLE to update the cursor using the OLE-provided default cursors.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-idropsource-givefeedback
     */
    GiveFeedback(dwEffect) {
        result := ComCall(4, this, "uint", dwEffect, "int")
        return result
    }
}

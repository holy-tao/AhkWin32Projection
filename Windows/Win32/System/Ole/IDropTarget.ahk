#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IDropTarget interface is one of the interfaces you implement to provide drag-and-drop operations in your application.
 * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nn-oleidl-idroptarget
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IDropTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDropTarget
     * @type {Guid}
     */
    static IID => Guid("{00000122-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DragEnter", "DragOver", "DragLeave", "Drop"]

    /**
     * Indicates whether a drop can be accepted, and, if so, the effect of the drop.
     * @remarks
     * You do not call <b>DragEnter</b> directly; instead the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a> function calls it to determine the effect of a drop the first time the user drags the mouse into the registered window of a drop target.
     * 
     * To implement <b>DragEnter</b>, you must determine whether the target can use the data in the source data object by checking three things:
     * 
     * <ul>
     * <li>The format and medium specified by the data object</li>
     * <li>The input value of <i>pdwEffect</i></li>
     * <li>The state of the modifier keys</li>
     * </ul>
     * To check the format and medium, use the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> pointer passed in the <i>pDataObject</i> parameter to call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-enumformatetc">IDataObject::EnumFormatEtc</a> so you can enumerate the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures the source data object supports. Then call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-querygetdata">IDataObject::QueryGetData</a> to determine whether the data object can render the data on the target by examining the formats and medium specified for the data object.
     * 
     * On entry to <b>IDropTarget::DragEnter</b>, the <i>pdwEffect</i> parameter is set to the effects given to the <i>pdwOkEffect</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a> function. The <b>IDropTarget::DragEnter</b> method must choose one of these effects or disable the drop.
     * 
     * The following modifier keys affect the result of the drop.
     * 
     * <table>
     * <tr>
     * <th>Key Combination</th>
     * <th>User-Visible Feedback</th>
     * <th>Drop Effect</th>
     * </tr>
     * <tr>
     * <td>CTRL + SHIFT
     * </td>
     * <td>=</td>
     * <td>DROPEFFECT_LINK
     * </td>
     * </tr>
     * <tr>
     * <td>CTRL
     * </td>
     * <td>+
     * </td>
     * <td>DROPEFFECT_COPY
     * </td>
     * </tr>
     * <tr>
     * <td>No keys or SHIFT
     * </td>
     * <td>None
     * </td>
     * <td>DROPEFFECT_MOVE
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * On return, the method must write the effect, one of the DROPEFFECT flags, to the <i>pdwEffect</i> parameter. <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a> then takes this parameter and writes it to its <i>pdwEffect</i> parameter. You communicate the effect of the drop back to the source through <b>DoDragDrop</b> in the <i>pdwEffect</i> parameter. The <b>DoDragDrop</b> function then calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idropsource-givefeedback">IDropSource::GiveFeedback</a> so that the source application can display the appropriate visual feedback to the user through the target window.
     * @param {IDataObject} pDataObj A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object. This data object contains the data being transferred in the drag-and-drop operation. If the drop occurs, this data object will be incorporated into the target.
     * @param {Integer} grfKeyState The current state of the keyboard modifier keys on the keyboard. Possible values can be a combination of any of the flags MK_CONTROL, MK_SHIFT, MK_ALT, MK_BUTTON, MK_LBUTTON, MK_MBUTTON, and MK_RBUTTON.
     * @param {POINTL} pt A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure containing the current cursor coordinates in screen coordinates.
     * @param {Pointer<Integer>} pdwEffect On input, pointer to the value of the <i>pdwEffect</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a> function. On return, must contain one of the <a href="https://docs.microsoft.com/windows/desktop/com/dropeffect-constants">DROPEFFECT</a> flags, which indicates what the result of the drop operation would be.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
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
     * The <i>pdwEffect</i> parameter is <b>NULL</b> on input.
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
     * There was insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-idroptarget-dragenter
     */
    DragEnter(pDataObj, grfKeyState, pt, pdwEffect) {
        pdwEffectMarshal := pdwEffect is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pDataObj, "uint", grfKeyState, "ptr", pt, pdwEffectMarshal, pdwEffect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Provides target feedback to the user and communicates the drop's effect to the DoDragDrop function so it can communicate the effect of the drop back to the source.
     * @remarks
     * You do not call <b>DragOver</b> directly. The <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a> function calls this method each time the user moves the mouse across a given target window. <b>DoDragDrop</b> exits the loop if the drag-and-drop operation is canceled, if the user drags the mouse out of the target window, or if the drop is completed.
     * 
     * In implementing <b>IDropTarget::DragOver</b>, you must provide features similar to those in <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragenter">IDropTarget::DragEnter</a>. You must determine the effect of dropping the data on the target by examining the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> defining the data object's formats and medium, along with the state of the modifier keys. The mouse position may also play a role in determining the effect of a drop. The following modifier keys affect the result of the drop.
     * 
     * <table>
     * <tr>
     * <th>Key Combination</th>
     * <th>User-Visible Feedback</th>
     * <th>Drop Effect</th>
     * </tr>
     * <tr>
     * <td>CTRL + SHIFT
     * </td>
     * <td>=</td>
     * <td>DROPEFFECT_LINK
     * </td>
     * </tr>
     * <tr>
     * <td>CTRL
     * </td>
     * <td>+
     * </td>
     * <td>DROPEFFECT_COPY
     * </td>
     * </tr>
     * <tr>
     * <td>No keys or SHIFT
     * </td>
     * <td>None
     * </td>
     * <td>DROPEFFECT_MOVE
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * You communicate the effect of the drop back to the source through <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a> in <i>pdwEffect</i>. The <b>DoDragDrop</b> function then calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idropsource-givefeedback">IDropSource::GiveFeedback</a> so the source application can display the appropriate visual feedback to the user.
     * 
     * On entry to <b>IDropTarget::DragOver</b>, the <i>pdwEffect</i> parameter must be set to the allowed effects passed to the <i>pdwOkEffect</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a> function. The <b>IDropTarget::DragOver</b> method must be able to choose one of these effects or disable the drop.
     * 
     * Upon return, <i>pdwEffect</i> is set to one of the DROPEFFECT flags. This value is then passed to the <i>pdwEffect</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a>. Reasonable values are DROPEFFECT_COPY to copy the dragged data to the target, DROPEFFECT_LINK to create a link to the source data, or DROPEFFECT_MOVE to allow the dragged data to be permanently moved from the source application to the target.
     * 
     * You may also wish to provide appropriate visual feedback in the target window. There may be some target feedback already displayed from a previous call to <b>IDropTarget::DragOver</b> or from the initial <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragenter">IDropTarget::DragEnter</a>. If this feedback is no longer appropriate, you should remove it.
     * 
     * For efficiency reasons, a data object is not passed in <b>IDropTarget::DragOver</b>. The data object passed in the most recent call to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragenter">IDropTarget::DragEnter</a> is available and can be used.
     * 
     * When <b>IDropTarget::DragOver</b> has completed its operation, the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a> function calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idropsource-givefeedback">IDropSource::GiveFeedback</a> so the source application can display the appropriate visual feedback to the user.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * This function is called frequently during the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a> loop so it makes sense to optimize your implementation of the <b>DragOver</b> method as much as possible.
     * @param {Integer} grfKeyState The current state of the keyboard modifier keys on the keyboard. Valid values can be a combination of any of the flags MK_CONTROL, MK_SHIFT, MK_ALT, MK_BUTTON, MK_LBUTTON, MK_MBUTTON, and MK_RBUTTON.
     * @param {POINTL} pt A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure containing the current cursor coordinates in screen coordinates.
     * @param {Pointer<Integer>} pdwEffect On input, pointer to the value of the <i>pdwEffect</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a> function. On return, must contain one of the <a href="https://docs.microsoft.com/windows/desktop/com/dropeffect-constants">DROPEFFECT</a> flags, which indicates what the result of the drop operation would be.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
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
     * The <i>pdwEffect</i> value is not valid.
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
     * There was insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-idroptarget-dragover
     */
    DragOver(grfKeyState, pt, pdwEffect) {
        pdwEffectMarshal := pdwEffect is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", grfKeyState, "ptr", pt, pdwEffectMarshal, pdwEffect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes target feedback and releases the data object.
     * @remarks
     * You do not call this method directly. The <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a> function calls this method in either of the following cases:
     * 
     * <ul>
     * <li>When the user drags the cursor out of a given target window.</li>
     * <li>When the user cancels the current drag-and-drop operation.</li>
     * </ul>
     * To implement <b>IDropTarget::DragLeave</b>, you must remove any target feedback that is currently displayed. You must also release any references you hold to the data transfer object.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-idroptarget-dragleave
     */
    DragLeave() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Incorporates the source data into the target window, removes target feedback, and releases the data object.
     * @remarks
     * You do not call this method directly. The <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a> function calls this method when the user completes the drag-and-drop operation.
     * 
     * In implementing <b>Drop</b>, you must incorporate the data object into the target. Use the formats available in <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>, available through <i>pDataObj</i>, along with the current state of the modifier keys to determine how the data is to be incorporated, such as linking or embedding.
     * 
     * In addition to incorporating the data, you must also clean up as you do in the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragleave">IDropTarget::DragLeave</a> method:
     * 
     * <ul>
     * <li>Remove any target feedback that is currently displayed.</li>
     * <li>Release any references to the data object.</li>
     * </ul>
     * You also pass the effect of this operation back to the source application through <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a>, so the source application can clean up after the drag-and-drop operation is complete:
     * 
     * <ul>
     * <li>Remove any source feedback that is being displayed.</li>
     * <li>Make any necessary changes to the data, such as removing the data if the operation was a move.</li>
     * </ul>
     * @param {IDataObject} pDataObj A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object being transferred in the drag-and-drop operation.
     * @param {Integer} grfKeyState The current state of the keyboard modifier keys on the keyboard. Possible values can be a combination of any of the flags MK_CONTROL, MK_SHIFT, MK_ALT, MK_BUTTON, MK_LBUTTON, MK_MBUTTON, and MK_RBUTTON.
     * @param {POINTL} pt A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure containing the current cursor coordinates in screen coordinates.
     * @param {Pointer<Integer>} pdwEffect On input, pointer to the value of the <i>pdwEffect</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a> function. On return, must contain one of the <a href="https://docs.microsoft.com/windows/desktop/com/dropeffect-constants">DROPEFFECT</a> flags, which indicates what the result of the drop operation would be.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
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
     * The <i>pdwEffect</i> parameter is not valid.
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
     * There is insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/oleidl/nf-oleidl-idroptarget-drop
     */
    Drop(pDataObj, grfKeyState, pt, pdwEffect) {
        pdwEffectMarshal := pdwEffect is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pDataObj, "uint", grfKeyState, "ptr", pt, pdwEffectMarshal, pdwEffect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

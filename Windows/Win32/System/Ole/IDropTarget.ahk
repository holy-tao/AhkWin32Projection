#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IDropTarget interface is one of the interfaces you implement to provide drag-and-drop operations in your application.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-idroptarget
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
     * @param {IDataObject} pDataObj A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object. This data object contains the data being transferred in the drag-and-drop operation. If the drop occurs, this data object will be incorporated into the target.
     * @param {Integer} grfKeyState The current state of the keyboard modifier keys on the keyboard. Possible values can be a combination of any of the flags MK_CONTROL, MK_SHIFT, MK_ALT, MK_BUTTON, MK_LBUTTON, MK_MBUTTON, and MK_RBUTTON.
     * @param {POINTL} pt A <a href="https://docs.microsoft.com/previous-versions/dd162807(v=vs.85)">POINTL</a> structure containing the current cursor coordinates in screen coordinates.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-idroptarget-dragenter
     */
    DragEnter(pDataObj, grfKeyState, pt, pdwEffect) {
        pdwEffectMarshal := pdwEffect is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pDataObj, "uint", grfKeyState, "ptr", pt, pdwEffectMarshal, pdwEffect, "HRESULT")
        return result
    }

    /**
     * Provides target feedback to the user and communicates the drop's effect to the DoDragDrop function so it can communicate the effect of the drop back to the source.
     * @param {Integer} grfKeyState The current state of the keyboard modifier keys on the keyboard. Valid values can be a combination of any of the flags MK_CONTROL, MK_SHIFT, MK_ALT, MK_BUTTON, MK_LBUTTON, MK_MBUTTON, and MK_RBUTTON.
     * @param {POINTL} pt A <a href="https://docs.microsoft.com/previous-versions/dd162807(v=vs.85)">POINTL</a> structure containing the current cursor coordinates in screen coordinates.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-idroptarget-dragover
     */
    DragOver(grfKeyState, pt, pdwEffect) {
        pdwEffectMarshal := pdwEffect is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", grfKeyState, "ptr", pt, pdwEffectMarshal, pdwEffect, "HRESULT")
        return result
    }

    /**
     * Removes target feedback and releases the data object.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-idroptarget-dragleave
     */
    DragLeave() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Incorporates the source data into the target window, removes target feedback, and releases the data object.
     * @param {IDataObject} pDataObj A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface on the data object being transferred in the drag-and-drop operation.
     * @param {Integer} grfKeyState The current state of the keyboard modifier keys on the keyboard. Possible values can be a combination of any of the flags MK_CONTROL, MK_SHIFT, MK_ALT, MK_BUTTON, MK_LBUTTON, MK_MBUTTON, and MK_RBUTTON.
     * @param {POINTL} pt A <a href="https://docs.microsoft.com/previous-versions/dd162807(v=vs.85)">POINTL</a> structure containing the current cursor coordinates in screen coordinates.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-idroptarget-drop
     */
    Drop(pDataObj, grfKeyState, pt, pdwEffect) {
        pdwEffectMarshal := pdwEffect is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pDataObj, "uint", grfKeyState, "ptr", pt, pdwEffectMarshal, pdwEffect, "HRESULT")
        return result
    }
}

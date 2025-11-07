#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow drop targets to display a drag image while the image is over the target window.
 * @remarks
 * 
 * This interface is exposed by the Shell's drag-image manager. It is not implemented by applications.
 * 
 * This interface is used by drop targets to enable the drag-image manager to display the drag image while the image is over the target window. The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idragsourcehelper">IDragSourceHelper</a> and <b>IDropTargetHelper</b> interfaces are exposed by the drag-image manager object to allow the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a> interface to use custom drag images. To use either of these interfaces, you must create an in-process server drag-image manager object by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with a class identifier (CLSID) of CLSID_DragDropHelper. Get interface pointers using standard Component Object Model (COM) procedures.
 * 
 * Four of the <b>IDropTargetHelper</b> methods correspond to the four <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a> methods. When you implement <b>IDropTarget</b>, each of its methods should call the corresponding <b>IDropTargetHelper</b> method to pass the information to the drag-image manager. The fifth <b>IDropTargetHelper</b> method notifies the drag-image manager to show or hide the drag image. This method is used when dragging over a target window in a low color-depth video mode. It allows the target to hide the drag image while it is painting the window.
 * 
 * <div class="alert"><b>Note</b>   The drag-and-drop helper object calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-setdata">IDataObject::SetData</a> to load private formats—used for cross-process support—into the data object. It later retrieves these formats by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a>. To support the drag-and-drop helper object, the data object's <b>SetData</b> and <b>GetData</b> implementations must be able to accept and return arbitrary private formats.</div>
 * <div> </div>
 * For further discussion of Shell drag-and-drop operations, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb776905(v=vs.85)">Transferring Shell Data Using Drag-and-Drop or the Clipboard</a>.
 * 
 * <div class="alert"><b>Note</b>   Prior to Windows Vista this interface was declared in Shlobj.h.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-idroptargethelper
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDropTargetHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDropTargetHelper
     * @type {Guid}
     */
    static IID => Guid("{4657278b-411b-11d2-839a-00c04fd918d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DragEnter", "DragLeave", "DragOver", "Drop", "Show"]

    /**
     * 
     * @param {HWND} hwndTarget 
     * @param {IDataObject} pDataObject 
     * @param {Pointer<POINT>} ppt 
     * @param {Integer} dwEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idroptargethelper-dragenter
     */
    DragEnter(hwndTarget, pDataObject, ppt, dwEffect) {
        hwndTarget := hwndTarget is Win32Handle ? NumGet(hwndTarget, "ptr") : hwndTarget

        result := ComCall(3, this, "ptr", hwndTarget, "ptr", pDataObject, "ptr", ppt, "uint", dwEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idroptargethelper-dragleave
     */
    DragLeave() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} ppt 
     * @param {Integer} dwEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idroptargethelper-dragover
     */
    DragOver(ppt, dwEffect) {
        result := ComCall(5, this, "ptr", ppt, "uint", dwEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} pDataObject 
     * @param {Pointer<POINT>} ppt 
     * @param {Integer} dwEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idroptargethelper-drop
     */
    Drop(pDataObject, ppt, dwEffect) {
        result := ComCall(6, this, "ptr", pDataObject, "ptr", ppt, "uint", dwEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idroptargethelper-show
     */
    Show(fShow) {
        result := ComCall(7, this, "int", fShow, "HRESULT")
        return result
    }
}

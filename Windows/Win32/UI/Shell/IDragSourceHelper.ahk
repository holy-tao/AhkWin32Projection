#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposed by the Shell to allow an application to specify the image that will be displayed during a Shell drag-and-drop operation.
 * @remarks
 * This interface is exposed by the Shell's drag-image manager. It is not implemented by applications.
 * 
 * Use this interface to specify the image displayed during a Shell drag-and-drop operation. The <b>IDragSourceHelper</b>,  <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-idroptargethelper">IDropTargetHelper</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iinitializewithwindow">IInitializeWithWindow</a> interfaces are exposed by the drag-image manager object to allow the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a> interface to use custom drag images. To use either of these interfaces, you must create an in-process server drag-image manager object by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with a class identifier (CLSID) of CLSID_DragDropHelper. Get interface pointers using standard Component Object Model (COM) procedures.
 * 
 * The <b>IDragSourceHelper</b> interface provides the following two ways to specify the bitmap to be used as a drag image.
 * 
 * 				
 * 
 * <ul>
 * <li>Controls that have a window can register a DI_GETDRAGIMAGE window message for it and initialize the drag-image manager with <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idragsourcehelper-initializefromwindow">IDragSourceHelper::InitializeFromWindow</a>. When the DI_GETDRAGIMAGE message is received, the handler puts the drag image bitmap information in the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shdragimage">SHDRAGIMAGE</a> structure that is passed as the message's <i>lParam</i> value.</li>
 * <li>Windowless controls can initialize the drag-image manager with <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idragsourcehelper-initializefrombitmap">IDragSourceHelper::InitializeFromBitmap</a>. This method allows an application to simply specify the bitmap.</li>
 * </ul>
 * <div class="alert"><b>Note</b>   The drag-and-drop helper object calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-setdata">IDataObject::SetData</a> to load private formats—used for cross-process support—into the data object. It later retrieves these formats by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a>. To support the drag-and-drop helper object, the data object's <b>SetData</b> and <b>GetData</b> implementations must be able to accept and return arbitrary private formats.</div>
 * <div> </div>
 * For further discussion of Shell drag-and-drop operations, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb776905(v=vs.85)">Transferring Shell Data Using Drag-and-Drop or the Clipboard</a>.
 * 
 * <div class="alert"><b>Note</b>   Prior to Windows Vista this interface was declared in Shlobj.h.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-idragsourcehelper
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDragSourceHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDragSourceHelper
     * @type {Guid}
     */
    static IID => Guid("{de5bf786-477a-11d2-839d-00c04fd918d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromBitmap", "InitializeFromWindow"]

    /**
     * Initializes the drag-image manager for a windowless control.
     * @remarks
     * Because <b>InitializeFromBitmap</b> always performs the RGB multiplication step in calculating the alpha value, you should always pass a bitmap without premultiplied alpha blending. Note that no error will result from passing the method a bitmap with premultiplied alpha blending, but this method will multiply it again, doubling the resulting alpha value.
     * @param {Pointer<SHDRAGIMAGE>} pshdi Type: <b>LPSHDRAGIMAGE</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shdragimage">SHDRAGIMAGE</a> structure that contains information about the bitmap.
     * @param {IDataObject} pDataObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * 
     * A pointer to the data object's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-idragsourcehelper-initializefrombitmap
     */
    InitializeFromBitmap(pshdi, pDataObject) {
        result := ComCall(3, this, "ptr", pshdi, "ptr", pDataObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes the drag-image manager for a control with a window.
     * @remarks
     * The <b>DI_GETDRAGIMAGE</b> message allows you to source a drag image from a custom control. It is defined in Shlobj.h and must be registered with <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a>. When the window specified by <i>hwnd</i> receives the <b>DI_GETDRAGIMAGE</b> message, the <i>lParam</i> value holds a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shdragimage">SHDRAGIMAGE</a> structure. The handler should fill the structure with the drag image bitmap information.
     * @param {HWND} hwnd_ Type: <b>HWND</b>
     * 
     * A handle to the window that receives the <b>DI_GETDRAGIMAGE</b> message. This value can be <b>NULL</b>.
     * @param {Pointer<POINT>} ppt Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that specifies the location of the cursor within the drag image. The structure should contain the offset from the upper-left corner of the drag image to the location of the cursor. This value can be <b>NULL</b>.
     * @param {IDataObject} pDataObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * 
     * A pointer to the data object's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-idragsourcehelper-initializefromwindow
     */
    InitializeFromWindow(hwnd_, ppt, pDataObject) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(4, this, "ptr", hwnd_, "ptr", ppt, "ptr", pDataObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

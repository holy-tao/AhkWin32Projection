#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposed by the Shell to allow an application to specify the image that will be displayed during a Shell drag-and-drop operation.
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-idragsourcehelper
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
     * 
     * @param {Pointer<SHDRAGIMAGE>} pshdi 
     * @param {IDataObject} pDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idragsourcehelper-initializefrombitmap
     */
    InitializeFromBitmap(pshdi, pDataObject) {
        result := ComCall(3, this, "ptr", pshdi, "ptr", pDataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<POINT>} ppt 
     * @param {IDataObject} pDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idragsourcehelper-initializefromwindow
     */
    InitializeFromWindow(hwnd, ppt, pDataObject) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(4, this, "ptr", hwnd, "ptr", ppt, "ptr", pDataObject, "HRESULT")
        return result
    }
}

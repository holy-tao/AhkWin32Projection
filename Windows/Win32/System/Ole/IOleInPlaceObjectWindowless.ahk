#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDropTarget.ahk
#Include .\IOleInPlaceObject.ahk

/**
 * Enables a windowless object to process window messages and participate in drag and drop operations. It is derived from and extends the IOleInPlaceObject interface.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ioleinplaceobjectwindowless
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceObjectWindowless extends IOleInPlaceObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleInPlaceObjectWindowless
     * @type {Guid}
     */
    static IID => Guid("{1c2056cc-5ef4-101b-8bc8-00aa003e3b29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnWindowMessage", "GetDropTarget"]

    /**
     * Dispatches a message from a container to a windowless object that is in-place active.
     * @remarks
     * A container calls this method to send window messages to a windowless object that is in-place active. The container should dispatch messages according to the following guidelines:
     * 
     * For the following messages, the container should first dispatch the message to the windowless object that has captured the mouse, if any. Otherwise, the container should dispatch the message to the windowless object under the mouse cursor. If there is no such object, the container is free to process the following messages for itself:
     * 
     * <ul>
     * <li>WM_MOUSEMOVE</li>
     * <li>WM_SETCURSOR</li>
     * <li>WM_XBUTTONDOWN</li>
     * <li>WM_XBUTTONUP</li>
     * <li>WM_XBUTTONDBLCLK</li>
     * </ul>
     * The container should dispatch the message to the windowless object with the keyboard focus for the following messages:
     * 
     * <ul>
     * <li>WM_CANCELMODE</li>
     * <li>WM_CHAR</li>
     * <li>WM_DEADCHAR</li>
     * <li>WM_HELP</li>
     * <li>WM_IMExxx</li>
     * <li>WM_KEYDOWN</li>
     * <li>WM_KEYUP</li>
     * <li>WM_SYSDEADCHAR</li>
     * <li>WM_SYSKEYDOWN</li>
     * <li>WM_SYSKEYUP</li>
     * </ul>
     * For all other messages, the container should process the message on its own.
     * 
     * The windowless object can return S_FALSE to this method to indicate that it did not process the message. Then, the container either performs the default behavior for the message by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-defwindowproca">DefWindowProc</a> function, or processes the message itself.
     * 
     * The container must pass the following window messages to the default window procedure:
     * 
     * <ul>
     * <li>WM_CHAR</li>
     * <li>WM_DEADCHAR</li>
     * <li>WM_IMExxx</li>
     * <li>WM_KEYDOWN</li>
     * <li>WM_KEYUP</li>
     * <li>WM_MOUSEMOVE</li>
     * <li>WM_SYSCHAR</li>
     * <li>WM_SYSDEADCHAR</li>
     * <li>WM_SYSKEYUP</li>
     * <li>WM_XBUTTONDOWN</li>
     * <li>WM_XBUTTONUP</li>
     * <li>WM_XBUTTONDBLCLK</li>
     * </ul>
     * The container must process the following window messages as its own:
     * 
     * <ul>
     * <li>WM_CONTEXTMENU</li>
     * <li>WM_HELP</li>
     * <li>WM_SETCURSOR</li>
     * </ul>
     * <div class="alert"><b>Note</b>  For WM_SETCURSOR, the container can either set the cursor itself or do nothing.</div>
     * <div> </div>
     * Objects can also use <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ioleinplacesitewindowless-ondefwindowmessage">IOleInPlaceSiteWindowless::OnDefWindowMessage</a> to explicitly invoke the default message processing from the container. In the case of the WM_SETCURSOR message, this allows an object to take action if the container does not set the cursor.
     * 
     * All coordinates passed to the object in <i>wParam</i> and <i>lParam</i> are specified as client coordinates of the containing window.
     * @param {Integer} msg The identifier for the window message provided to the container by Windows.
     * @param {WPARAM} wParam A parameter for the window message provided to the container by Windows.
     * @param {LPARAM} lParam A parameter for the window message provided to the container by Windows.
     * @returns {LRESULT} A pointer to result code for the window message.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplaceobjectwindowless-onwindowmessage
     */
    OnWindowMessage(msg, wParam, lParam) {
        result := ComCall(9, this, "uint", msg, "ptr", wParam, "ptr", lParam, "ptr*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * Retrieves the IDropTarget interface for an in-place active, windowless object that supports drag and drop.
     * @remarks
     * A windowed object registers its <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a> interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-registerdragdrop">RegisterDragDrop</a> function and supplying its window handle as a parameter. Registering its <b>IDropTarget</b> interface enables the object to participate in drag and drop operations. Because it does not have a window when active, a windowless object cannot register its <b>IDropTarget</b> interface. Therefore, it cannot directly participate in drag and drop operations without support from its container.
     * 
     * The following events occur during a drag and drop operation involving windowless objects:
     * 
     * <ul>
     * <li>The container registers its own <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a> interface through the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-registerdragdrop">RegisterDragDrop</a> function.</li>
     * <li>In the container's implementation of its own <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragenter">IDropTarget::DragEnter</a> or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragover">IDropTarget::DragOver</a> methods, the container detects whether the mouse pointer just entered an embedded object.</li>
     * <li>If the object is inactive, the container calls the object's <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipointerinactive-getactivationpolicy">IPointerInactive::GetActivationPolicy</a> method. The object returns the POINTERINACTIVE_ACTIVATEONDRAG flag. The container then activates the object in place. If the object was already active, the container does not have to do this step.</li>
     * <li>After the object is active, the container must then obtain the object's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a> interface.</li>
     * <li>A windowless object that wishes to be a drop target still implements the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a> interface, but does not register it and does not return it through calls to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>. Instead, the container can obtain this interface by calling the object's <b>IOleInPlaceObjectWindowless::GetDropTarget</b> method. The object returns a pointer to its own <b>IDropTarget</b> interface if it wants to participate in drag and drop operations. The container can cache this interface pointer for later use. For example, on subsequent calls to the container's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragenter">IDropTarget::DragEnter</a> or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragleave">IDropTarget::DragLeave</a> methods, the container can use the cached pointer instead of calling the object's GetDropTarget method again.</li>
     * <li>The container then calls the object's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragenter">IDropTarget::DragEnter</a> and passes the returned value for <i>pdwEffect</i> from its own <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragover">IDropTarget::DragOver</a> or <b>IDropTarget::DragEnter</b> methods. From this point on, the container forwards all subsequent <b>IDropTarget::DragOver</b> calls to the windowless object until the mouse leaves the object or a drop occurs on the object. If the mouse leaves the object, the container calls the object's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragleave">IDropTarget::DragLeave</a> and then releases the object's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a> interface. If the drop occurs, the container forwards the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-drop">IDropTarget::Drop</a> call to the object.</li>
     * <li>Finally, the container in-place deactivates the object.</li>
     * </ul>
     * An object can return S_FALSE from its own <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragenter">IDropTarget::DragEnter</a> to indicate that it does not accept any of the data formats in the data object. In that case, the container can decide to accept the data for itself and return an appropriate <i>dwEffect</i> from its own <b>IDropTarget::DragEnter</b> or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragover">IDropTarget::DragOver</a> methods.
     * 
     * An object that returns S_FALSE from <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragenter">IDropTarget::DragEnter</a> should be prepared to receive subsequent calls to <b>IDropTarget::DragEnter</b> without any <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragleave">IDropTarget::DragLeave</a> in between. Indeed, if the mouse is still over the same object during the next call to the container's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-dragover">IDropTarget::DragOver</a>, the container may decide to try and call <b>IDropTarget::DragEnter</b> again on the object.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * A container can cache the pointer to the object's <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a> interface for later use.
     * @returns {IDropTarget} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a> pointer variable that receives the interface pointer to the windowless object.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ioleinplaceobjectwindowless-getdroptarget
     */
    GetDropTarget() {
        result := ComCall(10, this, "ptr*", &ppDropTarget := 0, "HRESULT")
        return IDropTarget(ppDropTarget)
    }
}

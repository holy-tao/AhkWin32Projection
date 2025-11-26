#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a region within a window (referred to as a viewport) that is able to receive and process input from user interactions.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationviewport
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationViewport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectManipulationViewport
     * @type {Guid}
     */
    static IID => Guid("{28b85a3d-60a0-48bd-9ba1-5ce8d9ea3a6d}")

    /**
     * The class identifier for DirectManipulationViewport
     * @type {Guid}
     */
    static CLSID => Guid("{34e211b6-3650-4f75-8334-fa359598e1c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Enable", "Disable", "SetContact", "ReleaseContact", "ReleaseAllContacts", "GetStatus", "GetTag", "SetTag", "GetViewportRect", "SetViewportRect", "ZoomToRect", "SetViewportTransform", "SyncDisplayTransform", "GetPrimaryContent", "AddContent", "RemoveContent", "SetViewportOptions", "AddConfiguration", "RemoveConfiguration", "ActivateConfiguration", "SetManualGesture", "SetChaining", "AddEventHandler", "RemoveEventHandler", "SetInputMode", "SetUpdateMode", "Stop", "Abandon"]

    /**
     * Starts or resumes input processing by the viewport.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>, or <b>S_FALSE</b> if there is no work to do (for example, the viewport is already enabled). Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-enable
     */
    Enable() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Stops input processing by the viewport.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-disable
     */
    Disable() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Specifies an association between a contact and the viewport.
     * @param {Integer} pointerId The ID of the pointer.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setcontact
     */
    SetContact(pointerId) {
        result := ComCall(5, this, "uint", pointerId, "HRESULT")
        return result
    }

    /**
     * Removes a contact that is associated with a viewport.
     * @param {Integer} pointerId The ID of the pointer.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-releasecontact
     */
    ReleaseContact(pointerId) {
        result := ComCall(6, this, "uint", pointerId, "HRESULT")
        return result
    }

    /**
     * Removes all contacts that are associated with the viewport. Inertia is started if the viewport supports inertia.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-releaseallcontacts
     */
    ReleaseAllContacts() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Gets the state of the viewport.
     * @returns {Integer} One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_status">DIRECTMANIPULATION_STATUS</a>.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-getstatus
     */
    GetStatus() {
        result := ComCall(8, this, "int*", &status := 0, "HRESULT")
        return status
    }

    /**
     * Gets the tag value of a viewport.
     * @param {Pointer<Guid>} riid IID to the interface.
     * @param {Pointer<Pointer<Void>>} object The object portion of the tag.
     * @param {Pointer<Integer>} id The identifier portion of the tag.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-gettag
     */
    GetTag(riid, object, id) {
        objectMarshal := object is VarRef ? "ptr*" : "ptr"
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", riid, objectMarshal, object, idMarshal, id, "HRESULT")
        return result
    }

    /**
     * Sets a viewport tag.
     * @param {IUnknown} object The object portion of the tag.
     * @param {Integer} id The ID portion of the tag.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-settag
     */
    SetTag(object, id) {
        result := ComCall(10, this, "ptr", object, "uint", id, "HRESULT")
        return result
    }

    /**
     * Retrieves the rectangle for the viewport relative to the origin of the viewport coordinate system specified by SetViewportRect.
     * @returns {RECT} The bounding rectangle relative to the viewport coordinate system.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-getviewportrect
     */
    GetViewportRect() {
        viewport := RECT()
        result := ComCall(11, this, "ptr", viewport, "HRESULT")
        return viewport
    }

    /**
     * Sets the bounding rectangle for the viewport, relative to the origin of the viewport coordinate system.
     * @param {Pointer<RECT>} viewport The bounding rectangle.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setviewportrect
     */
    SetViewportRect(viewport) {
        result := ComCall(12, this, "ptr", viewport, "HRESULT")
        return result
    }

    /**
     * Moves the viewport to a specific area of the primary content and specifies whether to animate the transition.
     * @param {Float} left The leftmost coordinate of the rectangle in the primary content coordinate space.
     * @param {Float} top The topmost coordinate of the rectangle in the primary content coordinate space.
     * @param {Float} right The rightmost coordinate of the rectangle in the primary content coordinate space.
     * @param {Float} bottom The bottommost coordinate of the rectangle in the primary content coordinate space.
     * @param {BOOL} animate Specifies whether to animate the zoom behavior.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-zoomtorect
     */
    ZoomToRect(left, top, right, bottom, animate) {
        result := ComCall(13, this, "float", left, "float", top, "float", right, "float", bottom, "int", animate, "HRESULT")
        return result
    }

    /**
     * Specifies the transform from the viewport coordinate system to the window client coordinate system.
     * @param {Pointer<Float>} matrix The transform matrix, in row-wise order: _11, _12, _21, _22, _31, _32.
     * @param {Integer} pointCount The size of the transform matrix. This value is always 6, because a 3x2 matrix is used for all direct manipulation transforms.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setviewporttransform
     */
    SetViewportTransform(matrix, pointCount) {
        matrixMarshal := matrix is VarRef ? "float*" : "ptr"

        result := ComCall(14, this, matrixMarshal, matrix, "uint", pointCount, "HRESULT")
        return result
    }

    /**
     * Specifies a display transform for the viewport, and synchronizes the output transform with the new value of the display transform.
     * @param {Pointer<Float>} matrix The transform matrix, in row-wise order: _11, _12, _21, _22, _31, _32.
     * @param {Integer} pointCount The size of the transform matrix. This value is always 6, because a 3x2 matrix is used for all direct manipulation transforms.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-syncdisplaytransform
     */
    SyncDisplayTransform(matrix, pointCount) {
        matrixMarshal := matrix is VarRef ? "float*" : "ptr"

        result := ComCall(15, this, matrixMarshal, matrix, "uint", pointCount, "HRESULT")
        return result
    }

    /**
     * Gets the primary content of a viewport that implements IDirectManipulationContent and IDirectManipulationPrimaryContent.
     * @param {Pointer<Guid>} riid IID to the interface.
     * @returns {Pointer<Void>} The primary content object.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-getprimarycontent
     */
    GetPrimaryContent(riid) {
        result := ComCall(16, this, "ptr", riid, "ptr*", &object := 0, "HRESULT")
        return object
    }

    /**
     * Adds secondary content, such as a panning indicator, to a viewport.
     * @param {IDirectManipulationContent} content The content to add to the viewport.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addcontent
     */
    AddContent(content) {
        result := ComCall(17, this, "ptr", content, "HRESULT")
        return result
    }

    /**
     * Removes secondary content from a viewport.
     * @param {IDirectManipulationContent} content The content object to remove.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-removecontent
     */
    RemoveContent(content) {
        result := ComCall(18, this, "ptr", content, "HRESULT")
        return result
    }

    /**
     * Sets how the viewport handles input and output.
     * @param {Integer} options One or more of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_viewport_options">DIRECTMANIPULATION_VIEWPORT_OPTIONS</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setviewportoptions
     */
    SetViewportOptions(options) {
        result := ComCall(19, this, "int", options, "HRESULT")
        return result
    }

    /**
     * Adds an interaction configuration for the viewport.
     * @param {Integer} configuration One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_configuration">DIRECTMANIPULATION_CONFIGURATION</a> that specifies the interaction configuration for the viewport.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addconfiguration
     */
    AddConfiguration(configuration) {
        result := ComCall(20, this, "int", configuration, "HRESULT")
        return result
    }

    /**
     * Removes an interaction configuration for the viewport.
     * @param {Integer} configuration One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_configuration">DIRECTMANIPULATION_CONFIGURATION</a> that specifies the interaction configuration for the viewport.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-removeconfiguration
     */
    RemoveConfiguration(configuration) {
        result := ComCall(21, this, "int", configuration, "HRESULT")
        return result
    }

    /**
     * Sets the configuration for input interaction.
     * @param {Integer} configuration One or more values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_configuration">DIRECTMANIPULATION_CONFIGURATION</a> that specify the interaction configuration for the viewport.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-activateconfiguration
     */
    ActivateConfiguration(configuration) {
        result := ComCall(22, this, "int", configuration, "HRESULT")
        return result
    }

    /**
     * Sets which gestures are ignored by Direct Manipulation.
     * @param {Integer} configuration One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_gesture_configuration">DIRECTMANIPULATION_GESTURE_CONFIGURATION</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setmanualgesture
     */
    SetManualGesture(configuration) {
        result := ComCall(23, this, "int", configuration, "HRESULT")
        return result
    }

    /**
     * Specifies the motion types supported in a viewport that can be chained to a parent viewport.
     * @param {Integer} enabledTypes One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_motion_types">DIRECTMANIPULATION_MOTION_TYPES</a> that specifies the motion types that are enabled for this viewport.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setchaining
     */
    SetChaining(enabledTypes) {
        result := ComCall(24, this, "int", enabledTypes, "HRESULT")
        return result
    }

    /**
     * Adds a new event handler to listen for viewport events.
     * @param {HWND} window The handle of a window owned by the thread for the event callback.
     * @param {IDirectManipulationViewportEventHandler} eventHandler The handler that is called when viewport status and update events occur. The specified object must implement the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationviewporteventhandler">IDirectManipulationViewportEventHandler</a> interface.
     * @returns {Integer} The handle that represents this event handler callback.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addeventhandler
     */
    AddEventHandler(window, eventHandler) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(25, this, "ptr", window, "ptr", eventHandler, "uint*", &cookie := 0, "HRESULT")
        return cookie
    }

    /**
     * Removes an existing event handler from the viewport.
     * @param {Integer} cookie A value that was returned by a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addeventhandler">AddEventHandler</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-removeeventhandler
     */
    RemoveEventHandler(cookie) {
        result := ComCall(26, this, "uint", cookie, "HRESULT")
        return result
    }

    /**
     * Specifies if input is visible to the UI thread.
     * @param {Integer} mode One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_input_mode">DIRECTMANIPULATION_INPUT_MODE</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setinputmode
     */
    SetInputMode(mode) {
        result := ComCall(27, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * Specifies whether a viewport updates content manually instead of during an input event.
     * @param {Integer} mode One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_input_mode">DIRECTMANIPULATION_INPUT_MODE</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setupdatemode
     */
    SetUpdateMode(mode) {
        result := ComCall(28, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * Stops the manipulation and returns the viewport to a ready state.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-stop
     */
    Stop() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * Releases all resources that are used by the viewport and prepares it for destruction from memory.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport-abandon
     */
    Abandon() {
        result := ComCall(30, this, "HRESULT")
        return result
    }
}

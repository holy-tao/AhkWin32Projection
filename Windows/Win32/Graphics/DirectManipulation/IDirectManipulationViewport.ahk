#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a region within a window (referred to as a viewport) that is able to receive and process input from user interactions.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationviewport
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
     * @remarks
     * This method directs a viewport to attempt to respond to input.
     * 
     * Call this method if the <b>AUTODISABLE</b> option is set.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>, or <b>S_FALSE</b> if there is no work to do (for example, the viewport is already enabled). Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-enable
     */
    Enable() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Stops input processing by the viewport.
     * @remarks
     * When a viewport is disabled, it immediately stops all transforms and moves the content to the final location. 
     * 
     * Call this method when you want to modify multiple attributes atomically. This method can be called at any time. 
     * 
     * The viewport will not resume processing input until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-enable">Enable</a> is called.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-disable
     */
    Disable() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Specifies an association between a contact and the viewport.
     * @remarks
     * Call this method when a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointerdown">WM_POINTERDOWN</a> message is received. Upon receiving a <b>WM_POINTERDOWN</b>, the application can use the coordinates of the input to hit-test and determine the viewports to which the contact is associated.
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationdefercontactservice-defercontact">DeferContact</a> must be called before <b>SetContact</b>.
     * 
     * After initialization, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> is not aware of viewport z-order or parent-child relations between viewports. The order of <b>SetContact</b> calls defines the viewport tree. To establish the correct viewport hierarchy, <b>SetContact</b> should be called first on the child-most viewport, followed by the parent, grand-parent, and so on. 
     * 
     * 
     * Use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-get_pointerid_wparam">GET_POINTERID_WPARAM</a> to get the pointer identifier from a pointer message. The contact is removed automatically when <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointerup">WM_POINTERUP</a> is received.
     * 
     * 
     * If a contact is associated with one or more viewports using the <b>SetContact</b> method, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> will examine further input from that contact and attempt to identify an appropriate manipulation based on the configuration of the associated viewports. If a manipulation is recognized, the application will then receive a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointercapturechanged">WM_POINTERCAPTURECHANGED</a> message for this contact. In this context, the <b>WM_POINTERCAPTURECHANGED</b> message indicates that Direct Manipulation has captured the contact and the application will not receive input from this contact that is consumed for this manipulation.
     * @param {Integer} pointerId The ID of the pointer.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setcontact
     */
    SetContact(pointerId) {
        result := ComCall(5, this, "uint", pointerId, "HRESULT")
        return result
    }

    /**
     * Removes a contact that is associated with a viewport.
     * @remarks
     * This method releases a contact from a specific <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> viewport (equivalent to the user removing a touch point). 
     * 
     * The viewport state is not affected unless the last remaining contact on the viewport is removed, in which case the viewport will transition to inertia, if supported.
     * @param {Integer} pointerId The ID of the pointer.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-releasecontact
     */
    ReleaseContact(pointerId) {
        result := ComCall(6, this, "uint", pointerId, "HRESULT")
        return result
    }

    /**
     * Removes all contacts that are associated with the viewport. Inertia is started if the viewport supports inertia.
     * @remarks
     * This is equivalent to calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-releasecontact">ReleaseContact</a> on every contact associated with the viewport. The outcome is equivalent to the user removing all touch points from the viewport. 
     * 
     * If supported, inertia will be started after calling this method.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-releaseallcontacts
     */
    ReleaseAllContacts() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Gets the state of the viewport.
     * @remarks
     * This method returns the viewport state at the time of the call and not at the time when the return value is read.
     * 
     * This method will fail if called after <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-abandon">Abandon</a>.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-getstatus
     */
    GetStatus() {
        result := ComCall(8, this, "int*", &_status := 0, "HRESULT")
        return _status
    }

    /**
     * Gets the tag value of a viewport.
     * @remarks
     * A tag is a pairing of an integer ID with a Component Object Model (COM) object. It can be used by an app to identify the viewport.
     * 
     * The out parameters are optional, so the method can return an ID, the viewport object, or both.
     * @param {Pointer<Guid>} riid IID to the interface.
     * @param {Pointer<Pointer<Void>>} _object 
     * @param {Pointer<Integer>} id The identifier portion of the tag.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-gettag
     */
    GetTag(riid, _object, id) {
        _objectMarshal := _object is VarRef ? "ptr*" : "ptr"
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", riid, _objectMarshal, _object, idMarshal, id, "HRESULT")
        return result
    }

    /**
     * Sets a viewport tag.
     * @remarks
     * A tag is a pairing of an integer ID with a Component Object Model (COM) object. It can be used by an app to identify the viewport.
     * 
     * The object parameter is optional, so that the method can set just an ID.
     * @param {IUnknown} _object 
     * @param {Integer} id The ID portion of the tag.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-settag
     */
    SetTag(_object, id) {
        result := ComCall(10, this, "ptr", _object, "uint", id, "HRESULT")
        return result
    }

    /**
     * Retrieves the rectangle for the viewport relative to the origin of the viewport coordinate system specified by SetViewportRect.
     * @returns {RECT} The bounding rectangle relative to the viewport coordinate system.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-getviewportrect
     */
    GetViewportRect() {
        viewport := RECT()
        result := ComCall(11, this, "ptr", viewport, "HRESULT")
        return viewport
    }

    /**
     * Sets the bounding rectangle for the viewport, relative to the origin of the viewport coordinate system.
     * @remarks
     * The viewport rectangle specifies the region of content that is visible to the user. In conjunction with the primary content rectangle, the viewport rectangle is used to determine chaining behaviors.
     * @param {Pointer<RECT>} viewport The bounding rectangle.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setviewportrect
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
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-zoomtorect
     */
    ZoomToRect(left, top, right, bottom, animate) {
        result := ComCall(13, this, "float", left, "float", top, "float", right, "float", bottom, "int", animate, "HRESULT")
        return result
    }

    /**
     * Specifies the transform from the viewport coordinate system to the window client coordinate system.
     * @remarks
     * Call this function to specify the viewport position, scaling and orientation on the screen. Viewport position, scaling, orientation and size are uniquely determined by the viewport transform and the viewport rectangle. The application can specify the viewport transform using this method, and the viewport rectangle using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setviewportrect">SetViewportRect</a>. 
     * 
     * 
     * The viewport rectangle (the rectangular area inside the content that is visible to the user) is specified in viewport coordinates. If the viewport rectangle top-left point is (0,0), the viewport rectangle is positioned exactly at the viewport coordinate system origin. Viewports offset from the viewport coordinate system origin can be specified in two ways:
     * 
     * <ul>
     * <li>Through the viewport rectangle top-left point</li>
     * <li>Through the viewport transform translation component (_31, _32)</li>
     * </ul>
     * The viewport transform converts from the viewport coordinate system to the window client coordinate system. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> ignores the window RTL property, so the client area origin is always the top-left point. 
     * The transforms are applied in the following order:
     * 
     * 
     * <ol>
     * <li>Viewport rectangle offset</li>
     * <li>Viewport transform (from viewport to client coordinate system)</li>
     * <li>Client to screen mapping (from client to screen coordinate system)
     * </li>
     * </ol>
     * @param {Pointer<Float>} _matrix 
     * @param {Integer} pointCount The size of the transform matrix. This value is always 6, because a 3x2 matrix is used for all direct manipulation transforms.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setviewporttransform
     */
    SetViewportTransform(_matrix, pointCount) {
        _matrixMarshal := _matrix is VarRef ? "float*" : "ptr"

        result := ComCall(14, this, _matrixMarshal, _matrix, "uint", pointCount, "HRESULT")
        return result
    }

    /**
     * Specifies a display transform for the viewport, and synchronizes the output transform with the new value of the display transform.
     * @remarks
     * If the application performs special output processing of the content outside of the compositor (content not fully captured in the viewport transform), it should call this method to specify the display transform for the special processing.
     * 
     * 
     * The display transform affects how manipulation updates are applied to the output transform. For example, if the display transform is set to scale 3x, panning will move the content 3x the original distance. 
     * 
     * 
     * When a display transform is changed using this method, the output transform will be synchronized to the new value of the display transform.
     * 
     * 
     * This method cannot be called if the viewport status is <b>DIRECTMANIPULATION_RUNNING</b> or <b>DIRECTMANIPULATION_INERTIA</b>.
     * @param {Pointer<Float>} _matrix 
     * @param {Integer} pointCount The size of the transform matrix. This value is always 6, because a 3x2 matrix is used for all direct manipulation transforms.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-syncdisplaytransform
     */
    SyncDisplayTransform(_matrix, pointCount) {
        _matrixMarshal := _matrix is VarRef ? "float*" : "ptr"

        result := ComCall(15, this, _matrixMarshal, _matrix, "uint", pointCount, "HRESULT")
        return result
    }

    /**
     * Gets the primary content of a viewport that implements IDirectManipulationContent and IDirectManipulationPrimaryContent.
     * @remarks
     * This method gets the content of the viewport that implements <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationcontent">IDirectManipulationContent</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationprimarycontent">IDirectManipulationPrimaryContent</a>.
     * @param {Pointer<Guid>} riid IID to the interface.
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-getprimarycontent
     */
    GetPrimaryContent(riid) {
        result := ComCall(16, this, "ptr", riid, "ptr*", &_object := 0, "HRESULT")
        return _object
    }

    /**
     * Adds secondary content, such as a panning indicator, to a viewport.
     * @remarks
     * Secondary content is created by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-createcontent">CreateContent</a>. Once added, the secondary content will move relative to the primary content in response to a manipulation. Its motion is determined by rules associated with each type of secondary content.
     * @param {IDirectManipulationContent} content The content to add to the viewport.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addcontent
     */
    AddContent(content) {
        result := ComCall(17, this, "ptr", content, "HRESULT")
        return result
    }

    /**
     * Removes secondary content from a viewport.
     * @remarks
     * Secondary content can be removed from the viewport at any time.
     * @param {IDirectManipulationContent} content The content object to remove.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-removecontent
     */
    RemoveContent(content) {
        result := ComCall(18, this, "ptr", content, "HRESULT")
        return result
    }

    /**
     * Sets how the viewport handles input and output.
     * @remarks
     * Calling this method with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_input_mode">DIRECTMANIPULATION_INPUT_MODE_MANUAL</a> set is similar to calling <b>SetViewportOptions(DIRECTMANIPULATION_VIEWPORT_OPTIONS_INPUT)</b>.
     * @param {Integer} options One or more of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_viewport_options">DIRECTMANIPULATION_VIEWPORT_OPTIONS</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setviewportoptions
     */
    SetViewportOptions(options) {
        result := ComCall(19, this, "int", options, "HRESULT")
        return result
    }

    /**
     * Adds an interaction configuration for the viewport.
     * @remarks
     * An interaction configuration specifies how the manipulation engine responds to input and which manipulations are supported. Any number of possible configurations can be added to the viewport using <b>AddConfiguration</b> before processing input. 
     * 
     * Configurations can be switched by the application at runtime using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-activateconfiguration">ActivateConfiguration</a>.  
     * 
     * When a configuration is no longer required (and is not currently active), it can be removed using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-removeconfiguration">RemoveConfiguration</a>. 
     * 
     * If a configuration has not been added using <b>AddConfiguration</b>, it can be automatically added and then activated by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-activateconfiguration">ActivateConfiguration</a>. 
     * 
     * <div class="alert"><b>Note</b>  If input processing is occurring, this call will fail.</div>
     * <div> </div>
     * This method fails if a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-guids">drag and drop</a> behavior has been specified. 
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-guids">drag and drop</a> behavior object cannot be attached after successfully calling this method.
     * 
     * You cannot add another <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-guids">drag and drop</a> behavior after an existing one has already been added.
     * 
     * This method is designed to allow an application to switch pre-added configurations, as a configuration cannot be changed while a manipulation is occurring. Under most circumstances it is better to update the configuration using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-activateconfiguration">ActivateConfiguration</a>.
     * @param {Integer} configuration One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_configuration">DIRECTMANIPULATION_CONFIGURATION</a> that specifies the interaction configuration for the viewport.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addconfiguration
     */
    AddConfiguration(configuration) {
        result := ComCall(20, this, "int", configuration, "HRESULT")
        return result
    }

    /**
     * Removes an interaction configuration for the viewport.
     * @remarks
     * This method removes a possible configuration that was added by using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addconfiguration">AddConfiguration</a>. This method can be called only if the configuration is not active.
     * 
     * An interaction configuration specifies how the manipulation engine responds to input and which gestures are supported. Any number of configurations can be added to the viewport using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addconfiguration">AddConfiguration</a>. Configurations can be switched by the application at runtime using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-activateconfiguration">ActivateConfiguration</a>. When a configuration is no longer required (and is not currently active), it can be removed using <b>RemoveConfiguration</b>.
     * @param {Integer} configuration One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_configuration">DIRECTMANIPULATION_CONFIGURATION</a> that specifies the interaction configuration for the viewport.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-removeconfiguration
     */
    RemoveConfiguration(configuration) {
        result := ComCall(21, this, "int", configuration, "HRESULT")
        return result
    }

    /**
     * Sets the configuration for input interaction.
     * @remarks
     * An interaction configuration specifies how the manipulation engine responds to input and which manipulations are supported. Any number of possible configurations can be added to the viewport using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addconfiguration">AddConfiguration</a> before processing input. 
     * 
     * Configurations can be switched by the application at runtime using <b>ActivateConfiguration</b>.  
     * 
     * When a configuration is no longer required (and is not currently active), it can be removed using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-removeconfiguration">RemoveConfiguration</a>. 
     * 
     * If a configuration has not been added using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addconfiguration">AddConfiguration</a>, it can be automatically added and then activated by calling <b>ActivateConfiguration</b>. 
     * 
     * <div class="alert"><b>Note</b>  If input processing is occurring, this call will fail.</div>
     * <div> </div>
     * This method fails if a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-guids">drag and drop</a> behavior has been specified. 
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-guids">drag and drop</a> behavior object cannot be attached after successfully calling this method.
     * @param {Integer} configuration One or more values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_configuration">DIRECTMANIPULATION_CONFIGURATION</a> that specify the interaction configuration for the viewport.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-activateconfiguration
     */
    ActivateConfiguration(configuration) {
        result := ComCall(22, this, "int", configuration, "HRESULT")
        return result
    }

    /**
     * Sets which gestures are ignored by Direct Manipulation.
     * @remarks
     * Use this method to specify which gestures the application processes on the UI thread. If a gesture is recognized, it will be passed to the application for processing and ignored by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a>.
     * @param {Integer} configuration One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_gesture_configuration">DIRECTMANIPULATION_GESTURE_CONFIGURATION</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setmanualgesture
     */
    SetManualGesture(configuration) {
        result := ComCall(23, this, "int", configuration, "HRESULT")
        return result
    }

    /**
     * Specifies the motion types supported in a viewport that can be chained to a parent viewport.
     * @param {Integer} enabledTypes One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_motion_types">DIRECTMANIPULATION_MOTION_TYPES</a> that specifies the motion types that are enabled for this viewport.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setchaining
     */
    SetChaining(enabledTypes) {
        result := ComCall(24, this, "int", enabledTypes, "HRESULT")
        return result
    }

    /**
     * Adds a new event handler to listen for viewport events.
     * @remarks
     * The event callback is fired from the thread that owns the specified window. Consecutive events of the same callback method may be coalesced. 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the viewport has a drag-drop behavior attached, the event handler should implement <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationdragdropeventhandler">IDirectManipulationDragDropEventHandler</a>.
     * </div>
     * <div> </div>
     * @param {HWND} window The handle of a window owned by the thread for the event callback.
     * @param {IDirectManipulationViewportEventHandler} eventHandler The handler that is called when viewport status and update events occur. The specified object must implement the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationviewporteventhandler">IDirectManipulationViewportEventHandler</a> interface.
     * @returns {Integer} The handle that represents this event handler callback.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addeventhandler
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
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-removeeventhandler
     */
    RemoveEventHandler(cookie) {
        result := ComCall(26, this, "uint", cookie, "HRESULT")
        return result
    }

    /**
     * Specifies if input is visible to the UI thread.
     * @remarks
     * DIRECTMANIPULATION_INPUT_MODE_AUTOMATIC is the default mode for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a>. 
     * 
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> consumes all the input that drives the manipulation and the application receives WM_POINTERCAPTURECHANGED messages. 
     * 
     * 
     * In some situations an application may want to receive input that is driving a manipulation. Set DIRECTMANIPULATION_INPUT_MODE_MANUAL in this case. The application will receive all input messages, even input used by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> to drive a manipulation. 
     * 
     * <div class="alert"><b>Note</b>  The application will not receive WM_POINTERCAPTURECHANGED messages.
     * </div>
     * <div> </div>
     * Calling this method with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_input_mode">DIRECTMANIPULATION_INPUT_MODE_MANUAL</a> set is similar to calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setviewportoptions">SetViewportOptions(DIRECTMANIPULATION_VIEWPORT_OPTIONS_INPUT)</a>. However, calling <b>SetViewportOptions</b> also overrides all other settings.
     * @param {Integer} _mode 
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setinputmode
     */
    SetInputMode(_mode) {
        result := ComCall(27, this, "int", _mode, "HRESULT")
        return result
    }

    /**
     * Specifies whether a viewport updates content manually instead of during an input event.
     * @remarks
     * DIRECTMANIPULATION_INPUT_MODE_AUTOMATIC is the default mode for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a>. In this mode, visual updates are pushed to compositor driven by input. This is the expected mode of operation if the application is using system-provided implementation of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationcompositor">IDirectManipulationCompositor</a>.
     * 
     * 
     * If the application provides its own implementation of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationcompositor">IDirectManipulationCompositor</a>, it should switch viewport update mode to manual by setting DIRECTMANIPULATION_INPUT_MODE_MANUAL. When in manual mode, the compositor pulls visual updates whenever it calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationupdatemanager-update">Update</a> on <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a>.
     * 
     * 
     * Calling this method with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_input_mode">DIRECTMANIPULATION_INPUT_MODE_MANUAL</a> set is similar to calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setviewportoptions">SetViewportOptions(DIRECTMANIPULATION_VIEWPORT_OPTIONS_INPUT)</a>. However, calling <b>SetViewportOptions</b> also overrides all other settings.
     * @param {Integer} _mode 
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setupdatemode
     */
    SetUpdateMode(_mode) {
        result := ComCall(28, this, "int", _mode, "HRESULT")
        return result
    }

    /**
     * Stops the manipulation and returns the viewport to a ready state.
     * @remarks
     * If a mandatory snap point has been configured, the content may animate to the nearest snap point.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-stop
     */
    Stop() {
        result := ComCall(29, this, "HRESULT")
        return result
    }

    /**
     * Releases all resources that are used by the viewport and prepares it for destruction from memory.
     * @remarks
     * Once <b>Abandon</b> has been called, do not make subsequent function calls on the viewport. If a function is called after <b>Abandon</b>, <b>E_INVALID_STATE</b> will be returned.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-abandon
     */
    Abandon() {
        result := ComCall(30, this, "HRESULT")
        return result
    }
}

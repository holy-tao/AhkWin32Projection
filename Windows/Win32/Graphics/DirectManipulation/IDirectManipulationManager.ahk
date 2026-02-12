#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to all the Direct Manipulation features and APIs available to the client application.
 * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nn-directmanipulation-idirectmanipulationmanager
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectManipulationManager
     * @type {Guid}
     */
    static IID => Guid("{fbf5d3b4-70c7-4163-9322-5a6f660d6fbc}")

    /**
     * The class identifier for DirectManipulationManager
     * @type {Guid}
     */
    static CLSID => Guid("{54e211b6-3650-4f75-8334-fa359598e1c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate", "Deactivate", "RegisterHitTestTarget", "ProcessInput", "GetUpdateManager", "CreateViewport", "CreateContent"]

    /**
     * Activates Direct Manipulation for processing input and handling callbacks on the specified window.
     * @remarks
     * The manipulation manager is deactivated, by default. The manager does not receive or respond to input and callbacks until <b>Activate</b> is called for the window.  
     * 
     * Calls to <b>Activate</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-deactivate">Deactivate</a> are reference counted.
     * @param {HWND} window The window in which to activate <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-activate
     */
    Activate(window) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(3, this, "ptr", window, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deactivates Direct Manipulation for processing input and handling callbacks on the specified window.
     * @remarks
     * The manipulation manager is deactivated by default. The manager does not receive or respond to input until <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-activate">Activate</a> is called. The manipulation manager should be deactivated when the app does not receive or respond to input. For example, when the app is minimized.
     * 
     * Calls to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-activate">Activate</a> and <b>Deactivate</b> are reference counted.
     * @param {HWND} window The window in which to deactivate input.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-deactivate
     */
    Deactivate(window) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(4, this, "ptr", window, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a dedicated thread for hit testing.
     * @remarks
     * Hit testing is typically performed on the application UI thread. The application receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointerdown">WM_POINTERDOWN</a> message on which hit-testing is performed. If a manipulation is required, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setcontact">SetContact</a> is called on one or more viewports. An application can use the <b>RegisterHitTestTarget</b> method to delegate this hit-testing responsibility to a separate hit-testing thread.
     * 
     * 
     * Once a dedicated hit-test target is successfully registered, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointerdown">WM_POINTERDOWN</a> messages are processed on the hit-testing thread. If a manipulation, such as pan or zoom, is required, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setcontact">SetContact</a> is called from this thread.
     * 
     * 
     * If <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setcontact">SetContact</a> is not called from the hit-testing thread, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointerdown">WM_POINTERDOWN</a> messages may be processed on the UI thread, depending on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_hittest_type">DIRECTMANIPULATION_HITTEST_TYPE</a> specified during registration.
     * 
     * 
     * If <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setcontact">SetContact</a> is not called by either the hit-test thread or the UI thread, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> ignores the input which is then handled on the UI thread.
     * @param {HWND} window The handle of the main app window (typically created from the UI thread).
     * @param {HWND} hitTestWindow The handle of the window in which hit testing is registered (should be created from the hit testing thread). Pass in nullptr to unregister a previously registered hit-test target.
     * @param {Integer} type One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_hittest_type">DIRECTMANIPULATION_HITTEST_TYPE</a>. Specifies whether the UI window or the hit testing window (or both) receives the hit testing <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointerdown">WM_POINTERDOWN</a> message , and in what order.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-registerhittesttarget
     */
    RegisterHitTestTarget(window, hitTestWindow, type) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window
        hitTestWindow := hitTestWindow is Win32Handle ? NumGet(hitTestWindow, "ptr") : hitTestWindow

        result := ComCall(5, this, "ptr", window, "ptr", hitTestWindow, "int", type, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Passes keyboard and mouse messages to the manipulation manager on the app's UI thread.
     * @remarks
     * Call this method for mouse and keyboard input.
     * @param {Pointer<MSG>} message The input message to process.
     * @returns {BOOL} <b>TRUE</b> if no further processing should be done with this message; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-processinput
     */
    ProcessInput(message) {
        result := ComCall(6, this, "ptr", message, "int*", &handled := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return handled
    }

    /**
     * Gets a pointer to an IDirectManipulationUpdateManager object that receives compositor updates.
     * @remarks
     * For the compositor to respond to update events from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a>, you must associate <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationupdatemanager">IDirectManipulationUpdateManager</a> to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationcompositor">IDirectManipulationCompositor</a> object during initialization. Use  <b>GetUpdateManager</b> to obtain a pointer to a <b>IDirectManipulationUpdateManager</b> object. Pass this pointer to the compositor using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationcompositor-setupdatemanager">SetUpdateManager</a> method.
     * @param {Pointer<Guid>} riid IID to the interface.
     * @returns {Pointer<Pointer<Void>>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-getupdatemanager
     */
    GetUpdateManager(riid) {
        result := ComCall(7, this, "ptr", riid, "ptr*", &object_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return object_
    }

    /**
     * The factory method that is used to create a new IDirectManipulationViewport object.
     * @param {IDirectManipulationFrameInfoProvider} frameInfo The frame info provider for the viewport.
     * @param {HWND} window The handle of the main app window to associate with the viewport.
     * @param {Pointer<Guid>} riid IID to the interface.
     * @returns {Pointer<Pointer<Void>>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-createviewport
     */
    CreateViewport(frameInfo, window, riid) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(8, this, "ptr", frameInfo, "ptr", window, "ptr", riid, "ptr*", &object_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return object_
    }

    /**
     * The factory method that is used to create an instance of secondary content (such as a panning indicator) inside a viewport.
     * @remarks
     * Primary content is automatically created at the same time as the viewport and has a one-to-one relationship to a viewport. Therefore, it is not possible to create, add, or remove primary content.
     * 
     * Secondary content is created independently from the viewport. There is no limit to how much secondary content can be added or removed from a viewport. All secondary content transforms are derived from those supported by the primary content with specific rules applied based on the intended purpose of the element (identified by its Class identifier (CLSID)).
     * @param {IDirectManipulationFrameInfoProvider} frameInfo The frame info provider for the secondary content. This should match the frame info provider used to create the viewport.
     * @param {Pointer<Guid>} clsid Class identifier (CLSID) of the secondary content. This ID specifies the content type.
     * @param {Pointer<Guid>} riid IID of the interface.
     * @returns {Pointer<Pointer<Void>>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-createcontent
     */
    CreateContent(frameInfo, clsid, riid) {
        result := ComCall(9, this, "ptr", frameInfo, "ptr", clsid, "ptr", riid, "ptr*", &object_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return object_
    }
}

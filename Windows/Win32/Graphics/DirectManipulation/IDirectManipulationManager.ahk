#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to all the Direct Manipulation features and APIs available to the client application.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationmanager
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
     * @param {HWND} window The window in which to activate <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationmanager-activate
     */
    Activate(window) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(3, this, "ptr", window, "HRESULT")
        return result
    }

    /**
     * Deactivates Direct Manipulation for processing input and handling callbacks on the specified window.
     * @param {HWND} window The window in which to deactivate input.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationmanager-deactivate
     */
    Deactivate(window) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(4, this, "ptr", window, "HRESULT")
        return result
    }

    /**
     * Registers a dedicated thread for hit testing.
     * @param {HWND} window The handle of the main app window (typically created from the UI thread).
     * @param {HWND} hitTestWindow The handle of the window in which hit testing is registered (should be created from the hit testing thread). Pass in nullptr to unregister a previously registered hit-test target.
     * @param {Integer} type One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_hittest_type">DIRECTMANIPULATION_HITTEST_TYPE</a>. Specifies whether the UI window or the hit testing window (or both) receives the hit testing <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointerdown">WM_POINTERDOWN</a> message , and in what order.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationmanager-registerhittesttarget
     */
    RegisterHitTestTarget(window, hitTestWindow, type) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window
        hitTestWindow := hitTestWindow is Win32Handle ? NumGet(hitTestWindow, "ptr") : hitTestWindow

        result := ComCall(5, this, "ptr", window, "ptr", hitTestWindow, "int", type, "HRESULT")
        return result
    }

    /**
     * Passes keyboard and mouse messages to the manipulation manager on the app's UI thread.
     * @param {Pointer<MSG>} message The input message to process.
     * @returns {BOOL} <b>TRUE</b> if no further processing should be done with this message; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationmanager-processinput
     */
    ProcessInput(message) {
        result := ComCall(6, this, "ptr", message, "int*", &handled := 0, "HRESULT")
        return handled
    }

    /**
     * Gets a pointer to an IDirectManipulationUpdateManager object that receives compositor updates.
     * @param {Pointer<Guid>} riid IID to the interface.
     * @returns {Pointer<Void>} Pointer to the new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationupdatemanager">IDirectManipulationUpdateManager</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationmanager-getupdatemanager
     */
    GetUpdateManager(riid) {
        result := ComCall(7, this, "ptr", riid, "ptr*", &object := 0, "HRESULT")
        return object
    }

    /**
     * The factory method that is used to create a new IDirectManipulationViewport object.
     * @param {IDirectManipulationFrameInfoProvider} frameInfo The frame info provider for the viewport.
     * @param {HWND} window The handle of the main app window to associate with the viewport.
     * @param {Pointer<Guid>} riid IID to the interface.
     * @returns {Pointer<Void>} The new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationviewport">IDirectManipulationViewport</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationmanager-createviewport
     */
    CreateViewport(frameInfo, window, riid) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(8, this, "ptr", frameInfo, "ptr", window, "ptr", riid, "ptr*", &object := 0, "HRESULT")
        return object
    }

    /**
     * The factory method that is used to create an instance of secondary content (such as a panning indicator) inside a viewport.
     * @param {IDirectManipulationFrameInfoProvider} frameInfo The frame info provider for the secondary content. This should match the frame info provider used to create the viewport.
     * @param {Pointer<Guid>} clsid Class identifier (CLSID) of the secondary content. This ID specifies the content type.
     * @param {Pointer<Guid>} riid IID of the interface.
     * @returns {Pointer<Void>} The secondary content object that implements the specified interface.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationmanager-createcontent
     */
    CreateContent(frameInfo, clsid, riid) {
        result := ComCall(9, this, "ptr", frameInfo, "ptr", clsid, "ptr", riid, "ptr*", &object := 0, "HRESULT")
        return object
    }
}

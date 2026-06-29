#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\UI\WindowsAndMessaging\MSG.ahk" { MSG }
#Import ".\DIRECTMANIPULATION_HITTEST_TYPE.ahk" { DIRECTMANIPULATION_HITTEST_TYPE }
#Import ".\IDirectManipulationFrameInfoProvider.ahk" { IDirectManipulationFrameInfoProvider }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to all the Direct Manipulation features and APIs available to the client application.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationmanager
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct IDirectManipulationManager extends IUnknown {
    /**
     * The interface identifier for IDirectManipulationManager
     * @type {Guid}
     */
    static IID := Guid("{fbf5d3b4-70c7-4163-9322-5a6f660d6fbc}")

    /**
     * The class identifier for DirectManipulationManager
     * @type {Guid}
     */
    static CLSID := Guid("{54e211b6-3650-4f75-8334-fa359598e1c5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectManipulationManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Activate              : IntPtr
        Deactivate            : IntPtr
        RegisterHitTestTarget : IntPtr
        ProcessInput          : IntPtr
        GetUpdateManager      : IntPtr
        CreateViewport        : IntPtr
        CreateContent         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectManipulationManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Activates Direct Manipulation for processing input and handling callbacks on the specified window.
     * @remarks
     * The manipulation manager is deactivated, by default. The manager does not receive or respond to input and callbacks until <b>Activate</b> is called for the window.  
     * 
     * Calls to <b>Activate</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-deactivate">Deactivate</a> are reference counted.
     * @param {HWND} window The window in which to activate <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-activate
     */
    Activate(window) {
        result := ComCall(3, this, HWND, window, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-deactivate
     */
    Deactivate(window) {
        result := ComCall(4, this, HWND, window, "HRESULT")
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
     * @param {DIRECTMANIPULATION_HITTEST_TYPE} type One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_hittest_type">DIRECTMANIPULATION_HITTEST_TYPE</a>. Specifies whether the UI window or the hit testing window (or both) receives the hit testing <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointerdown">WM_POINTERDOWN</a> message , and in what order.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-registerhittesttarget
     */
    RegisterHitTestTarget(window, hitTestWindow, type) {
        result := ComCall(5, this, HWND, window, HWND, hitTestWindow, DIRECTMANIPULATION_HITTEST_TYPE, type, "HRESULT")
        return result
    }

    /**
     * Passes keyboard and mouse messages to the manipulation manager on the app's UI thread.
     * @remarks
     * Call this method for mouse and keyboard input.
     * @param {Pointer<MSG>} message The input message to process.
     * @returns {BOOL} <b>TRUE</b> if no further processing should be done with this message; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-processinput
     */
    ProcessInput(message) {
        result := ComCall(6, this, MSG.Ptr, message, BOOL.Ptr, &handled := 0, "HRESULT")
        return handled
    }

    /**
     * Gets a pointer to an IDirectManipulationUpdateManager object that receives compositor updates.
     * @remarks
     * For the compositor to respond to update events from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a>, you must associate <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationupdatemanager">IDirectManipulationUpdateManager</a> to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationcompositor">IDirectManipulationCompositor</a> object during initialization. Use  <b>GetUpdateManager</b> to obtain a pointer to a <b>IDirectManipulationUpdateManager</b> object. Pass this pointer to the compositor using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationcompositor-setupdatemanager">SetUpdateManager</a> method.
     * @param {Pointer<Guid>} riid IID to the interface.
     * @returns {Pointer<Void>} Pointer to the new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationupdatemanager">IDirectManipulationUpdateManager</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-getupdatemanager
     */
    GetUpdateManager(riid) {
        result := ComCall(7, this, Guid.Ptr, riid, "ptr*", &_object := 0, "HRESULT")
        return _object
    }

    /**
     * The factory method that is used to create a new IDirectManipulationViewport object.
     * @param {IDirectManipulationFrameInfoProvider} frameInfo The frame info provider for the viewport.
     * @param {HWND} window The handle of the main app window to associate with the viewport.
     * @param {Pointer<Guid>} riid IID to the interface.
     * @returns {Pointer<Void>} The new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationviewport">IDirectManipulationViewport</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-createviewport
     */
    CreateViewport(frameInfo, window, riid) {
        result := ComCall(8, this, "ptr", frameInfo, HWND, window, Guid.Ptr, riid, "ptr*", &_object := 0, "HRESULT")
        return _object
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
     * @returns {Pointer<Void>} The secondary content object that implements the specified interface.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-createcontent
     */
    CreateContent(frameInfo, clsid, riid) {
        result := ComCall(9, this, "ptr", frameInfo, Guid.Ptr, clsid, Guid.Ptr, riid, "ptr*", &_object := 0, "HRESULT")
        return _object
    }

    Query(iid) {
        if (IDirectManipulationManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Activate := CallbackCreate(GetMethod(implObj, "Activate"), flags, 2)
        this.vtbl.Deactivate := CallbackCreate(GetMethod(implObj, "Deactivate"), flags, 2)
        this.vtbl.RegisterHitTestTarget := CallbackCreate(GetMethod(implObj, "RegisterHitTestTarget"), flags, 4)
        this.vtbl.ProcessInput := CallbackCreate(GetMethod(implObj, "ProcessInput"), flags, 3)
        this.vtbl.GetUpdateManager := CallbackCreate(GetMethod(implObj, "GetUpdateManager"), flags, 3)
        this.vtbl.CreateViewport := CallbackCreate(GetMethod(implObj, "CreateViewport"), flags, 5)
        this.vtbl.CreateContent := CallbackCreate(GetMethod(implObj, "CreateContent"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Activate)
        CallbackFree(this.vtbl.Deactivate)
        CallbackFree(this.vtbl.RegisterHitTestTarget)
        CallbackFree(this.vtbl.ProcessInput)
        CallbackFree(this.vtbl.GetUpdateManager)
        CallbackFree(this.vtbl.CreateViewport)
        CallbackFree(this.vtbl.CreateContent)
    }
}

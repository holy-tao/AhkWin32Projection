#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IOleWindow interface provides methods that allow an application to obtain the handle to the various windows that participate in in-place activation, and also to enter and exit context-sensitive help mode.
 * @remarks
 * Several other in-place activation interfaces are derived from the <b>IOleWindow</b> interface. Containers and objects must implement and use these interfaces in order to support in-place activation. The following table briefly summarizes each of these interfaces.
 * 
 * <table>
 * <tr>
 * <th>Interface</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td><b>IOleWindow</b></td>
 * <td>
 * The base interface. Implemented and used by containers and objects to obtain window handles and manage context-sensitive help. This interface is not supported for use across machine boundaries.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceobject">IOleInPlaceObject</a>
 * </td>
 * <td>
 * Implemented by objects and used by an object's immediate container to activate and deactivate the object.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceactiveobject">IOleInPlaceActiveObject</a>
 * </td>
 * <td>
 * Implemented by objects and used by the top-level container to manipulate the object while it is active. Provides a direct channel of communication between an active object and its frame and document windows.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceuiwindow">IOleInPlaceUIWindow</a>
 * </td>
 * <td>
 * Implemented by containers and used by objects to manipulate the container's document window.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplaceframe">IOleInPlaceFrame</a>
 * </td>
 * <td>
 * Implemented by containers and used by objects to control the container's frame window.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleinplacesite">IOleInPlaceSite</a>
 * </td>
 * <td>
 * Implemented by containers and used by objects to interact with the in-place client site.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleinplacesiteex">IOleInPlaceSiteEx</a>
 * </td>
 * <td>
 * Implemented by containers and called by objects to optimize activation and deactivation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleinplacesitewindowless">IOleInPlaceSiteWindowless</a>
 * </td>
 * <td>
 * Implemented by containers and called by windowless object to obtain services from its container.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ioleinplaceobjectwindowless">IOleInPlaceObjectWindowless</a>
 * </td>
 * <td>
 * Implemented by windowless objects called by containers to support window message processing and drag and drop operations for windowless objects.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * These interfaces can be arranged in three hierarchical levels with various interfaces implemented at each level. Calls that install user-interface menus commands and frame adornments, activate and switch between windows, and dispatch menu and keystrokes take place between the top-level container and the active object. Calls that support activating, deactivating, scrolling, or clipping span the containment hierarchy, with each level performing the correct actions.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-iolewindow
 * @namespace Windows.Win32.System.Ole
 */
export default struct IOleWindow extends IUnknown {
    /**
     * The interface identifier for IOleWindow
     * @type {Guid}
     */
    static IID := Guid("{00000114-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOleWindow interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetWindow            : IntPtr
        ContextSensitiveHelp : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOleWindow.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a handle to one of the windows participating in in-place activation (frame, document, parent, or in-place object window).
     * @remarks
     * Five types of windows comprise the windows hierarchy. When a object is active in place, it has access to some or all of these windows.
     * 
     * <table>
     * <tr>
     * <th>Window</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * Frame
     * 
     * </td>
     * <td>
     * The outermost main window where the container application's main menu resides.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Document
     * 
     * </td>
     * <td>
     * The window that displays the compound document containing the embedded object to the user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Pane
     * 
     * </td>
     * <td>
     * The subwindow of the document window that contains the object's view. Applicable only for applications with split-pane windows.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Parent
     * 
     * </td>
     * <td>
     * The container window that contains that object's view. The object application installs its window as a child of this window.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * In-place
     * 
     * </td>
     * <td>
     * The window containing the active in-place object. The object application creates this window and installs it as a child of its hatch window, which is a child of the container's parent window.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Each type of window has a different role in the in-place activation architecture. However, it is not necessary to employ a separate physical window for each type. Many container applications use the same window for their frame, document, pane, and parent windows.
     * @returns {HWND} A pointer to a variable that receives the window handle.
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolewindow-getwindow
     */
    GetWindow() {
        phwnd := HWND()
        result := ComCall(3, this, HWND.Ptr, phwnd, "HRESULT")
        return phwnd
    }

    /**
     * Determines whether context-sensitive help mode should be entered during an in-place activation session.
     * @remarks
     * Applications can invoke context-sensitive help when the user:
     * 
     * <ul>
     * <li>presses SHIFT+F1, then clicks a topic</li>
     * <li>presses F1 when a menu item is selected</li>
     * </ul>
     * When SHIFT+F1 is pressed, either the frame or active object can receive the keystrokes. If the container's frame receives the keystrokes, it calls its containing document's <b>IOleWindow::ContextSensitiveHelp</b> method with <i>fEnterMode</i> set to <b>TRUE</b>. This propagates the help state to all of its in-place objects so they can correctly handle the mouse click or WM_COMMAND.
     * 
     * If an active object receives the SHIFT+F1 keystrokes, it calls the container's <b>IOleWindow::ContextSensitiveHelp</b> method with <i>fEnterMode</i><b>TRUE</b>, which then recursively calls each of its in-place sites until there are no more to be notified. The container then calls its document's or frame's <b>IOleWindow::ContextSensitiveHelp</b> method with <i>fEnterMode</i><b>TRUE</b>.
     * 
     * When in context-sensitive help mode, an object that receives the mouse click can either:
     * 
     * <ul>
     * <li>Ignore the click if it does not support context-sensitive help.</li>
     * <li>Tell all the other objects to exit context-sensitive help mode with <b>ContextSensitiveHelp</b> set to <b>FALSE</b> and then provide help for that context.</li>
     * </ul>
     * An object in context-sensitive help mode that receives a WM_COMMAND should tell all the other in-place objects to exit context-sensitive help mode and then provide help for the command.
     * 
     * If a container application is to support context-sensitive help on menu items, it must either provide its own message filter so that it can intercept the F1 key or ask the OLE library to add a message filter by calling <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesetmenudescriptor">OleSetMenuDescriptor</a>, passing valid, non-<b>NULL</b> values for the <i>lpFrame</i> and <i>lpActiveObj</i> parameters.
     * @param {BOOL} fEnterMode <b>TRUE</b> if help mode should be entered; <b>FALSE</b> if it should be exited.
     * @returns {HRESULT} This method returns S_OK if the help mode was entered or exited successfully, depending on the value passed in <i>fEnterMode</i>. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified <i>fEnterMode</i> value is not valid.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolewindow-contextsensitivehelp
     */
    ContextSensitiveHelp(fEnterMode) {
        result := ComCall(4, this, BOOL, fEnterMode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOleWindow.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWindow := CallbackCreate(GetMethod(implObj, "GetWindow"), flags, 2)
        this.vtbl.ContextSensitiveHelp := CallbackCreate(GetMethod(implObj, "ContextSensitiveHelp"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWindow)
        CallbackFree(this.vtbl.ContextSensitiveHelp)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IOleWindow interface provides methods that allow an application to obtain the handle to the various windows that participate in in-place activation, and also to enter and exit context-sensitive help mode.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iolewindow
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleWindow extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleWindow
     * @type {Guid}
     */
    static IID => Guid("{00000114-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWindow", "ContextSensitiveHelp"]

    /**
     * Retrieves a handle to one of the windows participating in in-place activation (frame, document, parent, or in-place object window).
     * @returns {HWND} A pointer to a variable that receives the window handle.
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolewindow-getwindow
     */
    GetWindow() {
        phwnd := HWND()
        result := ComCall(3, this, "ptr", phwnd, "HRESULT")
        return phwnd
    }

    /**
     * Determines whether context-sensitive help mode should be entered during an in-place activation session.
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
     * @see https://docs.microsoft.com/windows/win32/api//oleidl/nf-oleidl-iolewindow-contextsensitivehelp
     */
    ContextSensitiveHelp(fEnterMode) {
        result := ComCall(4, this, "int", fEnterMode, "HRESULT")
        return result
    }
}

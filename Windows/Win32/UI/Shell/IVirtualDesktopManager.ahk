#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enable an application to interact with groups of windows that form virtual workspaces.
 * @remarks
 * 
  * The user can group a collection of windows together to create a virtual desktop. Every window is considered to be part of a virtual desktop. When one virtual desktop is hidden, all of the windows associated with it are also hidden. This enables the user to create multiple working environments and to be able to switch between them. Similarly, when a virtual desktop is selected to be active, the windows associated with that virtual desktop are displayed on the screen.
  * 
  * To support this concept, applications should avoid automatically switching the user from one virtual desktop to another. Only the user should instigate that change. In order to support this, newly created windows should appear on the currently active virtual desktop. In addition, if an application can reuse currently active windows, it should only reuse windows if they are on the currently active virtual desktop. Otherwise, a new window should be created.
  * 
  * <img alt="Virtual desktop visualization" src="./images/VirtualDesktops.png"/>
  * In the above image, the user has two virtual desktops and <b>VD2</b> is the currently active virtual desktop. If the user clicks a link in an outlook message, there's a URI activation that should open the link in an Internet Explorer window. If the user has configured IE to open links in the current window, it would normally use the currently open window. However, in this case, IE is on an inactive virtual desktop. In this scenario, IE should create a new window in the currently active virtual desktop.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ivirtualdesktopmanager
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IVirtualDesktopManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVirtualDesktopManager
     * @type {Guid}
     */
    static IID => Guid("{a5cd92ff-29be-454c-8d04-d82879fb3f1b}")

    /**
     * The class identifier for VirtualDesktopManager
     * @type {Guid}
     */
    static CLSID => Guid("{aa509086-5ca9-4c25-8f95-589d3c07b48a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsWindowOnCurrentVirtualDesktop", "GetWindowDesktopId", "MoveWindowToDesktop"]

    /**
     * 
     * @param {HWND} topLevelWindow 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ivirtualdesktopmanager-iswindowoncurrentvirtualdesktop
     */
    IsWindowOnCurrentVirtualDesktop(topLevelWindow) {
        topLevelWindow := topLevelWindow is Win32Handle ? NumGet(topLevelWindow, "ptr") : topLevelWindow

        result := ComCall(3, this, "ptr", topLevelWindow, "int*", &onCurrentDesktop := 0, "HRESULT")
        return onCurrentDesktop
    }

    /**
     * 
     * @param {HWND} topLevelWindow 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ivirtualdesktopmanager-getwindowdesktopid
     */
    GetWindowDesktopId(topLevelWindow) {
        topLevelWindow := topLevelWindow is Win32Handle ? NumGet(topLevelWindow, "ptr") : topLevelWindow

        desktopId := Guid()
        result := ComCall(4, this, "ptr", topLevelWindow, "ptr", desktopId, "HRESULT")
        return desktopId
    }

    /**
     * 
     * @param {HWND} topLevelWindow 
     * @param {Pointer<Guid>} desktopId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ivirtualdesktopmanager-movewindowtodesktop
     */
    MoveWindowToDesktop(topLevelWindow, desktopId) {
        topLevelWindow := topLevelWindow is Win32Handle ? NumGet(topLevelWindow, "ptr") : topLevelWindow

        result := ComCall(5, this, "ptr", topLevelWindow, "ptr", desktopId, "HRESULT")
        return result
    }
}

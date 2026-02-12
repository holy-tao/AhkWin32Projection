#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support access by a Microsoft UI Automation client to controls that provide fundamental window-based functionality within a traditional graphical user interface (GUI). Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.Window](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * For more info on what this pattern is for, see [Window Control Pattern](/windows/desktop/WinAuto/uiauto-implementingwindow).
 * 
 * IWindowProvider isn't implemented by any existing Windows Runtime automation peers. The interface exists so that custom control authors can support the automation pattern in a custom control, and implement their automation support using the same Windows Runtime managed or C++ API as they use to define control logic or other automation support.
 * 
 * Use [WindowPatternIdentifiers](../windows.ui.xaml.automation/windowpatternidentifiers.md) if you want to reference the IWindowProvider pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iwindowprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IWindowProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowProvider
     * @type {Guid}
     */
    static IID => Guid("{1baa8b3d-38cf-415a-85d3-20e43a0ec1b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsModal", "get_IsTopmost", "get_Maximizable", "get_Minimizable", "get_InteractionState", "get_VisualState", "Close", "SetVisualState", "WaitForInputIdle"]

    /**
     * Gets a value that specifies whether the window is modal.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iwindowprovider.ismodal
     * @type {Boolean} 
     */
    IsModal {
        get => this.get_IsModal()
    }

    /**
     * Gets a value that specifies whether the window is the topmost element in the z-order of layout.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iwindowprovider.istopmost
     * @type {Boolean} 
     */
    IsTopmost {
        get => this.get_IsTopmost()
    }

    /**
     * Gets a value that specifies whether the window can be maximized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iwindowprovider.maximizable
     * @type {Boolean} 
     */
    Maximizable {
        get => this.get_Maximizable()
    }

    /**
     * Gets a value that specifies whether the window can be minimized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iwindowprovider.minimizable
     * @type {Boolean} 
     */
    Minimizable {
        get => this.get_Minimizable()
    }

    /**
     * Gets the interaction state of the window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iwindowprovider.interactionstate
     * @type {Integer} 
     */
    InteractionState {
        get => this.get_InteractionState()
    }

    /**
     * Gets the visual state of the window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iwindowprovider.visualstate
     * @type {Integer} 
     */
    VisualState {
        get => this.get_VisualState()
    }

    /**
     * Indicates whether the window is modal. (IWindowProvider.get_IsModal)
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_ismodal
     */
    get_IsModal() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Indicates whether the window is the topmost element in the z-order. (IWindowProvider.get_IsTopmost)
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iwindowprovider-get_istopmost
     */
    get_IsTopmost() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Maximizable() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Minimizable() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InteractionState() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VisualState() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Attempts to close the window.
     * @remarks
     * <b>IWindowProvider::Close</b> must return immediately without blocking.
     *         
     * 
     * <b>IWindowProvider::Close</b> raises the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_Window_WindowClosedEventId</a> 
     *         event. 
     *         If possible, the event should be raised after the control has completed its associated action. 
     *         
     * 
     * When called on a split pane control, this method will close the pane and remove 
     *         the associated split. 
     * 
     * This method may also close all other panes depending on implementation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iwindowprovider-close
     */
    Close() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Changes the visual state of the window (such as minimizing or maximizing it).
     * @param {Integer} state The visual state of the window to change to, as a value of the enumeration.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iwindowprovider.setvisualstate
     */
    SetVisualState(state) {
        result := ComCall(13, this, "int", state, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Causes the calling code to block for the specified time or until the associated process enters an idle state, whichever completes first. (IWindowProvider.WaitForInputIdle)
     * @remarks
     * This method is typically used in conjunction with the handling of a <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_Window_WindowOpenedEventId</a>.
     *         The implementation is dependent on the underlying application framework; 
     *         therefore this method might return some time after the window is ready for user input. 
     *         The calling code should not rely on this method to ascertain exactly when the window has become idle. 
     *         Use the value of <i>pRetVal</i> to determine if the window is ready for input or if the method timed out.
     * @param {Integer} milliseconds Type: <b>int</b>
     * 
     * The amount of time, in milliseconds, to wait for the associated process to become idle. 
     *                 The maximum is Int32.MaxValue.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iwindowprovider-waitforinputidle
     */
    WaitForInputIdle(milliseconds) {
        result := ComCall(14, this, "int", milliseconds, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}

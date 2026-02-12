#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPopupMenu.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a context menu.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
 * @remarks
 * A context menu can show a maximum of six commands. This limit helps to ensure that the context menu remains uncluttered, usable, and directly relevant to users.
 * 
 * You can see complete code examples that demonstrate how to create and customize context menu in the [Context menu sample (Windows 10)](https://go.microsoft.com/fwlink/p/?LinkId=620525) and [Context menu sample (Windows 8.1)](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/Context%20menu%20sample).
 * 
 * For XAML-based desktop applications, we recommend to [use a menu flyout to implement context menus](/windows/apps/design/controls/menus-and-context-menus).
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.popupmenu
 * @namespace Windows.UI.Popups
 * @version WindowsRuntime 1.4
 */
class PopupMenu extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPopupMenu

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPopupMenu.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the commands for the context menu.
     * @remarks
     * You can see complete code examples that demonstrate how to create and customize context menus in the [Context menu sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/Context%20menu%20sample).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.popupmenu.commands
     * @type {IVector<IUICommand>} 
     */
    Commands {
        get => this.get_Commands()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [PopupMenu](popupmenu.md) class.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
     * @remarks
     * You can see complete code examples that demonstrate how to create and customize context menus in the [Context menu sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/Context%20menu%20sample).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Popups.PopupMenu")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<IUICommand>} 
     */
    get_Commands() {
        if (!this.HasProp("__IPopupMenu")) {
            if ((queryResult := this.QueryInterface(IPopupMenu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopupMenu := IPopupMenu(outPtr)
        }

        return this.__IPopupMenu.get_Commands()
    }

    /**
     * Shows the context menu at the specified client coordinates.
     * @remarks
     * You can see complete code examples that demonstrate how to create and customize context menus in the [Context menu sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/Context%20menu%20sample).
     * @param {POINT} invocationPoint The coordinates (in DIPs), relative to the window, of the user's finger or mouse pointer when the [oncontextmenu](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa704010(v=vs.85)) event fired. The menu is placed above and centered on this point.
     * 
     * > [!NOTE]
     * > For VB, C#, and C++, this window is the [CoreWindow](../windows.ui.core/corewindow.md) associated with the thread that is calling the context menu.
     * @returns {IAsyncOperation<IUICommand>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.popupmenu.showasync
     */
    ShowAsync(invocationPoint) {
        if (!this.HasProp("__IPopupMenu")) {
            if ((queryResult := this.QueryInterface(IPopupMenu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopupMenu := IPopupMenu(outPtr)
        }

        return this.__IPopupMenu.ShowAsync(invocationPoint)
    }

    /**
     * Shows the context menu in the preferred placement relative to the specified selection.
     * @remarks
     * You can see complete code examples that demonstrate how to create and customize context menus in the [Context menu sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/Context%20menu%20sample).
     * @param {RECT} selection The coordinates (in DIPs) of the selected rectangle, relative to the window.
     * 
     * > [!NOTE]
     * > For VB, C#, and C++, this window is the [CoreWindow](../windows.ui.core/corewindow.md) associated with the thread that is calling the context menu.
     * @returns {IAsyncOperation<IUICommand>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.popupmenu.showforselectionasync
     */
    ShowAsyncWithRect(selection) {
        if (!this.HasProp("__IPopupMenu")) {
            if ((queryResult := this.QueryInterface(IPopupMenu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopupMenu := IPopupMenu(outPtr)
        }

        return this.__IPopupMenu.ShowAsyncWithRect(selection)
    }

    /**
     * Shows the context menu above the specified selection.
     * @remarks
     * You can see complete code examples that demonstrate how to create and customize context menus in the [Context menu sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/Context%20menu%20sample).
     * @param {RECT} selection The coordinates (in DIPs) of the selected rectangle, relative to the window. The context menu is placed directly above and centered on this rectangle such that selection is not covered.
     * 
     * > [!NOTE]
     * > For VB, C#, and C++, this window is the [CoreWindow](../windows.ui.core/corewindow.md) associated with the thread that is calling the context menu.
     * @param {Integer} preferredPlacement 
     * @returns {IAsyncOperation<IUICommand>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.popupmenu.showforselectionasync
     */
    ShowAsyncWithRectAndPlacement(selection, preferredPlacement) {
        if (!this.HasProp("__IPopupMenu")) {
            if ((queryResult := this.QueryInterface(IPopupMenu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopupMenu := IPopupMenu(outPtr)
        }

        return this.__IPopupMenu.ShowAsyncWithRectAndPlacement(selection, preferredPlacement)
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInputPaneVisibilityEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the input pane [Hiding](inputpane_hiding.md) and [Showing](inputpane_showing.md) events.
 * @remarks
 * Your app receives this class in its [Hiding](inputpane_hiding.md) and [Showing](inputpane_showing.md) event handlers.
 * 
 * In some cases, overlay UI such as an [InputPane](inputpane.md) is not fully supported. This includes:
 * 
 * + apps in full-screen mode, like [games](/windows/uwp/gaming/index).
 * + Windows Holographic apps in [holographic view](https://developer.microsoft.com/mixed-reality#app_views).
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpanevisibilityeventargs
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class InputPaneVisibilityEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInputPaneVisibilityEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInputPaneVisibilityEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the region of the application's window that the input pane is covering.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpanevisibilityeventargs.occludedrect
     * @type {RECT} 
     */
    OccludedRect {
        get => this.get_OccludedRect()
    }

    /**
     * Identifies whether the application has taken steps to ensure that the input pane doesn't cover the UI element that has focus.
     * @remarks
     * If this property is false, Windows ensures that the input pane doesn't cover the focused element.
     * 
     * If you do the work to ensure that the focused element isn't covered, be sure to set this property to true to prevent Windows from trying to do the same work; otherwise, the results can be unpredictable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.inputpanevisibilityeventargs.ensuredfocusedelementinview
     * @type {Boolean} 
     */
    EnsuredFocusedElementInView {
        get => this.get_EnsuredFocusedElementInView()
        set => this.put_EnsuredFocusedElementInView(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_OccludedRect() {
        if (!this.HasProp("__IInputPaneVisibilityEventArgs")) {
            if ((queryResult := this.QueryInterface(IInputPaneVisibilityEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputPaneVisibilityEventArgs := IInputPaneVisibilityEventArgs(outPtr)
        }

        return this.__IInputPaneVisibilityEventArgs.get_OccludedRect()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_EnsuredFocusedElementInView(value) {
        if (!this.HasProp("__IInputPaneVisibilityEventArgs")) {
            if ((queryResult := this.QueryInterface(IInputPaneVisibilityEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputPaneVisibilityEventArgs := IInputPaneVisibilityEventArgs(outPtr)
        }

        return this.__IInputPaneVisibilityEventArgs.put_EnsuredFocusedElementInView(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EnsuredFocusedElementInView() {
        if (!this.HasProp("__IInputPaneVisibilityEventArgs")) {
            if ((queryResult := this.QueryInterface(IInputPaneVisibilityEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputPaneVisibilityEventArgs := IInputPaneVisibilityEventArgs(outPtr)
        }

        return this.__IInputPaneVisibilityEventArgs.get_EnsuredFocusedElementInView()
    }

;@endregion Instance Methods
}

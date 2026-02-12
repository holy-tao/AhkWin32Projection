#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUIContentRoot.ahk
#Include ..\..\Guid.ahk

/**
 * Represents the root of a UI element tree for an app window or view.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uicontentroot
 * @namespace Windows.UI
 * @version WindowsRuntime 1.4
 */
class UIContentRoot extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUIContentRoot

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUIContentRoot.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the context identifier for the content root.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uicontentroot.uicontext
     * @type {UIContext} 
     */
    UIContext {
        get => this.get_UIContext()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UIContext} 
     */
    get_UIContext() {
        if (!this.HasProp("__IUIContentRoot")) {
            if ((queryResult := this.QueryInterface(IUIContentRoot.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUIContentRoot := IUIContentRoot(outPtr)
        }

        return this.__IUIContentRoot.get_UIContext()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\CompositionTarget.ahk
#Include .\IDesktopWindowTarget.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a window that is the target of a composition.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.desktop.desktopwindowtarget
 * @namespace Windows.UI.Composition.Desktop
 * @version WindowsRuntime 1.4
 */
class DesktopWindowTarget extends CompositionTarget {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDesktopWindowTarget

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDesktopWindowTarget.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the window is rendered on top of all other windows.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.desktop.desktopwindowtarget.istopmost
     * @type {Boolean} 
     */
    IsTopmost {
        get => this.get_IsTopmost()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTopmost() {
        if (!this.HasProp("__IDesktopWindowTarget")) {
            if ((queryResult := this.QueryInterface(IDesktopWindowTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesktopWindowTarget := IDesktopWindowTarget(outPtr)
        }

        return this.__IDesktopWindowTarget.get_IsTopmost()
    }

;@endregion Instance Methods
}

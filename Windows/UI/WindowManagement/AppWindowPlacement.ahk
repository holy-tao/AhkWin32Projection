#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppWindowPlacement.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents info about the placement of an app window.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowplacement
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class AppWindowPlacement extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppWindowPlacement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppWindowPlacement.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the display region for the app window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowplacement.displayregion
     * @type {DisplayRegion} 
     */
    DisplayRegion {
        get => this.get_DisplayRegion()
    }

    /**
     * Gets the offset of the app window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowplacement.offset
     * @type {POINT} 
     */
    Offset {
        get => this.get_Offset()
    }

    /**
     * Gets the size of the app window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowplacement.size
     * @type {SIZE} 
     */
    Size {
        get => this.get_Size()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DisplayRegion} 
     */
    get_DisplayRegion() {
        if (!this.HasProp("__IAppWindowPlacement")) {
            if ((queryResult := this.QueryInterface(IAppWindowPlacement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowPlacement := IAppWindowPlacement(outPtr)
        }

        return this.__IAppWindowPlacement.get_DisplayRegion()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Offset() {
        if (!this.HasProp("__IAppWindowPlacement")) {
            if ((queryResult := this.QueryInterface(IAppWindowPlacement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowPlacement := IAppWindowPlacement(outPtr)
        }

        return this.__IAppWindowPlacement.get_Offset()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_Size() {
        if (!this.HasProp("__IAppWindowPlacement")) {
            if ((queryResult := this.QueryInterface(IAppWindowPlacement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowPlacement := IAppWindowPlacement(outPtr)
        }

        return this.__IAppWindowPlacement.get_Size()
    }

;@endregion Instance Methods
}

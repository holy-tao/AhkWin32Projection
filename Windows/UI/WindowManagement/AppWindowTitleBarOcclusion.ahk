#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppWindowTitleBarOcclusion.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the system-reserved regions of the app window that will occlude app content if ExtendsContentIntoTitleBar is true.
 * @remarks
 * System-reserved regions are used for areas of the title bar such as the system drag region and min/max/close buttons.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebarocclusion
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class AppWindowTitleBarOcclusion extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppWindowTitleBarOcclusion

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppWindowTitleBarOcclusion.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a rectangle that defines the width, height, and offset of the occlusion in app content visual relative coordinates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowtitlebarocclusion.occludingrect
     * @type {RECT} 
     */
    OccludingRect {
        get => this.get_OccludingRect()
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
    get_OccludingRect() {
        if (!this.HasProp("__IAppWindowTitleBarOcclusion")) {
            if ((queryResult := this.QueryInterface(IAppWindowTitleBarOcclusion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowTitleBarOcclusion := IAppWindowTitleBarOcclusion(outPtr)
        }

        return this.__IAppWindowTitleBarOcclusion.get_OccludingRect()
    }

;@endregion Instance Methods
}

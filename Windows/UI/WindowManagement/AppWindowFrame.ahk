#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppWindowFrameStyle.ahk
#Include .\IAppWindowFrame.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the current frame that is applied around the window content.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowframe
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class AppWindowFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppWindowFrameStyle

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppWindowFrameStyle.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a list of drag visuals currently associated with the frame if any have been successfully set. The default system drag visual for the system drawn titlebar is not returned through this method.
     * @remarks
     * Currently, this is limited to a single visual.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowframe.dragregionvisuals
     * @type {IVector<IVisualElement>} 
     */
    DragRegionVisuals {
        get => this.get_DragRegionVisuals()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns the style of frame used for the current window.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowframe.getframestyle
     */
    GetFrameStyle() {
        if (!this.HasProp("__IAppWindowFrameStyle")) {
            if ((queryResult := this.QueryInterface(IAppWindowFrameStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowFrameStyle := IAppWindowFrameStyle(outPtr)
        }

        return this.__IAppWindowFrameStyle.GetFrameStyle()
    }

    /**
     * Sets the style of frame to use for the app window.
     * @param {Integer} frameStyle A value of the enumeration that specifies which frame style to use.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowframe.setframestyle
     */
    SetFrameStyle(frameStyle) {
        if (!this.HasProp("__IAppWindowFrameStyle")) {
            if ((queryResult := this.QueryInterface(IAppWindowFrameStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowFrameStyle := IAppWindowFrameStyle(outPtr)
        }

        return this.__IAppWindowFrameStyle.SetFrameStyle(frameStyle)
    }

    /**
     * 
     * @returns {IVector<IVisualElement>} 
     */
    get_DragRegionVisuals() {
        if (!this.HasProp("__IAppWindowFrame")) {
            if ((queryResult := this.QueryInterface(IAppWindowFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowFrame := IAppWindowFrame(outPtr)
        }

        return this.__IAppWindowFrame.get_DragRegionVisuals()
    }

;@endregion Instance Methods
}

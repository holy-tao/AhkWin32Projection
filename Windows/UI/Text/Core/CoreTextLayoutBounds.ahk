#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreTextLayoutBounds.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the screen coordinates of the bounding box for a range of text, or a text input control.
 * @remarks
 * An object of this type can be obtained from the [LayoutBounds](coretextlayoutrequest_layoutbounds.md) property of a [CoreTextLayoutRequest](coretextlayoutrequest.md) object that you get from the [CoreTextLayoutRequestedEventArgs.Request](coretextlayoutrequestedeventargs_request.md) property inside a handler for the [CoreTextEditContext.LayoutRequested](coretexteditcontext_layoutrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextlayoutbounds
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextLayoutBounds extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreTextLayoutBounds

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreTextLayoutBounds.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the bounding box in screen coordinates of a range of text.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextlayoutbounds.textbounds
     * @type {RECT} 
     */
    TextBounds {
        get => this.get_TextBounds()
        set => this.put_TextBounds(value)
    }

    /**
     * Gets or sets the bounding box in screen coordinates of a text input control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextlayoutbounds.controlbounds
     * @type {RECT} 
     */
    ControlBounds {
        get => this.get_ControlBounds()
        set => this.put_ControlBounds(value)
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
    get_TextBounds() {
        if (!this.HasProp("__ICoreTextLayoutBounds")) {
            if ((queryResult := this.QueryInterface(ICoreTextLayoutBounds.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextLayoutBounds := ICoreTextLayoutBounds(outPtr)
        }

        return this.__ICoreTextLayoutBounds.get_TextBounds()
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_TextBounds(value) {
        if (!this.HasProp("__ICoreTextLayoutBounds")) {
            if ((queryResult := this.QueryInterface(ICoreTextLayoutBounds.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextLayoutBounds := ICoreTextLayoutBounds(outPtr)
        }

        return this.__ICoreTextLayoutBounds.put_TextBounds(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ControlBounds() {
        if (!this.HasProp("__ICoreTextLayoutBounds")) {
            if ((queryResult := this.QueryInterface(ICoreTextLayoutBounds.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextLayoutBounds := ICoreTextLayoutBounds(outPtr)
        }

        return this.__ICoreTextLayoutBounds.get_ControlBounds()
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_ControlBounds(value) {
        if (!this.HasProp("__ICoreTextLayoutBounds")) {
            if ((queryResult := this.QueryInterface(ICoreTextLayoutBounds.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextLayoutBounds := ICoreTextLayoutBounds(outPtr)
        }

        return this.__ICoreTextLayoutBounds.put_ControlBounds(value)
    }

;@endregion Instance Methods
}

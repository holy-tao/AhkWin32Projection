#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUICommand.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a command separator in a context menu.
 * @remarks
 * You can use a command separator to create a visual separation between groups of items in a context menu.
 * 
 * Setting properties on a UICommandSeparator object has no effect.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.uicommandseparator
 * @namespace Windows.UI.Popups
 * @version WindowsRuntime 1.4
 */
class UICommandSeparator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUICommand

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUICommand.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the label for the command separator.
     * @remarks
     * Setting this property has no effect.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.uicommandseparator.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Gets or sets the handler for the event that is fired for the command separator.
     * @remarks
     * Setting this property has no effect.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.uicommandseparator.invoked
     * @type {UICommandInvokedHandler} 
     */
    Invoked {
        get => this.get_Invoked()
        set => this.put_Invoked(value)
    }

    /**
     * Gets or sets the identifier of the command separator.
     * @remarks
     * Setting this property has no effect.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.uicommandseparator.id
     * @type {IInspectable} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [UICommandSeparator](uicommandseparator.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Popups.UICommandSeparator")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.get_Label()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.put_Label(value)
    }

    /**
     * 
     * @returns {UICommandInvokedHandler} 
     */
    get_Invoked() {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.get_Invoked()
    }

    /**
     * 
     * @param {UICommandInvokedHandler} value 
     * @returns {HRESULT} 
     */
    put_Invoked(value) {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.put_Invoked(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Id() {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.get_Id()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.put_Id(value)
    }

;@endregion Instance Methods
}

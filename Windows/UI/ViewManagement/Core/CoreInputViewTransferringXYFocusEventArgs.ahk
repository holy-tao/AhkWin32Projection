#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreInputViewTransferringXYFocusEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains event data for the [XYFocusTransferringFromPrimaryView](coreinputview_xyfocustransferringfromprimaryview.md) event.
 * @remarks
 * Primary view refers to either of the [CoreInputViewKind.Keyboard](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-keyboard1) or [CoreInputViewKind.Handwriting](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-handwriting2) views, while CoreInputView can be any of the values from [CoreInputViewKind](coreinputviewkind.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewtransferringxyfocuseventargs
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class CoreInputViewTransferringXYFocusEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreInputViewTransferringXYFocusEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreInputViewTransferringXYFocusEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the bounding rect of the originally focused element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewtransferringxyfocuseventargs.origin
     * @type {RECT} 
     */
    Origin {
        get => this.get_Origin()
    }

    /**
     * Gets the direction of focus navigation relative to the input pane.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewtransferringxyfocuseventargs.direction
     * @type {Integer} 
     */
    Direction {
        get => this.get_Direction()
    }

    /**
     * Gets or sets a value that marks the [XYFocusTransferringFromPrimaryView](coreinputview_xyfocustransferringfromprimaryview.md) event as handled.
     * @remarks
     * Primary view refers to either of the [CoreInputViewKind.Keyboard](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-keyboard1) or [CoreInputViewKind.Handwriting](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-handwriting2) views, while CoreInputView can be any of the values from [CoreInputViewKind](coreinputviewkind.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewtransferringxyfocuseventargs.transferhandled
     * @type {Boolean} 
     */
    TransferHandled {
        get => this.get_TransferHandled()
        set => this.put_TransferHandled(value)
    }

    /**
     * Gets or sets whether the input pane remains visible when the UI element loses focus.
     * @remarks
     * Primary view refers to either of the [CoreInputViewKind.Keyboard](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-keyboard1) or [CoreInputViewKind.Handwriting](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-handwriting2) views, while CoreInputView can be any of the values from [CoreInputViewKind](coreinputviewkind.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewtransferringxyfocuseventargs.keepprimaryviewvisible
     * @type {Boolean} 
     */
    KeepPrimaryViewVisible {
        get => this.get_KeepPrimaryViewVisible()
        set => this.put_KeepPrimaryViewVisible(value)
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
    get_Origin() {
        if (!this.HasProp("__ICoreInputViewTransferringXYFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewTransferringXYFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewTransferringXYFocusEventArgs := ICoreInputViewTransferringXYFocusEventArgs(outPtr)
        }

        return this.__ICoreInputViewTransferringXYFocusEventArgs.get_Origin()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Direction() {
        if (!this.HasProp("__ICoreInputViewTransferringXYFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewTransferringXYFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewTransferringXYFocusEventArgs := ICoreInputViewTransferringXYFocusEventArgs(outPtr)
        }

        return this.__ICoreInputViewTransferringXYFocusEventArgs.get_Direction()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_TransferHandled(value) {
        if (!this.HasProp("__ICoreInputViewTransferringXYFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewTransferringXYFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewTransferringXYFocusEventArgs := ICoreInputViewTransferringXYFocusEventArgs(outPtr)
        }

        return this.__ICoreInputViewTransferringXYFocusEventArgs.put_TransferHandled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TransferHandled() {
        if (!this.HasProp("__ICoreInputViewTransferringXYFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewTransferringXYFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewTransferringXYFocusEventArgs := ICoreInputViewTransferringXYFocusEventArgs(outPtr)
        }

        return this.__ICoreInputViewTransferringXYFocusEventArgs.get_TransferHandled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_KeepPrimaryViewVisible(value) {
        if (!this.HasProp("__ICoreInputViewTransferringXYFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewTransferringXYFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewTransferringXYFocusEventArgs := ICoreInputViewTransferringXYFocusEventArgs(outPtr)
        }

        return this.__ICoreInputViewTransferringXYFocusEventArgs.put_KeepPrimaryViewVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_KeepPrimaryViewVisible() {
        if (!this.HasProp("__ICoreInputViewTransferringXYFocusEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewTransferringXYFocusEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewTransferringXYFocusEventArgs := ICoreInputViewTransferringXYFocusEventArgs(outPtr)
        }

        return this.__ICoreInputViewTransferringXYFocusEventArgs.get_KeepPrimaryViewVisible()
    }

;@endregion Instance Methods
}

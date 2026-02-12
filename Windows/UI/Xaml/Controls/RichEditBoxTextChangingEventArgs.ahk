#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRichEditBoxTextChangingEventArgs.ahk
#Include .\IRichEditBoxTextChangingEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [RichEditBox.TextChanging](richeditbox_textchanging.md) event.
 * @remarks
 * An instance of this class is passed as a parameter to the [TextChanging](richeditbox_textchanging.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditboxtextchangingeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RichEditBoxTextChangingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRichEditBoxTextChangingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRichEditBoxTextChangingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the event occured due to a change in the text content.
     * @remarks
     * This event is fired for a format or content change. The IsContentChanging property helps to distinguish when text content is changing.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditboxtextchangingeventargs.iscontentchanging
     * @type {Boolean} 
     */
    IsContentChanging {
        get => this.get_IsContentChanging()
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
    get_IsContentChanging() {
        if (!this.HasProp("__IRichEditBoxTextChangingEventArgs2")) {
            if ((queryResult := this.QueryInterface(IRichEditBoxTextChangingEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBoxTextChangingEventArgs2 := IRichEditBoxTextChangingEventArgs2(outPtr)
        }

        return this.__IRichEditBoxTextChangingEventArgs2.get_IsContentChanging()
    }

;@endregion Instance Methods
}

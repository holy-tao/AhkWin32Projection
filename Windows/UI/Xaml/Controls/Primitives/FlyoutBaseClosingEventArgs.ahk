#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFlyoutBaseClosingEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [FlyoutBase.Closing](flyoutbase_closing.md) event
 * @remarks
 * Available starting in Windows 10, version 1607.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbaseclosingeventargs
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class FlyoutBaseClosingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFlyoutBaseClosingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFlyoutBaseClosingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the flyout should be prevented from closing.
     * @remarks
     * Available starting in Windows 10, version 1607.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.flyoutbaseclosingeventargs.cancel
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
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
    get_Cancel() {
        if (!this.HasProp("__IFlyoutBaseClosingEventArgs")) {
            if ((queryResult := this.QueryInterface(IFlyoutBaseClosingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBaseClosingEventArgs := IFlyoutBaseClosingEventArgs(outPtr)
        }

        return this.__IFlyoutBaseClosingEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__IFlyoutBaseClosingEventArgs")) {
            if ((queryResult := this.QueryInterface(IFlyoutBaseClosingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlyoutBaseClosingEventArgs := IFlyoutBaseClosingEventArgs(outPtr)
        }

        return this.__IFlyoutBaseClosingEventArgs.put_Cancel(value)
    }

;@endregion Instance Methods
}

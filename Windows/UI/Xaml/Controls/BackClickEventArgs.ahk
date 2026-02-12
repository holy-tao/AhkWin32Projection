#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackClickEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [SettingsFlyout.BackClick](settingsflyout_backclick.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.backclickeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class BackClickEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackClickEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackClickEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that can cancel the navigation. A **true** value for Handled cancels the default behavior.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.backclickeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [BackClickEventArgs](backclickeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.BackClickEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IBackClickEventArgs")) {
            if ((queryResult := this.QueryInterface(IBackClickEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackClickEventArgs := IBackClickEventArgs(outPtr)
        }

        return this.__IBackClickEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IBackClickEventArgs")) {
            if ((queryResult := this.QueryInterface(IBackClickEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackClickEventArgs := IBackClickEventArgs(outPtr)
        }

        return this.__IBackClickEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}

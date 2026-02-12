#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SplitButton.ahk
#Include .\IToggleSplitButton.ahk
#Include .\IToggleSplitButtonFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\ToggleSplitButton.ahk
#Include .\ToggleSplitButtonIsCheckedChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a button with two parts that can be invoked separately. One part behaves like a toggle button and the other part invokes a flyout.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ToggleSplitButton](/windows/winui/api/microsoft.ui.xaml.controls.togglesplitbutton) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.togglesplitbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ToggleSplitButton extends SplitButton {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToggleSplitButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToggleSplitButton.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ToggleSplitButton} 
     */
    static CreateInstance() {
        if (!ToggleSplitButton.HasProp("__IToggleSplitButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToggleSplitButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleSplitButtonFactory.IID)
            ToggleSplitButton.__IToggleSplitButtonFactory := IToggleSplitButtonFactory(factoryPtr)
        }

        return ToggleSplitButton.__IToggleSplitButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets whether the ToggleSplitButton is checked.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ToggleSplitButton.IsChecked](/windows/winui/api/microsoft.ui.xaml.controls.togglesplitbutton.ischecked) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.togglesplitbutton.ischecked
     * @type {Boolean} 
     */
    IsChecked {
        get => this.get_IsChecked()
        set => this.put_IsChecked(value)
    }

    /**
     * Occurs when the value of the IsChecked property is changed.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ToggleSplitButton.IsCheckedChanged](/windows/winui/api/microsoft.ui.xaml.controls.togglesplitbutton.ischeckedchanged) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @type {TypedEventHandler<ToggleSplitButton, ToggleSplitButtonIsCheckedChangedEventArgs>}
    */
    OnIsCheckedChanged {
        get {
            if(!this.HasProp("__OnIsCheckedChanged")){
                this.__OnIsCheckedChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e5d095d6-5bee-52f3-ba3a-ca66841a11da}"),
                    ToggleSplitButton,
                    ToggleSplitButtonIsCheckedChangedEventArgs
                )
                this.__OnIsCheckedChangedToken := this.add_IsCheckedChanged(this.__OnIsCheckedChanged.iface)
            }
            return this.__OnIsCheckedChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnIsCheckedChangedToken")) {
            this.remove_IsCheckedChanged(this.__OnIsCheckedChangedToken)
            this.__OnIsCheckedChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsChecked() {
        if (!this.HasProp("__IToggleSplitButton")) {
            if ((queryResult := this.QueryInterface(IToggleSplitButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSplitButton := IToggleSplitButton(outPtr)
        }

        return this.__IToggleSplitButton.get_IsChecked()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsChecked(value) {
        if (!this.HasProp("__IToggleSplitButton")) {
            if ((queryResult := this.QueryInterface(IToggleSplitButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSplitButton := IToggleSplitButton(outPtr)
        }

        return this.__IToggleSplitButton.put_IsChecked(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ToggleSplitButton, ToggleSplitButtonIsCheckedChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsCheckedChanged(handler) {
        if (!this.HasProp("__IToggleSplitButton")) {
            if ((queryResult := this.QueryInterface(IToggleSplitButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSplitButton := IToggleSplitButton(outPtr)
        }

        return this.__IToggleSplitButton.add_IsCheckedChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsCheckedChanged(token) {
        if (!this.HasProp("__IToggleSplitButton")) {
            if ((queryResult := this.QueryInterface(IToggleSplitButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleSplitButton := IToggleSplitButton(outPtr)
        }

        return this.__IToggleSplitButton.remove_IsCheckedChanged(token)
    }

;@endregion Instance Methods
}

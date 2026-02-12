#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IUserControl.ahk
#Include .\IUserControlFactory.ahk
#Include .\IUserControlStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the base class for defining a new control that encapsulates related existing controls and provides its own logic.
 * @remarks
 * Note that UserControl does not manifest the value of its  property in its control template. Instead, set the Background of the root element inside the UserControl. For more info, see Remarks in [Control.Background](control_background.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.usercontrol
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class UserControl extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserControl.IID

    /**
     * Identifies the [Content](usercontrol_content.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.usercontrol.contentproperty
     * @type {DependencyProperty} 
     */
    static ContentProperty {
        get => UserControl.get_ContentProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {UserControl} 
     */
    static CreateInstance() {
        if (!UserControl.HasProp("__IUserControlFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.UserControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserControlFactory.IID)
            UserControl.__IUserControlFactory := IUserControlFactory(factoryPtr)
        }

        return UserControl.__IUserControlFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentProperty() {
        if (!UserControl.HasProp("__IUserControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.UserControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserControlStatics.IID)
            UserControl.__IUserControlStatics := IUserControlStatics(factoryPtr)
        }

        return UserControl.__IUserControlStatics.get_ContentProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the content that is contained within a user control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.usercontrol.content
     * @type {UIElement} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Content() {
        if (!this.HasProp("__IUserControl")) {
            if ((queryResult := this.QueryInterface(IUserControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserControl := IUserControl(outPtr)
        }

        return this.__IUserControl.get_Content()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__IUserControl")) {
            if ((queryResult := this.QueryInterface(IUserControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserControl := IUserControl(outPtr)
        }

        return this.__IUserControl.put_Content(value)
    }

;@endregion Instance Methods
}

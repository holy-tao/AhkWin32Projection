#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\ButtonBase.ahk
#Include .\IHyperlinkButton.ahk
#Include .\IHyperlinkButtonFactory.ahk
#Include .\IHyperlinkButtonStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a button control that functions as a hyperlink.
 * @remarks
 * HyperlinkButton is a button that appears as marked up text.
 * 
 * <img alt="Hyperlink button" src="images/controls/HyperlinkButton.png" />
 * 
 * > [!NOTE]
 * > By default, the HyperlinkButton appears as underlined text when you set a string as the value for the [Content](contentcontrol_content.md) property.
 * 
 * The text does not appear underlined in the following cases:
 * 
 * + You set a [TextBlock](textblock.md) as the value for the [Content](contentcontrol_content.md) property, and set the [Text](textblock_text.md) property on the [TextBlock](textblock.md).
 * + You re-template the HyperlinkButton and change the name of the [ContentPresenter](contentpresenter.md) template part.
 *  If you need a button that appears as non-underlined text, consider using a standard [Button](button.md) control and applying the built-in TextBlockButtonStyle system resource to its [Style](../windows.ui.xaml/frameworkelement_style.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hyperlinkbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class HyperlinkButton extends ButtonBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHyperlinkButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHyperlinkButton.IID

    /**
     * Identifies the [NavigateUri](hyperlinkbutton_navigateuri.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hyperlinkbutton.navigateuriproperty
     * @type {DependencyProperty} 
     */
    static NavigateUriProperty {
        get => HyperlinkButton.get_NavigateUriProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HyperlinkButton} 
     */
    static CreateInstance() {
        if (!HyperlinkButton.HasProp("__IHyperlinkButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.HyperlinkButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkButtonFactory.IID)
            HyperlinkButton.__IHyperlinkButtonFactory := IHyperlinkButtonFactory(factoryPtr)
        }

        return HyperlinkButton.__IHyperlinkButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_NavigateUriProperty() {
        if (!HyperlinkButton.HasProp("__IHyperlinkButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.HyperlinkButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHyperlinkButtonStatics.IID)
            HyperlinkButton.__IHyperlinkButtonStatics := IHyperlinkButtonStatics(factoryPtr)
        }

        return HyperlinkButton.__IHyperlinkButtonStatics.get_NavigateUriProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the Uniform Resource Identifier (URI) to navigate to when the [HyperlinkButton](hyperlinkbutton.md) is clicked.
     * @remarks
     * When a user clicks or otherwise invokes a [HyperlinkButton](hyperlinkbutton.md), it opens the URI you specified for the NavigateUri property in the default browser.
     * 
     * You don't have to use **http:** or **https:** schemes for the URI. You can use schemes such as **ms-appx:**, **ms-appdata:**, or **ms-resources:**, if there's resource content at these locations that's appropriate to load in a browser. However, the **file:** scheme is specifically blocked. For more info, see [URI schemes](/previous-versions/windows/apps/jj655406(v=win.10)).
     * 
     * [HyperlinkButton](hyperlinkbutton.md) is a control, so it has input events such as [Tapped](../windows.ui.xaml/uielement_tapped.md), and it's a [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) subclass so it also has a [Click](../windows.ui.xaml.controls.primitives/buttonbase_click.md) event. You don't typically specify a value for NavigateUri and also handle input events that are interpreted as clicking the [HyperlinkButton](hyperlinkbutton.md). The action of opening the NavigateUri in a default browser is a system action that takes place without requiring any event handling. If your intent is that the [HyperlinkButton](hyperlinkbutton.md) should load a specified URI within a [WebView](webview.md) control that's also part of your app, then don't specify a value for NavigateUri. Handle the [Click](../windows.ui.xaml.controls.primitives/buttonbase_click.md) event instead, and call [WebView.Navigate](webview_navigate_1098085581.md), specifying the URI to load.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.hyperlinkbutton.navigateuri
     * @type {Uri} 
     */
    NavigateUri {
        get => this.get_NavigateUri()
        set => this.put_NavigateUri(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_NavigateUri() {
        if (!this.HasProp("__IHyperlinkButton")) {
            if ((queryResult := this.QueryInterface(IHyperlinkButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlinkButton := IHyperlinkButton(outPtr)
        }

        return this.__IHyperlinkButton.get_NavigateUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_NavigateUri(value) {
        if (!this.HasProp("__IHyperlinkButton")) {
            if ((queryResult := this.QueryInterface(IHyperlinkButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHyperlinkButton := IHyperlinkButton(outPtr)
        }

        return this.__IHyperlinkButton.put_NavigateUri(value)
    }

;@endregion Instance Methods
}

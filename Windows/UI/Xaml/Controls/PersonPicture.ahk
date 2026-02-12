#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IPersonPicture.ahk
#Include .\IPersonPictureFactory.ahk
#Include .\IPersonPictureStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a control that displays the avatar image for a person, if one is available; if not, it displays the person's initials or a generic glyph.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture](/windows/winui/api/microsoft.ui.xaml.controls.personpicture) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class PersonPicture extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPersonPicture

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPersonPicture.IID

    /**
     * Identifies the BadgeNumber dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.BadgeNumberProperty](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.badgenumberproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.badgenumberproperty
     * @type {DependencyProperty} 
     */
    static BadgeNumberProperty {
        get => PersonPicture.get_BadgeNumberProperty()
    }

    /**
     * Identifies the BadgeGlyph dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.BadgeGlyphProperty](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.badgeglyphproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.badgeglyphproperty
     * @type {DependencyProperty} 
     */
    static BadgeGlyphProperty {
        get => PersonPicture.get_BadgeGlyphProperty()
    }

    /**
     * Identifies the BadgeImageSource dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.BadgeImageSourceProperty](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.badgeimagesourceproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.badgeimagesourceproperty
     * @type {DependencyProperty} 
     */
    static BadgeImageSourceProperty {
        get => PersonPicture.get_BadgeImageSourceProperty()
    }

    /**
     * Identifies the BadgeText dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.BadgeTextProperty](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.badgetextproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.badgetextproperty
     * @type {DependencyProperty} 
     */
    static BadgeTextProperty {
        get => PersonPicture.get_BadgeTextProperty()
    }

    /**
     * Identifies the IsGroup dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.IsGroupProperty](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.isgroupproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.isgroupproperty
     * @type {DependencyProperty} 
     */
    static IsGroupProperty {
        get => PersonPicture.get_IsGroupProperty()
    }

    /**
     * Identifies the Contact dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.ContactProperty](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.contactproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.contactproperty
     * @type {DependencyProperty} 
     */
    static ContactProperty {
        get => PersonPicture.get_ContactProperty()
    }

    /**
     * Identifies the DisplayName dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.DisplayNameProperty](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.displaynameproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.displaynameproperty
     * @type {DependencyProperty} 
     */
    static DisplayNameProperty {
        get => PersonPicture.get_DisplayNameProperty()
    }

    /**
     * Identifies the Initials dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.InitialsProperty](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.initialsproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.initialsproperty
     * @type {DependencyProperty} 
     */
    static InitialsProperty {
        get => PersonPicture.get_InitialsProperty()
    }

    /**
     * Identifies the PreferSmallImage dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.PreferSmallImageProperty](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.prefersmallimageproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.prefersmallimageproperty
     * @type {DependencyProperty} 
     */
    static PreferSmallImageProperty {
        get => PersonPicture.get_PreferSmallImageProperty()
    }

    /**
     * Identifies the ProfilePicture dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.ProfilePictureProperty](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.profilepictureproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.profilepictureproperty
     * @type {DependencyProperty} 
     */
    static ProfilePictureProperty {
        get => PersonPicture.get_ProfilePictureProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {PersonPicture} 
     */
    static CreateInstance() {
        if (!PersonPicture.HasProp("__IPersonPictureFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PersonPicture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPersonPictureFactory.IID)
            PersonPicture.__IPersonPictureFactory := IPersonPictureFactory(factoryPtr)
        }

        return PersonPicture.__IPersonPictureFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BadgeNumberProperty() {
        if (!PersonPicture.HasProp("__IPersonPictureStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PersonPicture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPersonPictureStatics.IID)
            PersonPicture.__IPersonPictureStatics := IPersonPictureStatics(factoryPtr)
        }

        return PersonPicture.__IPersonPictureStatics.get_BadgeNumberProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BadgeGlyphProperty() {
        if (!PersonPicture.HasProp("__IPersonPictureStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PersonPicture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPersonPictureStatics.IID)
            PersonPicture.__IPersonPictureStatics := IPersonPictureStatics(factoryPtr)
        }

        return PersonPicture.__IPersonPictureStatics.get_BadgeGlyphProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BadgeImageSourceProperty() {
        if (!PersonPicture.HasProp("__IPersonPictureStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PersonPicture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPersonPictureStatics.IID)
            PersonPicture.__IPersonPictureStatics := IPersonPictureStatics(factoryPtr)
        }

        return PersonPicture.__IPersonPictureStatics.get_BadgeImageSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BadgeTextProperty() {
        if (!PersonPicture.HasProp("__IPersonPictureStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PersonPicture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPersonPictureStatics.IID)
            PersonPicture.__IPersonPictureStatics := IPersonPictureStatics(factoryPtr)
        }

        return PersonPicture.__IPersonPictureStatics.get_BadgeTextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsGroupProperty() {
        if (!PersonPicture.HasProp("__IPersonPictureStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PersonPicture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPersonPictureStatics.IID)
            PersonPicture.__IPersonPictureStatics := IPersonPictureStatics(factoryPtr)
        }

        return PersonPicture.__IPersonPictureStatics.get_IsGroupProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContactProperty() {
        if (!PersonPicture.HasProp("__IPersonPictureStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PersonPicture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPersonPictureStatics.IID)
            PersonPicture.__IPersonPictureStatics := IPersonPictureStatics(factoryPtr)
        }

        return PersonPicture.__IPersonPictureStatics.get_ContactProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DisplayNameProperty() {
        if (!PersonPicture.HasProp("__IPersonPictureStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PersonPicture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPersonPictureStatics.IID)
            PersonPicture.__IPersonPictureStatics := IPersonPictureStatics(factoryPtr)
        }

        return PersonPicture.__IPersonPictureStatics.get_DisplayNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_InitialsProperty() {
        if (!PersonPicture.HasProp("__IPersonPictureStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PersonPicture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPersonPictureStatics.IID)
            PersonPicture.__IPersonPictureStatics := IPersonPictureStatics(factoryPtr)
        }

        return PersonPicture.__IPersonPictureStatics.get_InitialsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PreferSmallImageProperty() {
        if (!PersonPicture.HasProp("__IPersonPictureStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PersonPicture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPersonPictureStatics.IID)
            PersonPicture.__IPersonPictureStatics := IPersonPictureStatics(factoryPtr)
        }

        return PersonPicture.__IPersonPictureStatics.get_PreferSmallImageProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ProfilePictureProperty() {
        if (!PersonPicture.HasProp("__IPersonPictureStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PersonPicture")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPersonPictureStatics.IID)
            PersonPicture.__IPersonPictureStatics := IPersonPictureStatics(factoryPtr)
        }

        return PersonPicture.__IPersonPictureStatics.get_ProfilePictureProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the contact number to display on the badge.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.BadgeNumber](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.badgenumber) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.badgenumber
     * @type {Integer} 
     */
    BadgeNumber {
        get => this.get_BadgeNumber()
        set => this.put_BadgeNumber(value)
    }

    /**
     * Gets or sets a Segoe MDL2 Assets font glyph to display on the badge.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.BadgeGlyph](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.badgeglyph) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.badgeglyph
     * @type {HSTRING} 
     */
    BadgeGlyph {
        get => this.get_BadgeGlyph()
        set => this.put_BadgeGlyph(value)
    }

    /**
     * Gets or sets the source of an image to display on the badge.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.BadgeImageSource](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.badgeimagesource) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.badgeimagesource
     * @type {ImageSource} 
     */
    BadgeImageSource {
        get => this.get_BadgeImageSource()
        set => this.put_BadgeImageSource(value)
    }

    /**
     * Gets or sets the contact text to display on the badge.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.BadgeText](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.badgetext) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.badgetext
     * @type {HSTRING} 
     */
    BadgeText {
        get => this.get_BadgeText()
        set => this.put_BadgeText(value)
    }

    /**
     * Gets or sets a value that indicates whether the PersonPicture represents a group or an individual.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.IsGroup](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.isgroup) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.isgroup
     * @type {Boolean} 
     */
    IsGroup {
        get => this.get_IsGroup()
        set => this.put_IsGroup(value)
    }

    /**
     * Gets or sets a [Contact](../windows.applicationmodel.contacts/contact.md) object that contains information about the person.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.Contact](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.contact) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.contact
     * @type {Contact} 
     */
    Contact {
        get => this.get_Contact()
        set => this.put_Contact(value)
    }

    /**
     * Gets or sets the contact's display name.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.DisplayName](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.displayname) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets the contact's initials.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.Initials](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.initials) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.initials
     * @type {HSTRING} 
     */
    Initials {
        get => this.get_Initials()
        set => this.put_Initials(value)
    }

    /**
     * Gets or sets a value that indicates whether a small image is displayed rather than a large image when both are available.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.PreferSmallImage](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.prefersmallimage) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * If an image is available, the control displays the first image it finds, in this order:
     * 
     * 1. LargeDisplayPicture
     * 1. SmallDisplayPicture
     * 1. Thumbnail
     * 
     * You can change which image is chosen by setting the PreferSmallImage property to **true**. This gives the SmallDisplayPicture a higher priority than LargeDisplayPicture.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.prefersmallimage
     * @type {Boolean} 
     */
    PreferSmallImage {
        get => this.get_PreferSmallImage()
        set => this.put_PreferSmallImage(value)
    }

    /**
     * Gets or sets the source of the contact's profile picture.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.PersonPicture.ProfilePicture](/windows/winui/api/microsoft.ui.xaml.controls.personpicture.profilepicture) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.personpicture.profilepicture
     * @type {ImageSource} 
     */
    ProfilePicture {
        get => this.get_ProfilePicture()
        set => this.put_ProfilePicture(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BadgeNumber() {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.get_BadgeNumber()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BadgeNumber(value) {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.put_BadgeNumber(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BadgeGlyph() {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.get_BadgeGlyph()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_BadgeGlyph(value) {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.put_BadgeGlyph(value)
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_BadgeImageSource() {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.get_BadgeImageSource()
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_BadgeImageSource(value) {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.put_BadgeImageSource(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BadgeText() {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.get_BadgeText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_BadgeText(value) {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.put_BadgeText(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGroup() {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.get_IsGroup()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsGroup(value) {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.put_IsGroup(value)
    }

    /**
     * 
     * @returns {Contact} 
     */
    get_Contact() {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.get_Contact()
    }

    /**
     * 
     * @param {Contact} value 
     * @returns {HRESULT} 
     */
    put_Contact(value) {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.put_Contact(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Initials() {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.get_Initials()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Initials(value) {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.put_Initials(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PreferSmallImage() {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.get_PreferSmallImage()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PreferSmallImage(value) {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.put_PreferSmallImage(value)
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_ProfilePicture() {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.get_ProfilePicture()
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_ProfilePicture(value) {
        if (!this.HasProp("__IPersonPicture")) {
            if ((queryResult := this.QueryInterface(IPersonPicture.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPersonPicture := IPersonPicture(outPtr)
        }

        return this.__IPersonPicture.put_ProfilePicture(value)
    }

;@endregion Instance Methods
}

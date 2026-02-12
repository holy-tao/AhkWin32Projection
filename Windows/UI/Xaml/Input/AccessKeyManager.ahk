#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAccessKeyManager.ahk
#Include .\IAccessKeyManagerStatics.ahk
#Include .\IAccessKeyManagerStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A helper class that enables access keys (mnemonics) for XAML user interfaces.
 * @remarks
 * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
 * 
 * Available starting in Windows 10, version 1607.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.accesskeymanager
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class AccessKeyManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAccessKeyManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAccessKeyManager.IID

    /**
     * Gets a value that indicates whether the app has started an access key sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.accesskeymanager.isdisplaymodeenabled
     * @type {Boolean} 
     */
    static IsDisplayModeEnabled {
        get => AccessKeyManager.get_IsDisplayModeEnabled()
    }

    /**
     * Gets or sets a value that specifies whether keytips are shown for access keys.
     * @remarks
     * Keytips are badges displayed next to controls that support access keys when the user presses the Alt key. Each keytip contains the alphanumeric keys that activate the associated control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.accesskeymanager.arekeytipsenabled
     * @type {Boolean} 
     */
    static AreKeyTipsEnabled {
        get => AccessKeyManager.get_AreKeyTipsEnabled()
        set => AccessKeyManager.put_AreKeyTipsEnabled(value)
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsDisplayModeEnabled() {
        if (!AccessKeyManager.HasProp("__IAccessKeyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.AccessKeyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccessKeyManagerStatics.IID)
            AccessKeyManager.__IAccessKeyManagerStatics := IAccessKeyManagerStatics(factoryPtr)
        }

        return AccessKeyManager.__IAccessKeyManagerStatics.get_IsDisplayModeEnabled()
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_IsDisplayModeEnabledChanged(handler) {
        if (!AccessKeyManager.HasProp("__IAccessKeyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.AccessKeyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccessKeyManagerStatics.IID)
            AccessKeyManager.__IAccessKeyManagerStatics := IAccessKeyManagerStatics(factoryPtr)
        }

        return AccessKeyManager.__IAccessKeyManagerStatics.add_IsDisplayModeEnabledChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_IsDisplayModeEnabledChanged(token) {
        if (!AccessKeyManager.HasProp("__IAccessKeyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.AccessKeyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccessKeyManagerStatics.IID)
            AccessKeyManager.__IAccessKeyManagerStatics := IAccessKeyManagerStatics(factoryPtr)
        }

        return AccessKeyManager.__IAccessKeyManagerStatics.remove_IsDisplayModeEnabledChanged(token)
    }

    /**
     * Causes the app to exit an access key sequence.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.accesskeymanager.exitdisplaymode
     */
    static ExitDisplayMode() {
        if (!AccessKeyManager.HasProp("__IAccessKeyManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.AccessKeyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccessKeyManagerStatics.IID)
            AccessKeyManager.__IAccessKeyManagerStatics := IAccessKeyManagerStatics(factoryPtr)
        }

        return AccessKeyManager.__IAccessKeyManagerStatics.ExitDisplayMode()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_AreKeyTipsEnabled() {
        if (!AccessKeyManager.HasProp("__IAccessKeyManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.AccessKeyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccessKeyManagerStatics2.IID)
            AccessKeyManager.__IAccessKeyManagerStatics2 := IAccessKeyManagerStatics2(factoryPtr)
        }

        return AccessKeyManager.__IAccessKeyManagerStatics2.get_AreKeyTipsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    static put_AreKeyTipsEnabled(value) {
        if (!AccessKeyManager.HasProp("__IAccessKeyManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.AccessKeyManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAccessKeyManagerStatics2.IID)
            AccessKeyManager.__IAccessKeyManagerStatics2 := IAccessKeyManagerStatics2(factoryPtr)
        }

        return AccessKeyManager.__IAccessKeyManagerStatics2.put_AreKeyTipsEnabled(value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

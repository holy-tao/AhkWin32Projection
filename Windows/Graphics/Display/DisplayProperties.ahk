#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayPropertiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > DisplayProperties may be altered or unavailable for releases after Windows 8.1. Instead, use [DisplayInformation](displayinformation.md).
  * 
  *  Provides various properties that are related to the physical display. For most of these properties, the class provides events to allow clients to monitor for changes in the properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayproperties
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class DisplayProperties extends IInspectable {
;@region Static Properties
    /**
     * > [!NOTE]
     * > [DisplayProperties](displayproperties.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [DisplayInformation](displayinformation.md).
     * 
     *  Gets the current orientation of a rectangular monitor.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayproperties.currentorientation
     * @type {Integer} 
     */
    static CurrentOrientation {
        get => DisplayProperties.get_CurrentOrientation()
    }

    /**
     * > [!NOTE]
     * > [DisplayProperties](displayproperties.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [DisplayInformation](displayinformation.md).
     * 
     *  Gets the native orientation of the display monitor, which is typically the orientation where the buttons on the device match the orientation of the monitor.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayproperties.nativeorientation
     * @type {Integer} 
     */
    static NativeOrientation {
        get => DisplayProperties.get_NativeOrientation()
    }

    /**
     * > [!NOTE]
     * > [DisplayProperties](displayproperties.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [DisplayInformation](displayinformation.md).
     * 
     *  Gets and sets the preferred orientation of the app.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayproperties.autorotationpreferences
     * @type {Integer} 
     */
    static AutoRotationPreferences {
        get => DisplayProperties.get_AutoRotationPreferences()
        set => DisplayProperties.put_AutoRotationPreferences(value)
    }

    /**
     * > [!NOTE]
     * > [DisplayProperties](displayproperties.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [DisplayInformation](displayinformation.md).
     * 
     *  Gets the scale factor of the app window.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayproperties.resolutionscale
     * @type {Integer} 
     */
    static ResolutionScale {
        get => DisplayProperties.get_ResolutionScale()
    }

    /**
     * > [!NOTE]
     * > [DisplayProperties](displayproperties.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [DisplayInformation](displayinformation.md).
     * 
     *  Gets the pixels per logical inch of the current environment.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayproperties.logicaldpi
     * @type {Float} 
     */
    static LogicalDpi {
        get => DisplayProperties.get_LogicalDpi()
    }

    /**
     * > [!NOTE]
     * > [DisplayProperties](displayproperties.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [DisplayInformation](displayinformation.md).
     * 
     *  Gets a value that indicates whether the device supports stereoscopic 3D.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayproperties.stereoenabled
     * @type {Boolean} 
     */
    static StereoEnabled {
        get => DisplayProperties.get_StereoEnabled()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_CurrentOrientation() {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.get_CurrentOrientation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_NativeOrientation() {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.get_NativeOrientation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_AutoRotationPreferences() {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.get_AutoRotationPreferences()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    static put_AutoRotationPreferences(value) {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.put_AutoRotationPreferences(value)
    }

    /**
     * 
     * @param {DisplayPropertiesEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_OrientationChanged(handler) {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.add_OrientationChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_OrientationChanged(token) {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.remove_OrientationChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_ResolutionScale() {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.get_ResolutionScale()
    }

    /**
     * 
     * @returns {Float} 
     */
    static get_LogicalDpi() {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.get_LogicalDpi()
    }

    /**
     * 
     * @param {DisplayPropertiesEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_LogicalDpiChanged(handler) {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.add_LogicalDpiChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_LogicalDpiChanged(token) {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.remove_LogicalDpiChanged(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_StereoEnabled() {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.get_StereoEnabled()
    }

    /**
     * 
     * @param {DisplayPropertiesEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_StereoEnabledChanged(handler) {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.add_StereoEnabledChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_StereoEnabledChanged(token) {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.remove_StereoEnabledChanged(token)
    }

    /**
     * > [!NOTE]
     * > [DisplayProperties](displayproperties.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [DisplayInformation](displayinformation.md).
     * 
     *  Asynchronously gets the default International Color Consortium (ICC) color profile that is associated with the physical display.
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayproperties.getcolorprofileasync
     */
    static GetColorProfileAsync() {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.GetColorProfileAsync()
    }

    /**
     * 
     * @param {DisplayPropertiesEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_ColorProfileChanged(handler) {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.add_ColorProfileChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_ColorProfileChanged(token) {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.remove_ColorProfileChanged(token)
    }

    /**
     * 
     * @param {DisplayPropertiesEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_DisplayContentsInvalidated(handler) {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.add_DisplayContentsInvalidated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_DisplayContentsInvalidated(token) {
        if (!DisplayProperties.HasProp("__IDisplayPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayPropertiesStatics.IID)
            DisplayProperties.__IDisplayPropertiesStatics := IDisplayPropertiesStatics(factoryPtr)
        }

        return DisplayProperties.__IDisplayPropertiesStatics.remove_DisplayContentsInvalidated(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

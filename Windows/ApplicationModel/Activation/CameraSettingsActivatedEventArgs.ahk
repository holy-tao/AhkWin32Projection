#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICameraSettingsActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables a camera settings app to handle the activation parameters for the app.
  * 
  * <!--Enables an app to handle the activation parameters for the activation contracts supported by Windows.-->
  * 
  * > **JavaScript**
  * > This type appears as [WebUICameraSettingsActivatedEventArgs](../windows.ui.webui/webuicamerasettingsactivatedeventargs.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.camerasettingsactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class CameraSettingsActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICameraSettingsActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICameraSettingsActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the object that controls device settings on the camera.
     * @remarks
     * Do not declare device capabilities for webcam or location. Those capabilities will cause a prompt for permissions to appear, which will obstruct the UI in your UWP app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.camerasettingsactivatedeventargs.videodevicecontroller
     * @type {IInspectable} 
     */
    VideoDeviceController {
        get => this.get_VideoDeviceController()
    }

    /**
     * Gets the object that implements additional extended settings for the camera.
     * @remarks
     * Do not declare device capabilities for webcam or location. Those capabilities will cause a prompt for permissions to appear, which will obstruct the UI in your UWP app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.camerasettingsactivatedeventargs.videodeviceextension
     * @type {IInspectable} 
     */
    VideoDeviceExtension {
        get => this.get_VideoDeviceExtension()
    }

    /**
     * Gets the activation type.
     * @remarks
     * If Kind is **CameraSettings**, the app should open using a flyout. If Kind is **Launched**, it should open full-screen.
     * 
     * 
     * 
     * > [!NOTE]
     * > Do not declare device capabilities for webcam or location. Those capabilities will cause a prompt for permissions to appear, which will obstruct the UI in your UWP app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.camerasettingsactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.camerasettingsactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object which provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.camerasettingsactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_VideoDeviceController() {
        if (!this.HasProp("__ICameraSettingsActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICameraSettingsActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraSettingsActivatedEventArgs := ICameraSettingsActivatedEventArgs(outPtr)
        }

        return this.__ICameraSettingsActivatedEventArgs.get_VideoDeviceController()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_VideoDeviceExtension() {
        if (!this.HasProp("__ICameraSettingsActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICameraSettingsActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraSettingsActivatedEventArgs := ICameraSettingsActivatedEventArgs(outPtr)
        }

        return this.__ICameraSettingsActivatedEventArgs.get_VideoDeviceExtension()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreviousExecutionState() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_PreviousExecutionState()
    }

    /**
     * 
     * @returns {SplashScreen} 
     */
    get_SplashScreen() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_SplashScreen()
    }

;@endregion Instance Methods
}

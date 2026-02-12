#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameworkView.ahk
#Include ..\..\ApplicationModel\Core\IFrameworkView.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the UI window of an application.
 * @remarks
 * This class provides the infrastructure support so that the [Application](application.md) class has correct threading and object lifetime considerations for the [IFrameworkView](../windows.applicationmodel.core/iframeworkview.md) pattern used by the core app model. Most UWP app using C++, C#, or Visual Basic development scenarios don't do anything with this class directly.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkview
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class FrameworkView extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameworkView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameworkView.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [FrameworkView](frameworkview.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.FrameworkView")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Initializes the view.
     * @param {CoreApplicationView} applicationView_ The view object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkview.initialize
     */
    Initialize(applicationView_) {
        if (!this.HasProp("__IFrameworkView")) {
            if ((queryResult := this.QueryInterface(IFrameworkView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkView := IFrameworkView(outPtr)
        }

        return this.__IFrameworkView.Initialize(applicationView_)
    }

    /**
     * Associates a [Window](window.md) with a view.
     * @param {CoreWindow} window_ The [Window](window.md) to associate.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkview.setwindow
     */
    SetWindow(window_) {
        if (!this.HasProp("__IFrameworkView")) {
            if ((queryResult := this.QueryInterface(IFrameworkView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkView := IFrameworkView(outPtr)
        }

        return this.__IFrameworkView.SetWindow(window_)
    }

    /**
     * Loads the view.
     * @param {HSTRING} entryPoint An identifier, such as a class name from the application code, that provides additional information about the view.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkview.load
     */
    Load(entryPoint) {
        if (!this.HasProp("__IFrameworkView")) {
            if ((queryResult := this.QueryInterface(IFrameworkView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkView := IFrameworkView(outPtr)
        }

        return this.__IFrameworkView.Load(entryPoint)
    }

    /**
     * Passes execution to the view provider.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkview.run
     */
    Run() {
        if (!this.HasProp("__IFrameworkView")) {
            if ((queryResult := this.QueryInterface(IFrameworkView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkView := IFrameworkView(outPtr)
        }

        return this.__IFrameworkView.Run()
    }

    /**
     * Returns the view to the uninitialized state.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworkview.uninitialize
     */
    Uninitialize() {
        if (!this.HasProp("__IFrameworkView")) {
            if ((queryResult := this.QueryInterface(IFrameworkView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkView := IFrameworkView(outPtr)
        }

        return this.__IFrameworkView.Uninitialize()
    }

;@endregion Instance Methods
}

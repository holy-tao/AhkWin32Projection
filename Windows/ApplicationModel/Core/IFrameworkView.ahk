#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents an app view provider.
 * @remarks
 * Object that implement this interface should be returned by the [CreateView](iframeworkviewsource_createview_164792513.md) method on your implementation of [IFrameworkViewSource](iframeworkviewsource.md), which is a factory type interface.
 * 
 * These three methods are called, in order, after the app object (defined by a [CoreApplication](coreapplication.md) singleton instance) has started.
 * + [Initialize](iframeworkview_initialize_1389154906.md)
 * + [Load](iframeworkview_load_1077941801.md)
 * + [Run](coreapplication_run_1480028297.md)
 * 
 * The following code example demonstrates how you can use IFrameworkView to implement a simple Direct3D view provider.
 * 
 * ```cppwinrt
 * // App.cpp in a CoreApp project.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.iframeworkview
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class IFrameworkView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkView
     * @type {Guid}
     */
    static IID => Guid("{faab5cd0-8924-45ac-ad0f-a08fae5d0324}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "SetWindow", "Load", "Run", "Uninitialize"]

    /**
     * Initializes the app view. Called when an app object is launched.
     * @remarks
     * This method is called by [CoreApplication.Run](coreapplication_run_1480028297.md) on the view object that implements this interface. It is the first method called on the view implementation when the app object is activated.
     * @param {CoreApplicationView} applicationView_ The default view provided by the app object. You can use this instance in your implementation to obtain the [CoreWindow](coreapplicationview_corewindow.md) created by the app object, and register callbacks for the [Activated](coreapplicationview_activated.md) event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.iframeworkview.initialize
     */
    Initialize(applicationView_) {
        result := ComCall(6, this, "ptr", applicationView_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the current window for the app object's view.
     * @remarks
     * The app object calls your implementation of this method whenever it needs to set the current window, represented as a [CoreWindow](../windows.ui.core/corewindow.md) instance, for the associated view. Your implementation must at least assign the provided window to the view and register for any view and window events.
     * @param {CoreWindow} window_ The current window for the app object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.iframeworkview.setwindow
     */
    SetWindow(window_) {
        result := ComCall(7, this, "ptr", window_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads or activates any external resources used by the app view before [Run](coreapplication_run_1480028297.md) is called.
     * @remarks
     * If you are implementing a DirectX view provider, in this method you create DirectX-specific resources for your view, like the render target surface and the attached swap chain. If you are activating an out-of-process Windows Runtime type, the app object supplies the name of the entry point method for that type.
     * @param {HSTRING} entryPoint The name of the entry point method for the activated type.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.iframeworkview.load
     */
    Load(entryPoint) {
        if(entryPoint is String) {
            pin := HSTRING.Create(entryPoint)
            entryPoint := pin.Value
        }
        entryPoint := entryPoint is Win32Handle ? NumGet(entryPoint, "ptr") : entryPoint

        result := ComCall(8, this, "ptr", entryPoint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Starts the app view.
     * @remarks
     * Your implementation of this method must at least activate the [CoreWindow](../windows.ui.core/corewindow.md) instance associated with the view, and start the event dispatcher for this window by calling [ProcessEvents](../windows.ui.core/coredispatcher_processevents_1611214514.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.iframeworkview.run
     */
    Run() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Uninitializes the app view and releases external resources.
     * @remarks
     * Your implementation of this method should clean up any external resources created during the previous call to [Load](iframeworkview_load_1077941801.md) when you created the app view.
     * 
     * This method is called when the app view is being terminated, and it provides an opportunity to release any resources that were allocated for the view. You should ensure that all resources are properly released to avoid memory leaks or other issues. It is not intended to be used to clean up resources when exiting the app. You can clean up app resources when exiting with [CoreApplication.Suspending](coreapplication_suspending.md) or [CoreApplication.Exiting](coreapplication_exiting.md) event handlers.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.iframeworkview.uninitialize
     */
    Uninitialize() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

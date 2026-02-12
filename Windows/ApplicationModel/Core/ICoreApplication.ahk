#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\Collections\IPropertySet.ahk
#Include .\CoreApplicationView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Adds an error handling event for global error handling from the system that app models can use.
 * @remarks
 * The ICoreApplicationUnhandledError mechanism for error handling is primarily for C++ developers who are using Microsoft DirectX. For UWP app using C++, C#, or Visual Basic you should handle [UnhandledException](../windows.ui.xaml/application_unhandledexception.md), which is exposed by the [Application](../windows.ui.xaml/application.md) object in that app model.
 * 
 * Most scenarios won't use this interface for either implementation or casting. Instead, most app scenarios will use [CoreApplication.UnhandledErrorDetected](coreapplication_unhandlederrordetected.md) or similar events provided by the app models for UI frameworks.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.icoreapplicationunhandlederror
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class ICoreApplication extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreApplication
     * @type {Guid}
     */
    static IID => Guid("{0aacf7a4-5e1d-49df-8034-fb6a68bc5ed1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "add_Suspending", "remove_Suspending", "add_Resuming", "remove_Resuming", "get_Properties", "GetCurrentView", "Run", "RunWithActivationFactories"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {EventHandler<SuspendingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Suspending(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Suspending(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Resuming(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Resuming(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(value)
    }

    /**
     * 
     * @returns {CoreApplicationView} 
     */
    GetCurrentView() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreApplicationView(value)
    }

    /**
     * The expert must implement the Run function. Network Monitor calls the Run function to start the expert within the expert DLL.
     * @remarks
     * When running, the expert loops through the frames in the capture file and either generates a report or creates events that show problems.
     * @param {IFrameworkViewSource} viewSource 
     * @returns {HRESULT} If the function is successful (that is, if the expert starts), the return value is **TRUE**.
     * 
     * If the function is unsuccessful, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/run
     */
    Run(viewSource) {
        result := ComCall(13, this, "ptr", viewSource, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IGetActivationFactory} activationFactoryCallback 
     * @returns {HRESULT} 
     */
    RunWithActivationFactories(activationFactoryCallback) {
        result := ComCall(14, this, "ptr", activationFactoryCallback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

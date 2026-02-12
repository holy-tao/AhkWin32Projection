#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
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
class ICoreApplicationUnhandledError extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreApplicationUnhandledError
     * @type {Guid}
     */
    static IID => Guid("{f0e24ab0-dd09-42e1-b0bc-e0e131f78d7e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_UnhandledErrorDetected", "remove_UnhandledErrorDetected"]

    /**
     * 
     * @param {EventHandler<UnhandledErrorDetectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnhandledErrorDetected(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_UnhandledErrorDetected(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

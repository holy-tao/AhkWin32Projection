#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ResourceDictionary.ahk
#Include .\DebugSettings.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides methods which activate Windows Store apps for the Launch, File, and Protocol extensions. You will normally use this interface in debuggers and design tools.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Do not implement this interface yourself. Windows provides an implementation as part of the CApplicationActivationManager class. To get an instance of this class, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with the CLSID_ApplicationActivationManager class ID.
 * 
 * <h3><a id="Usage_notes"></a><a id="usage_notes"></a><a id="USAGE_NOTES"></a>Usage notes</h3>
 * An <b>IApplicationActivationManager</b> object creates a thread in its host process to serve any activated event arguments objects (<a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.activation.launchactivatedeventargs">LaunchActivatedEventArgs</a>, <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.activation.fileactivatedeventargs">FileActivatedEventArgs</a>, and <a href="https://docs.microsoft.com/uwp/api/windows.applicationmodel.activation.protocolactivatedeventargs">ProtocolActivatedEventArgs</a>) that are passed to the app. If the calling process is long-lived, you can create this object in-proc, based on the assumption that the event arguments will exist long enough for the target app to use them. However, if the calling process is spawned only to launch the target app, it should create the <b>IApplicationActivationManager</b> object out-of-process, by using CLSCTX_LOCAL_SERVER. This causes the object to be created in a Dllhost.exe instance that automatically manages the object's lifetime based on outstanding references to the activated event argument objects.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-iapplicationactivationmanager
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IApplication extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplication
     * @type {Guid}
     */
    static IID => Guid("{74b861a1-7487-46a9-9a6e-c78b512726c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Resources", "put_Resources", "get_DebugSettings", "get_RequestedTheme", "put_RequestedTheme", "add_UnhandledException", "remove_UnhandledException", "add_Suspending", "remove_Suspending", "add_Resuming", "remove_Resuming", "Exit"]

    /**
     * @type {ResourceDictionary} 
     */
    Resources {
        get => this.get_Resources()
        set => this.put_Resources(value)
    }

    /**
     * @type {DebugSettings} 
     */
    DebugSettings {
        get => this.get_DebugSettings()
    }

    /**
     * @type {Integer} 
     */
    RequestedTheme {
        get => this.get_RequestedTheme()
        set => this.put_RequestedTheme(value)
    }

    /**
     * 
     * @returns {ResourceDictionary} 
     */
    get_Resources() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResourceDictionary(value)
    }

    /**
     * 
     * @param {ResourceDictionary} value 
     * @returns {HRESULT} 
     */
    put_Resources(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DebugSettings} 
     */
    get_DebugSettings() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DebugSettings(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestedTheme() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RequestedTheme(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {UnhandledExceptionEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UnhandledException(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
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
    remove_UnhandledException(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SuspendingEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Suspending(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(14, this, "ptr", token, "int")
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
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * ExitCode Property (SqlService Class)
     * @remarks
     * This property is set to ERROR_SERVICE_SPECIFIC_ERROR (1066) when the error is unique to the service represented by this class. The service sets this value to NO_ERROR when running, and again upon normal termination.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/wmi-provider-configuration-classes/sqlservice-class/exitcode-property-sqlservice-class
     */
    Exit() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

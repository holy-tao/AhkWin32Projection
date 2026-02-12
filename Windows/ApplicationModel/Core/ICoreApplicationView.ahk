#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\UI\Core\CoreWindow.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Occurs when a Windows Store app is activated.
 * @remarks
 * Do not call the [**Exit**](/previous-versions//hh438368(v=vs.85)) method from within *handler*.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/WinRT/icoreapplicationview-activated
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class ICoreApplicationView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreApplicationView
     * @type {Guid}
     */
    static IID => Guid("{638bb2db-451d-4661-b099-414f34ffb9f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CoreWindow", "add_Activated", "remove_Activated", "get_IsMain", "get_IsHosted"]

    /**
     * @type {CoreWindow} 
     */
    CoreWindow {
        get => this.get_CoreWindow()
    }

    /**
     * @type {Boolean} 
     */
    IsMain {
        get => this.get_IsMain()
    }

    /**
     * @type {Boolean} 
     */
    IsHosted {
        get => this.get_IsHosted()
    }

    /**
     * 
     * @returns {CoreWindow} 
     */
    get_CoreWindow() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreWindow(value)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreApplicationView, IActivatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Activated(handler) {
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
    remove_Activated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMain() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHosted() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}

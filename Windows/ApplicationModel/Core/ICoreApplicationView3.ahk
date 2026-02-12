#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CoreApplicationViewTitleBar.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class ICoreApplicationView3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreApplicationView3
     * @type {Guid}
     */
    static IID => Guid("{07ebe1b3-a4cf-4550-ab70-b07e85330bc8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsComponent", "get_TitleBar", "add_HostedViewClosing", "remove_HostedViewClosing"]

    /**
     * @type {Boolean} 
     */
    IsComponent {
        get => this.get_IsComponent()
    }

    /**
     * @type {CoreApplicationViewTitleBar} 
     */
    TitleBar {
        get => this.get_TitleBar()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComponent() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {CoreApplicationViewTitleBar} 
     */
    get_TitleBar() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreApplicationViewTitleBar(value)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreApplicationView, HostedViewClosingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HostedViewClosing(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_HostedViewClosing(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
